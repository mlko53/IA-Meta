*-----Primary and Secondary Control--------------.

RELIABILITY
  /VARIABLES=psc02 psc04 psc08 psc11 psc05 psc01
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=psc03 psc06 psc09 psc12 psc14
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=psc10 psc13 psc07
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

compute pc = mean (psc02, psc04, psc08, psc11, psc05, psc01).
compute sc = mean (psc03, psc06, psc09, psc12, psc14).
compute pe = mean (psc10, psc13, psc07).
execute.

compute pcs$mean = mean(psc01, psc02, psc03, psc04, psc05, psc06, psc07, psc08, psc09, psc10, psc11, psc12, psc13, psc14).
compute pcs$SD = SD (psc01, psc02, psc03, psc04, psc05, psc06, psc07, psc08, psc09, psc10, psc11, psc12, psc13, psc14).
execute.

compute psc01i = (psc01 - pcs$mean)/pcs$sd.
compute psc02i = (psc02 - pcs$mean)/pcs$sd.
compute psc03i = (psc03 - pcs$mean)/pcs$sd.
compute psc04i = (psc04 - pcs$mean)/pcs$sd.
compute psc05i = (psc05 - pcs$mean)/pcs$sd.
compute psc06i = (psc06 - pcs$mean)/pcs$sd.
compute psc07i = (psc07 - pcs$mean)/pcs$sd.
compute psc08i = (psc08 - pcs$mean)/pcs$sd.
compute psc09i = (psc09 - pcs$mean)/pcs$sd.
compute psc10i = (psc10 - pcs$mean)/pcs$sd.
compute psc11i = (psc11 - pcs$mean)/pcs$sd.
compute psc12i = (psc12 - pcs$mean)/pcs$sd.
compute psc13i = (psc13 - pcs$mean)/pcs$sd.
compute psc14i = (psc14 - pcs$mean)/pcs$sd.
execute.

compute pci = mean (psc02i, psc04i, psc08i, psc11i, psc05i, psc01i).
compute sci = mean (psc03i, psc06i, psc09i, psc12i, psc14i).
compute pei = mean (psc10i, psc13i, psc07i).
execute.
