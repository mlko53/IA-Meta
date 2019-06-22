Aggregates for Schwartz Values Scale

COMPUTE enhance = Mean (asvs3, asvs4, asvs5) .
VARIABLE LABELS enhance 'Valuing Self-Enhancement' .
EXECUTE .

COMPUTE efface = Mean (asvs8, asvs9, asvs10) .
VARIABLE LABELS efface 'Valuing Self-Effacement' .
EXECUTE .


Aggregates for Global Schwartz Values Scale

COMPUTE g$enhanc = Mean (g$asvs3, g$asvs4, g$asvs5) .
VARIABLE LABELS g$enhanc 'Global Valuing Self-Enhancement' .
EXECUTE .

COMPUTE g$efface = Mean (g$asvs8, g$asvs9, g$asvs10) .
VARIABLE LABELS g$efface 'Global Valuing Self-Effacement' .
EXECUTE .
