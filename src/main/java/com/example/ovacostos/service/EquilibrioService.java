package com.example.ovacostos.service;

import org.springframework.stereotype.Service;

@Service
public class EquilibrioService {

    private final EquilibrioServiceNativo servicioNativo;

    public EquilibrioService() {
        this.servicioNativo = new EquilibrioServiceNativo();
    }

    public double calcular(double costoFijo, double precioVenta, double costoVariable) {
        if (precioVenta <= costoVariable) {
            throw new IllegalArgumentException("El precio de venta debe ser mayor al costo variable.");
        }
        return servicioNativo.calcularPuntoEquilibrio(costoFijo, precioVenta, costoVariable);
    }
}
