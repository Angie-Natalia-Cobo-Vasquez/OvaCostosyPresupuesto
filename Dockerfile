FROM openjdk:23-jdk-slim

LABEL authors="angiecobo"

# Instalar compilador y herramientas necesarias
RUN apt-get update && apt-get install -y build-essential

# Regresar al directorio raíz del proyecto
WORKDIR /app

COPY . .

# Compilar el archivo C para JNI
RUN gcc -fPIC -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" \
    -c src/main/cpp/punto_equilibrio.c -o punto_equilibrio.o

# Compilar el archivo de ensamblador (AT&T syntax)
RUN gcc -fPIC -c src/main/cpp/aritmetica.s -o aritmetica.o

# Crear la biblioteca compartida .so
RUN gcc -shared -z noexecstack -o libpuntoequilibrio.so punto_equilibrio.o aritmetica.o

# Mover la librería al sistema para que Java la encuentre
RUN mv libpuntoequilibrio.so /usr/lib/

# Comando para iniciar el microservicio
ENTRYPOINT ["java", "-jar", "target/punto-equilibrio-1.0.0.jar"]