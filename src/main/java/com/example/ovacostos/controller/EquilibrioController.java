package com.example.ovacostos.controller;

import com.example.ovacostos.service.EquilibrioServiceNativo;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/equilibrio")
public class EquilibrioController {

    private final EquilibrioServiceNativo service = new EquilibrioServiceNativo();

    @PostMapping("/calcular")
    public Map<String, Object> calcularPuntoEquilibrio(@RequestBody Map<String, Double> datos) {
        double costoFijo = datos.getOrDefault("costoFijo", 0.0);
        double precioVenta = datos.getOrDefault("precioVenta", 0.0);
        double costoVariable = datos.getOrDefault("costoVariable", 0.0);

        double resultado = service.calcularPuntoEquilibrio(costoFijo, precioVenta, costoVariable);

        return Map.of("puntoEquilibrio", resultado);
    }
}
