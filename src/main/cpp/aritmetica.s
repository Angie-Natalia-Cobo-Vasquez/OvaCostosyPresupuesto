.text

.global suma
suma:
    addsd %xmm1, %xmm0
    ret

.global dividir
dividir:
    divsd %xmm1, %xmm0
    ret

.global resta
resta:
    subsd %xmm1, %xmm0
    ret

.global multiplicar
multiplicar:
    mulsd %xmm1, %xmm0
    ret

