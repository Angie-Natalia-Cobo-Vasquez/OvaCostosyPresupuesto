# API de Punto de Equilibrio

Este servicio proporciona un endpoint para calcular el punto de equilibrio dada una estructura de costos y precios.

## Endpoint

**POST** `/api/equilibrio`

## Descripción

Este endpoint recibe los parámetros necesarios para calcular el punto de equilibrio basado en costos fijos, precio unitario y costo variable unitario. La solicitud debe enviar un cuerpo en formato JSON que contenga estos datos.

## Campos de la solicitud (`EquilibrioRequest`)

### `costoFijo` (Double)
- **Descripción**: El costo fijo total.
- **Restricciones**: Debe ser un valor numérico positivo.
- **Ejemplo**: `1000.0`

### `precioUnitario` (Double)
- **Descripción**: El precio de venta por unidad.
- **Restricciones**: Debe ser un valor numérico positivo, mayor que el costo variable unitario.
- **Ejemplo**: `50.0`

### `costoVariableUnitario` (Double)
- **Descripción**: El costo variable por unidad.
- **Restricciones**: Debe ser un valor numérico positivo, menor que el precio unitario.
- **Ejemplo**: `40.0`

### `unidadesInicial` (Integer)
- **Descripción**: Un valor inicial de unidades para el cálculo (opcional, puede usarse para contextos específicos).
- **Restricciones**: Debe ser un entero no negativo.
- **Ejemplo**: `50`

---

## Ejemplo de solicitud método Java

### Solicitud `POST`

```bash
curl -X POST http://localhost:8080/api/equilibrio/java \
  -H "Content-Type: application/json" \
  -d '{
    "costoFijo": 1000.0,
    "precioUnitario": 50.0,
    "costoVariableUnitario": 40.0,
    "unidadesInicial": 50
}'
