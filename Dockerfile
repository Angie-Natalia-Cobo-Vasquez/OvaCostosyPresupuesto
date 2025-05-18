# Etapa 1: Construcción
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Ejecución
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=builder /app/target/punto-equilibrio-1.0.0.jar ./app.jar
COPY libpuntoequilibrio.so /usr/lib/libpuntoequilibrio.so
ENV LD_LIBRARY_PATH=/usr/lib
ENTRYPOINT ["java", "-jar", "app.jar"]

