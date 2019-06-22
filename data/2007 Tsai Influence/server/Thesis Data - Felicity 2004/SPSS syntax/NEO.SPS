title ' Calculate NEO scores'.

recode
neo01 neo16 neo31 neo46
(1=5) (2=4) (3=3) (4=2) (5=1)
.
recode
neo12 neo27 neo42 neo57
(1=5) (2=4) (3=3) (4=2) (5=1)
.
recode
neo03 neo08 neo18 neo23 neo33 neo38 neo48
(1=5) (2=4) (3=3) (4=2) (5=1)
.
recode
neo09 neo14 neo24 neo29 neo39 neo44 neo54 neo59
(1=5) (2=4) (3=3) (4=2) (5=1)
.
recode
neo15 neo30 neo45 neo55
(1=5) (2=4) (3=3) (4=2) (5=1)
.
execute.


compute neurotic = mean (neo01, neo06, neo11, neo16, neo21, neo26, neo31, neo36, neo41, neo46, neo51, neo56).
compute extravrt = mean (neo02, neo07, neo12, neo17, neo22, neo27, neo32, neo37, neo42, neo47, neo52, neo57).
compute opennss = mean (neo03, neo08, neo13, neo18, neo23, neo28, neo33, neo38, neo43, neo48, neo53, neo58).
compute agreeble = mean (neo04, neo09, neo14, neo19, neo24, neo29, neo34, neo39, neo44, neo49, neo54, neo59).
compute conscien = mean (neo05, neo10, neo15, neo20, neo25, neo30, neo35, neo40, neo45, neo50, neo55, neo60). 
execute.


RELIABILITY
  /VARIABLES=neo01 neo06 neo11 neo16 neo21 neo26 neo31 neo36 neo41 neo46
  neo51 neo56
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=neo02 neo07 neo12 neo17 neo22 neo27 neo32 neo37 neo42 neo47
  neo52 neo57
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=neo03 neo08 neo13 neo18 neo23 neo28 neo33 neo38 neo43 neo48
  neo53 neo58
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=neo04 neo09 neo14 neo19 neo24 neo29 neo34 neo39 neo44 neo49
  neo54 neo59
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=neo05 neo10 neo15 neo20 neo25 neo30 neo35 neo40 neo45 neo50
  neo55 neo60
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=SCALE CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

