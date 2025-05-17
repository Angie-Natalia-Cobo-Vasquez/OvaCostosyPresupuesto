package com.example.ovacostos.dto;

public class EquilibrioRequest {

        private double costoFijo;
        private double precioVenta;
        private double costoVariable;

        public double getCostoFijo() {
                return costoFijo;
        }

        public void setCostoFijo(double costoFijo) {
                this.costoFijo = costoFijo;
        }

        public double getPrecioVenta() {
                return precioVenta;
        }

        public void setPrecioVenta(double precioVenta) {
                this.precioVenta = precioVenta;
        }

        public double getCostoVariable() {
                return costoVariable;
        }

        public void setCostoVariable(double costoVariable) {
                this.costoVariable = costoVariable;
        }
}
