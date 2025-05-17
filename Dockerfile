FROM openjdk:23-jdk-slim

LABEL authors="angiecobo"

RUN apt-get update && apt-get install -y build-essential

WORKDIR /app

# Copiar el archivo JAR al contenedor
COPY target/punto-equilibrio-1.0.0.jar app.jar

# Copiar el código fuente C
COPY src/main/cpp src/main/cpp

# Compilar C y ensamblador
RUN gcc -fPIC -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" \
    -c src/main/cpp/punto_equilibrio.c -o punto_equilibrio.o

RUN gcc -fPIC -c src/main/cpp/aritmetica.s -o aritmetica.o

RUN gcc -shared -z noexecstack -o libpuntoequilibrio.so punto_equilibrio.o aritmetica.o

RUN mv libpuntoequilibrio.so /usr/lib/

ENTRYPOINT ["java", "-jar", "app.jar"]


