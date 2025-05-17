package com.example.ovacostos.dto;

public class EquilibrioResponse {

    private double puntoEquilibrio;

    public EquilibrioResponse(double puntoEquilibrio) {
        this.puntoEquilibrio = puntoEquilibrio;
    }

    public double getPuntoEquilibrio() {
        return puntoEquilibrio;
    }

    public void setPuntoEquilibrio(double puntoEquilibrio) {
        this.puntoEquilibrio = puntoEquilibrio;
    }
}
