package com.example.ovacostos.service;

public class EquilibrioServiceNativo {

    static {
        System.load("D:\\OvaCostos\\lib\\libpuntoequilibrio.so");
    }

    // Método nativo
    public native double calcularPuntoEquilibrio(double costosFijos, double precioVenta, double costoVariable);

}
