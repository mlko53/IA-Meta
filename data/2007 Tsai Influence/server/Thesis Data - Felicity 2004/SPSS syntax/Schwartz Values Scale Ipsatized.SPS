Values Scale Ipsatized

compute asvsmean = mean (asvs1, asvs2, asvs3, asvs4, asvs5,
asvs6, asvs7, asvs8, asvs9, asvs10)
.
compute asvssd = sd (asvs1, asvs2, asvs3, asvs4, asvs5,
asvs6, asvs7, asvs8, asvs9, asvs10)
.
execute.

compute asvs1i = (asvs1 - asvsmean)/asvssd.
compute asvs2i = (asvs2 - asvsmean)/asvssd.
compute asvs3i = (asvs3 - asvsmean)/asvssd.
compute asvs4i = (asvs4 - asvsmean)/asvssd.
compute asvs5i = (asvs5 - asvsmean)/asvssd.
compute asvs6i = (asvs6 - asvsmean)/asvssd.
compute asvs7i = (asvs7 - asvsmean)/asvssd.
compute asvs8i = (asvs8 - asvsmean)/asvssd.
compute asvs9i = (asvs9 - asvsmean)/asvssd.
compute asvs10i = (asvs10 - asvsmean)/asvssd.
.
execute.



Aggregates for Schwartz Values Scale

COMPUTE enhancei = Mean (asvs3i, asvs4i, asvs5i) .
VARIABLE LABELS enhancei 'Valuing Self-Enhancement Ipsatized' .
EXECUTE .

COMPUTE effacei = Mean (asvs8i, asvs9i, asvs10i) .
VARIABLE LABELS effacei 'Valuing Self-Effacement Ipsatized' .
EXECUTE .


