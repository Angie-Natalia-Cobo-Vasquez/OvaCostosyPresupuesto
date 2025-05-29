# Etapa 1: Compilación del .jar y la .so
# Etapa 1: Compilación del .jar y la .so
FROM maven:3.9.6-eclipse-temurin-21 AS builder

WORKDIR /app
COPY . .

# Instalar GCC y JDK para JNI
RUN apt-get update && \
    apt-get install -y gcc openjdk-21-jdk && \
    apt-get clean

# Variables JNI
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV C_INCLUDE_PATH=$JAVA_HOME/include:$JAVA_HOME/include/linux

# Compilar archivos ASM y C
RUN gcc -c -fPIC src/main/cpp/aritmetica.s -o aritmetica.o && \
    gcc -c -fPIC src/main/cpp/punto_equilibrio.c -o punto_equilibrio.o -I$JAVA_HOME/include -I$JAVA_HOME/include/linux && \
    gcc -shared -o libpuntoequilibrio.so punto_equilibrio.o aritmetica.o

# Compilar el .jar de Spring Boot
RUN mvn clean package -DskipTests

# Etapa 2: Imagen final
FROM eclipse-temurin:21-jdk
WORKDIR /app

COPY --from=builder /app/target/OvaCostos-0.0.1-SNAPSHOT.jar ./app.jar
COPY --from=builder /app/libpuntoequilibrio.so /usr/lib/
ENV LD_LIBRARY_PATH=/usr/lib

ENTRYPOINT ["java", "-jar", "app.jar"]

