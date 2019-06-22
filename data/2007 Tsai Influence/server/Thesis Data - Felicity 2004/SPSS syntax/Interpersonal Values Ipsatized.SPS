title 'Interpersonal Values Ipsatized'.

compute ipvmean = mean (ipv1, ipv2, ipv3, ipv4, ipv5, ipv5, ipv6, ipv7, ipv8,
 ipv9, ipv10, ipv11, ipv12, ipv13, ipv14, ipv15, ipv16, 
ipv17, ipv18, ipv19, ipv20, ipv21, ipv22, ipv23, ipv24,
ipv25, ipv26, ipv27, ipv28, ipv29, ipv30, ipv31, ipv32)
.
compute ipvsd = sd (ipv1, ipv2, ipv3, ipv4, ipv5, ipv5, ipv6, ipv7, ipv8,
 ipv9, ipv10, ipv11, ipv12, ipv13, ipv14, ipv15, ipv16, 
ipv17, ipv18, ipv19, ipv20, ipv21, ipv22, ipv23, ipv24,
ipv25, ipv26, ipv27, ipv28, ipv29, ipv30, ipv31, ipv32)
.
execute.

compute ipv1i = (ipv1 - ipvmean)/ipvsd.
compute ipv2i = (ipv2 - ipvmean)/ipvsd.
compute ipv3i = (ipv3 - ipvmean)/ipvsd.
compute ipv4i = (ipv4 - ipvmean)/ipvsd.
compute ipv5i = (ipv5 - ipvmean)/ipvsd.
compute ipv6i = (ipv6 - ipvmean)/ipvsd.
compute ipv7i = (ipv7 - ipvmean)/ipvsd.
compute ipv8i = (ipv8 - ipvmean)/ipvsd.
compute ipv9i = (ipv9 - ipvmean)/ipvsd.
compute ipv10i = (ipv10 - ipvmean)/ipvsd.
compute ipv11i = (ipv11 - ipvmean)/ipvsd.
compute ipv12i = (ipv12 - ipvmean)/ipvsd.
compute ipv13i = (ipv13 - ipvmean)/ipvsd.
compute ipv14i = (ipv14 - ipvmean)/ipvsd.
compute ipv15i = (ipv15 - ipvmean)/ipvsd.
compute ipv16i = (ipv16 - ipvmean)/ipvsd.
compute ipv17i = (ipv17 - ipvmean)/ipvsd.
compute ipv18i = (ipv18 - ipvmean)/ipvsd.
compute ipv19i = (ipv19 - ipvmean)/ipvsd.
compute ipv20i = (ipv20 - ipvmean)/ipvsd.
compute ipv21i = (ipv21 - ipvmean)/ipvsd.
compute ipv22i = (ipv22 - ipvmean)/ipvsd.
compute ipv23i = (ipv23 - ipvmean)/ipvsd.
compute ipv24i = (ipv24 - ipvmean)/ipvsd.
compute ipv25i = (ipv25 - ipvmean)/ipvsd.
compute ipv26i = (ipv26 - ipvmean)/ipvsd.
compute ipv27i = (ipv27 - ipvmean)/ipvsd.
compute ipv28i = (ipv28 - ipvmean)/ipvsd.
compute ipv29i = (ipv29 - ipvmean)/ipvsd.
compute ipv30i = (ipv30 - ipvmean)/ipvsd.
compute ipv31i = (ipv31 - ipvmean)/ipvsd.
compute ipv32i = (ipv32 - ipvmean)/ipvsd.

.
execute.



title 'Experimental Manipulation Interpersonal Values'.

COMPUTE haghci = Mean (ipv2i, ipv10i, ipv18i, ipv26i) .
VARIABLE LABELS haghci 'High Agency High Communion Ipsatized' .
EXECUTE .

COMPUTE haglci = Mean (ipv4i, ipv12i, ipv20i, ipv28i) .
VARIABLE LABELS laghci 'Low Agency High Communion Ipsatized' .
EXECUTE .



Global Interpersonal Values

COMPUTE g$haghc = Mean (g$ipv2, g$ipv10, g$ipv18, g$ipv26) .
VARIABLE LABELS g$haghc 'Global High Agency High Communion' .
EXECUTE .

COMPUTE g$haglc = Mean (g$ipv4, g$ipv12, g$ipv20, g$ipv28) .
VARIABLE LABELS g$laghc 'Global Low Agency High Communion' .
EXECUTE .

