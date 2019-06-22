
 
compute interdep = mean (scs1, scs4, scs5, scs6, scs7, scs9, scs11, scs12, scs14, scs20, scs22, scs24).
compute indep = mean (scs2, scs3, scs8, scs10, scs13, scs15, scs16, scs17, scs18, scs19, scs21, scs23).
execute.

var labels
interdep 'Interdependent Self-Construal'
indep 'Independent Self-Construal'
.

RELIABILITY
  /VARIABLES=scs1 scs4 scs5 scs6 scs7 scs9 scs11 scs12 scs14 scs20 scs22
  scs24
   /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .


RELIABILITY
  /VARIABLES=scs2 scs3 scs8 scs10 scs13 scs15 scs16 scs17 scs18 scs19 scs21
  scs23
    /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .


Ipsatized

compute scs$tot = mean.20 (scs1, scs4, scs5, scs6, scs7, scs9, scs11, scs12, scs14, scs20, scs22, scs24, scs2, scs3, scs8, scs10, 
scs13, scs15, scs16, scs17, scs18, scs19, scs21, scs23).
execute.

compute scs1t = scs1 - scs$tot.
compute scs2t = scs2 - scs$tot.
compute scs3t = scs3 - scs$tot.
compute scs4t = scs4 - scs$tot.
compute scs5t = scs5 - scs$tot.
compute scs6t = scs6 - scs$tot.
compute scs7t = scs7 - scs$tot.
compute scs8t = scs8 - scs$tot.
compute scs9t = scs9 - scs$tot.
compute scs10t = scs10 - scs$tot.
compute scs11t = scs11 - scs$tot.
compute scs12t = scs12 - scs$tot.
compute scs13t = scs13 - scs$tot.
compute scs14t = scs14 - scs$tot.
compute scs15t = scs15 - scs$tot.
compute scs16t = scs16 - scs$tot.
compute scs17t = scs17 - scs$tot.
compute scs18t = scs18 - scs$tot.
compute scs19t = scs19 - scs$tot.
compute scs20t = scs20 - scs$tot.
compute scs21t = scs21 - scs$tot.
compute scs22t = scs22 - scs$tot.
compute scs23t = scs23 - scs$tot.
compute scs24t = scs24 - scs$tot.
execute.

compute interdpt = mean (scs1t, scs4t, scs5t, scs6t, scs7t, scs9t, scs11t, scs12t, scs14t, scs20t, scs22t, scs24t).
compute indpt = mean (scs2t, scs3t, scs8t, scs10t, scs13t, scs15t, scs16t, scs17t, scs18t, scs19t, scs21t, scs23t).
execute.

ipsatize by mean and sd

compute scs$sd = SD.20 (scs1, scs4, scs5, scs6, scs7, scs9, scs11, scs12, scs14, scs20, scs22, scs24, scs2, scs3, scs8, scs10, 
scs13, scs15, scs16, scs17, scs18, scs19, scs21, scs23).
execute.

compute scs1i = (scs1 - scs$tot)/scs$sd.
compute scs2i = (scs2 - scs$tot)/scs$sd.
compute scs3i = (scs3 - scs$tot)/scs$sd.
compute scs4i = (scs4 - scs$tot)/scs$sd.
compute scs5i = (scs5 - scs$tot)/scs$sd.
compute scs6i = (scs6 - scs$tot)/scs$sd.
compute scs7i = (scs7 - scs$tot)/scs$sd.
compute scs8i = (scs8 - scs$tot)/scs$sd.
compute scs9i = (scs9 - scs$tot)/scs$sd.
compute scs10i = (scs10 - scs$tot)/scs$sd.
compute scs11i = (scs11 - scs$tot)/scs$sd.
compute scs12i = (scs12 - scs$tot)/scs$sd.
compute scs13i = (scs13 - scs$tot)/scs$sd.
compute scs14i = (scs14 - scs$tot)/scs$sd.
compute scs15i = (scs15 - scs$tot)/scs$sd.
compute scs16i = (scs16 - scs$tot)/scs$sd.
compute scs17i = (scs17 - scs$tot)/scs$sd.
compute scs18i = (scs18 - scs$tot)/scs$sd.
compute scs19i = (scs19 - scs$tot)/scs$sd.
compute scs20i = (scs20 - scs$tot)/scs$sd.
compute scs21i = (scs21 - scs$tot)/scs$sd.
compute scs22i = (scs22 - scs$tot)/scs$sd.
compute scs23i = (scs23 - scs$tot)/scs$sd.
compute scs24i = (scs24 - scs$tot)/scs$sd.
execute.

compute interdpi = mean (scs1i, scs4i, scs5i, scs6i, scs7i, scs9i, scs11i, scs12i, scs14i, scs20i, scs22i, scs24i).
compute indpi = mean (scs2i, scs3i, scs8i, scs10i, scs13i, scs15i, scs16i, scs17i, scs18i, scs19i, scs21i, scs23i).
execute.

RECODE
  scs1 scs9 scs24 scs13
  (1=7)  (2=6)  (3=5)  (4=4)  (5=3)  (6=2)  (7=1)  INTO  scs1r  scs9r  scs24r
   scs13r .
VARIABLE LABELS scs1r 'Reverse coded'.
EXECUTE .

compute scs1r$i = (scs1r - scs$tot)/scs$sd.
compute scs9r$i = (scs9r - scs$tot)/scs$sd.
compute scs24r$i = (scs24r - scs$tot)/scs$sd.
compute scs13r$i = (scs13r - scs$tot)/scs$sd.
execute.

compute indep1i = mean (scs2i, scs19i, scs3i, scs24i, scs18i).
compute interd1i = mean (scs22i, scs11i, scs12i, scs9i).
compute indep2 = mean (scs8i, scs13i, scs10i, scs17i).
execute.

RELIABILITY
  /VARIABLES=scs2 scs19 scs3 scs24r scs18
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=scs22 scs11 scs12 scs9
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=scs8 scs13 scs10 scs17
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

