
 
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
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=scs2 scs3 scs8 scs10 scs13 scs15 scs16 scs17 scs18 scs19 scs21
  scs23
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .
