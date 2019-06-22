*-------------Self-Construal Scale----------.

RELIABILITY
  /VARIABLES=scs02 scs26 scs03 scs19 scs18 scs25 scs08 scs17 scs16 scs15 scs21 scs13 scs10 scs23 scs29
   /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=scs04 scs14 scs05 scs07 scs22 scs11 scs30 scs09 scs06 scs12 scs28 scs27 scs20 scs01 scs24
   /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

compute indep = mean (scs02, scs26, scs03, scs19, scs18, scs25, scs08, scs17, scs16, scs15, scs21, scs13, scs10, scs23, scs29).
compute interd = mean (scs04, scs14, scs05, scs07, scs22, scs11, scs30, scs09, scs06, scs12, scs28, scs27, scs20, scs01, scs24).
execute.

compute scs$mean = mean (scs01, scs02, scs03, scs04, scs05, scs06, scs07, scs08, scs09, scs10, scs11, scs12, scs13, scs14, scs15, scs16, 
scs17, scs18, scs19, scs20, scs21,  scs22, scs23, scs24, scs25, scs26, scs27, scs28, scs29, scs30).
compute scs$SD = SD (scs01, scs02, scs03, scs04, scs05, scs06, scs07, scs08, scs09, scs10, scs11, scs12, scs13, scs14, scs15, scs16, 
scs17, scs18, scs19, scs20, scs21,  scs22, scs23, scs24, scs25, scs26, scs27, scs28, scs29, scs30).
execute.

compute scs01i = (scs01 - scs$mean)/scs$sd.
compute scs02i = (scs02 - scs$mean)/scs$sd.
compute scs03i = (scs03 - scs$mean)/scs$sd.
compute scs04i = (scs04 - scs$mean)/scs$sd.
compute scs05i = (scs05 - scs$mean)/scs$sd.
compute scs06i = (scs06 - scs$mean)/scs$sd.
compute scs07i = (scs07 - scs$mean)/scs$sd.
compute scs08i = (scs08 - scs$mean)/scs$sd.
compute scs09i = (scs09 - scs$mean)/scs$sd.
compute scs10i = (scs10 - scs$mean)/scs$sd.
compute scs11i = (scs11 - scs$mean)/scs$sd.
compute scs12i = (scs12 - scs$mean)/scs$sd.
compute scs13i = (scs13 - scs$mean)/scs$sd.
compute scs14i = (scs14 - scs$mean)/scs$sd.
compute scs15i = (scs15 - scs$mean)/scs$sd.
compute scs16i = (scs16 - scs$mean)/scs$sd.
compute scs17i = (scs17 - scs$mean)/scs$sd.
compute scs18i = (scs18 - scs$mean)/scs$sd.
compute scs19i = (scs19 - scs$mean)/scs$sd.
compute scs20i = (scs20 - scs$mean)/scs$sd.
compute scs21i = (scs21 - scs$mean)/scs$sd.
compute scs22i = (scs22 - scs$mean)/scs$sd.
compute scs23i = (scs23 - scs$mean)/scs$sd.
compute scs24i = (scs24 - scs$mean)/scs$sd.
compute scs25i = (scs25 - scs$mean)/scs$sd.
compute scs26i = (scs26 - scs$mean)/scs$sd.
compute scs27i = (scs27 - scs$mean)/scs$sd.
compute scs28i = (scs28 - scs$mean)/scs$sd.
compute scs29i = (scs29 - scs$mean)/scs$sd.
compute scs30i = (scs30 - scs$mean)/scs$sd.
execute.


compute indepi = mean (scs02i, scs26i, scs03i, scs19i, scs18i, scs25i, scs08i, scs17i, scs16i, scs15i, scs21i, scs13i, scs10i, scs23i, scs29i).
compute interdi = mean (scs04i, scs14i, scs05i, scs07i, scs22i, scs11i, scs30i, scs09i, scs06i, scs12i, scs28i, scs27i, scs20i, scs01i, scs24i).
compute indep2i = mean (scs02i, scs26i, scs03i, scs19i, scs18i, scs25i).
execute.

*--------------Subscores based on factor analysis-------------------.

RELIABILITY
  /VARIABLES=scs02 scs26 scs03 scs19 scs18 scs25
   /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=scs04 scs14 scs05 scs07
   /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=scs22 scs11 scs30 scs09 
   /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=scs06 scs12 scs28 scs27
   /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .


