Values Scale Ipsatized

compute gvsimean = mean (g$asvs1, g$asvs2, g$asvs3, g$asvs4, g$asvs5,
g$asvs6, g$asvs7, g$asvs8, g$asvs9, g$asvs10)
.
compute gvsisd = sd (g$asvs1, g$asvs2, g$asvs3, g$asvs4, g$asvs5,
g$asvs6, g$asvs7, g$asvs8, g$asvs9, g$asvs10)
.
execute.

compute g$svs1i = (g$asvs1 - gvsimean)/gvsisd.
compute g$svs2i = (g$asvs2 - gvsimean)/gvsisd.
compute g$svs3i = (g$asvs3 - gvsimean)/gvsisd.
compute g$svs4i = (g$asvs4 - gvsimean)/gvsisd.
compute g$svs5i = (g$asvs5 - gvsimean)/gvsisd.
compute g$svs6i = (g$asvs6 - gvsimean)/gvsisd.
compute g$svs7i = (g$asvs7 - gvsimean)/gvsisd.
compute g$svs8i = (g$asvs8 - gvsimean)/gvsisd.
compute g$svs9i = (g$asvs9 - gvsimean)/gvsisd.
compute g$svs10i = (g$asvs10 - gvsimean)/gvsisd.
.
execute.





Aggregates for Global Schwartz Values Scale

COMPUTE g$enhani = Mean (g$svs3i, g$svs4i, g$svs5i) .
VARIABLE LABELS g$enhani 'Global Valuing Self-Enhancement Ipsatized' .
EXECUTE .

COMPUTE g$effaci = Mean (g$svs8i, g$svs9i, g$svs10i) .
VARIABLE LABELS g$effaci 'Global Valuing Self-Effacement Ipsatized' .
EXECUTE .



