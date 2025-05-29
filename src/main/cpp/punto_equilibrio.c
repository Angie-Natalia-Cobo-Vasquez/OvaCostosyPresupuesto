#include "com_example_ovacostos_EquilibrioServiceNativo.h"

#include <jni.h>

extern double resta(double a, double b);
extern double dividir(double a, double b);

JNIEXPORT jdouble JNICALL Java_com_example_ovacostos_service_EquilibrioServiceNativo_calcularPuntoEquilibrio
  (JNIEnv *env, jobject obj, jdouble cf, jdouble pv, jdouble cv) {
    double diferencia = resta(pv, cv);
    if (diferencia == 0) return -1;
    return dividir(cf, diferencia);
}

