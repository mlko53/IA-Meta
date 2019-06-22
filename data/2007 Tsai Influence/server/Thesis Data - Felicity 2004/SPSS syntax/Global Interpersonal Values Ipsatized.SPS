title 'Global Interpersonal Values Ipsatized'.

compute gipvmean = mean (g$ipv1, g$ipv2, g$ipv3, g$ipv4, g$ipv5, g$ipv5, g$ipv6, g$ipv7, g$ipv8,
 g$ipv9, g$ipv10, g$ipv11, g$ipv12, g$ipv13, g$ipv14, g$ipv15, g$ipv16, 
g$ipv17, g$ipv18, g$ipv19, g$ipv20, g$ipv21, g$ipv22, g$ipv23, g$ipv24,
g$ipv25, g$ipv26, g$ipv27, g$ipv28, g$ipv29, g$ipv30, g$ipv31, g$ipv32)
.
compute gipvsd = sd (g$ipv1, g$ipv2, g$ipv3, g$ipv4, g$ipv5, g$ipv5, g$ipv6, g$ipv7, g$ipv8,
 g$ipv9, g$ipv10, g$ipv11, g$ipv12, g$ipv13, g$ipv14, g$ipv15, g$ipv16, 
g$ipv17, g$ipv18, g$ipv19, g$ipv20, g$ipv21, g$ipv22, g$ipv23, g$ipv24,
g$ipv25, g$ipv26, g$ipv27, g$ipv28, g$ipv29, g$ipv30, g$ipv31, g$ipv32)
.
execute.

compute g$ipv1i = (g$ipv1 - gipvmean)/gipvsd.
compute g$ipv2i = (g$ipv2 - gipvmean)/gipvsd.
compute g$ipv3i = (g$ipv3 - gipvmean)/gipvsd.
compute g$ipv4i = (g$ipv4 - gipvmean)/gipvsd.
compute g$ipv5i = (g$ipv5 - gipvmean)/gipvsd.
compute g$ipv6i = (g$ipv6 - gipvmean)/gipvsd.
compute g$ipv7i = (g$ipv7 - gipvmean)/gipvsd.
compute g$ipv8i = (g$ipv8 - gipvmean)/gipvsd.
compute g$ipv9i = (g$ipv9 - gipvmean)/gipvsd.
compute g$ipv10i = (g$ipv10 - gipvmean)/gipvsd.
compute g$ipv11i = (g$ipv11 - gipvmean)/gipvsd.
compute g$ipv12i = (g$ipv12 - gipvmean)/gipvsd.
compute g$ipv13i = (g$ipv13 - gipvmean)/gipvsd.
compute g$ipv14i = (g$ipv14 - gipvmean)/gipvsd.
compute g$ipv15i = (g$ipv15 - gipvmean)/gipvsd.
compute g$ipv16i = (g$ipv16 - gipvmean)/gipvsd.
compute g$ipv17i = (g$ipv17 - gipvmean)/gipvsd.
compute g$ipv18i = (g$ipv18 - gipvmean)/gipvsd.
compute g$ipv19i = (g$ipv19 - gipvmean)/gipvsd.
compute g$ipv20i = (g$ipv20 - gipvmean)/gipvsd.
compute g$ipv21i = (g$ipv21 - gipvmean)/gipvsd.
compute g$ipv22i = (g$ipv22 - gipvmean)/gipvsd.
compute g$ipv23i = (g$ipv23 - gipvmean)/gipvsd.
compute g$ipv24i = (g$ipv24 - gipvmean)/gipvsd.
compute g$ipv25i = (g$ipv25 - gipvmean)/gipvsd.
compute g$ipv26i = (g$ipv26 - gipvmean)/gipvsd.
compute g$ipv27i = (g$ipv27 - gipvmean)/gipvsd.
compute g$ipv28i = (g$ipv28 - gipvmean)/gipvsd.
compute g$ipv29i = (g$ipv29 - gipvmean)/gipvsd.
compute g$ipv30i = (g$ipv30 - gipvmean)/gipvsd.
compute g$ipv31i = (g$ipv31 - gipvmean)/gipvsd.
compute g$ipv32i = (g$ipv32 - gipvmean)/gipvsd.
.
execute.




Global Interpersonal Values

COMPUTE g$haghci = Mean (g$ipv2i, g$ipv10i, g$ipv18i, g$ipv26i) .
VARIABLE LABELS g$haghci 'Global High Agency High Communion Ipsatized' .
EXECUTE .

COMPUTE g$laghci = Mean (g$ipv4i, g$ipv12i, g$ipv20i, g$ipv28i) .
VARIABLE LABELS g$laghci 'Global Low Agency High Communion Ipsatized' .
EXECUTE .


