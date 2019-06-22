Difference Scores (HPA-LNA)

COMPUTE r1hpalna = r$hpa1-r$lna1 .
VARIABLE LABELS r1hpalna 'Difference Score: r$hpa1-r$lna1' .
EXECUTE .

COMPUTE i1hpalna = i$hpa1-i$lna1 .
VARIABLE LABELS i1hpalna 'Difference Score: i$hpa1-i$lna1' .
EXECUTE .

COMPUTE r2hpalna = r$hpa2-r$lna2 .
VARIABLE LABELS r2hpalna 'Difference Score: r$hpa2-r$lna2' .
EXECUTE .

COMPUTE i2hpalna = i$hpa2-i$lna2 .
VARIABLE LABELS i2hpalna 'Difference Score: i$hpa2-i$lna2' .
EXECUTE .

COMPUTE p$hpalna = p$hpa-p$lna .
VARIABLE LABELS p$hpalna 'Difference Score: p$hpa-p$lna'.
EXECUTE .
