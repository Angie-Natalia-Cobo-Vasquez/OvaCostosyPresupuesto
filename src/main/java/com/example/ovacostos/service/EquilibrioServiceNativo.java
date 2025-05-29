package com.example.ovacostos.service;

public class EquilibrioServiceNativo {

    static {
        System.loadLibrary("puntoequilibrio");
    }

    // Método nativo
    public native double calcularPuntoEquilibrio(double costosFijos, double precioVenta, double costoVariable);

}
