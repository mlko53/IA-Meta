title 'Self-Construal Scale Ipsatized'.

compute scsmean = mean (scs1, scs4, scs5, scs6, scs7, scs9, 
scs11, scs12, scs14, scs20, scs22, scs24, 
scs2, scs3, scs8, scs10, scs13, scs15, 
scs16, scs17, scs18, scs19, scs21, scs23).
.
compute scssd = sd (scs1, scs4, scs5, scs6, scs7, scs9, 
scs11, scs12, scs14, scs20, scs22, scs24, 
scs2, scs3, scs8, scs10, scs13, scs15, 
scs16, scs17, scs18, scs19, scs21, scs23).
.
execute.

compute scs1i = (scs1 - scsmean)/scssd.
compute scs2i = (scs2 - scsmean)/scssd.
compute scs3i = (scs3 - scsmean)/scssd.
compute scs4i = (scs4 - scsmean)/scssd.
compute scs5i = (scs5 - scsmean)/scssd.
compute scs6i = (scs6 - scsmean)/scssd.
compute scs7i = (scs7 - scsmean)/scssd.
compute scs8i = (scs8 - scsmean)/scssd.
compute scs9i = (scs9 - scsmean)/scssd.
compute scs10i = (scs10 - scsmean)/scssd.
compute scs11i = (scs11 - scsmean)/scssd.
compute scs12i = (scs12 - scsmean)/scssd.
compute scs13i = (scs13 - scsmean)/scssd.
compute scs14i = (scs14 - scsmean)/scssd.
compute scs15i = (scs15 - scsmean)/scssd.
compute scs16i = (scs16 - scsmean)/scssd.
compute scs17i = (scs17 - scsmean)/scssd.
compute scs18i = (scs18 - scsmean)/scssd.
compute scs19i = (scs19 - scsmean)/scssd.
compute scs20i = (scs20 - scsmean)/scssd.
compute scs21i = (scs21 - scsmean)/scssd.
compute scs22i = (scs22 - scsmean)/scssd.
compute scs23i = (scs23 - scsmean)/scssd.
compute scs24i = (scs24 - scsmean)/scssd.
.
execute.



title 'Calculate aggregates for SCS Ipsatized'

compute interd$i = mean (scs1i, scs4i, scs5i, scs6i, scs7i, scs9i, scs11i, scs12i, scs14i, scs20i, scs22i, scs24i).
compute indep$i = mean (scs2i, scs3i, scs8i, scs10i, scs13i, scs15i, scs16i, scs17i, scs18i, scs19i, scs21i, scs23i).
execute.
.
VARIABLE LABELS 
interd$i 'Interdependent Self-Construal Ipsatized'
indep$i 'Independent Self-Construal Ipsatized'
.
execute.




