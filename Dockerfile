# Etapa 1: Build con Maven y compilación JNI
FROM maven:3.9.6-eclipse-temurin-21 AS builder

WORKDIR /app
COPY . .

# Instalar solo GCC (no reinstalar JDK innecesariamente)
RUN apt-get update && \
    apt-get install -y gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Variables JNI
ENV JAVA_HOME=/opt/java/openjdk
ENV C_INCLUDE_PATH=$JAVA_HOME/include:$JAVA_HOME/include/linux

# Compilar archivos ASM y C
RUN gcc -c -fPIC src/main/cpp/aritmetica.s -o aritmetica.o && \
    gcc -c -fPIC src/main/cpp/punto_equilibrio.c -o punto_equilibrio.o -I$JAVA_HOME/include -I$JAVA_HOME/include/linux && \
    gcc -shared -o libpuntoequilibrio.so punto_equilibrio.o aritmetica.o

# Compilar el .jar con Maven
RUN mvn clean package -DskipTests

# Etapa 2: Imagen final
FROM eclipse-temurin:21-jdk

WORKDIR /app
COPY --from=builder /app/target/OvaCostos-0.0.1-SNAPSHOT.jar ./app.jar
COPY --from=builder /app/libpuntoequilibrio.so /usr/lib/

ENV LD_LIBRARY_PATH=/usr/lib
ENTRYPOINT ["java", "-jar", "app.jar"]


