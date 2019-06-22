* Affect Valuation Index 9/30/05 IGS.

*-----------Reliability---------------.

RELIABILITY
  /VARIABLES=ro$exci ro$elat ro$euph ro$enth
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=po$exci po$elat po$euph po$enth
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=ro$cont ro$happ ro$sati
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=po$cont po$happ po$sati
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=ro$sere ro$peac ro$calm ro$rela
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=po$sere po$peac po$calm po$rela
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=ro$idle ro$pass ro$inac
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=po$idle po$pass po$inac
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=ro$dull ro$slee ro$slug
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=po$dull po$slee po$slug
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=ro$lone ro$sadx ro$unha
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=po$lone po$sadx po$unha
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=ro$nerv ro$host ro$fear ro$angr
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=po$nerv po$host po$fear po$angr
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=ro$aler ro$asto ro$surp
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

RELIABILITY
  /VARIABLES=po$aler po$asto po$surp
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

*----------Means for Each Octant Based on Raw Scores--------------.

compute ro$hap = mean (ro$enth, ro$exci, ro$euph, ro$elat).
compute ro$p = mean (ro$happ, ro$cont, ro$sati).
compute ro$lap = mean (ro$calm, ro$rela, ro$sere, ro$peac).
compute ro$lap2 = mean (ro$quie, ro$stil, ro$rest).
compute ro$la = mean (ro$idle, ro$pass, ro$inac).
compute ro$lan = mean (ro$dull, ro$slee, ro$slug).
compute ro$n = mean (ro$lone, ro$sadx, ro$unha).
compute ro$han = mean (ro$fear, ro$host, ro$nerv, ro$angr).
compute ro$ha = mean (ro$asto, ro$surp, ro$aler).
execute.

compute po$hap = mean (po$enth, po$exci, po$euph, po$elat).
compute po$p = mean (po$happ, po$cont, po$sati).
compute po$lap = mean (po$calm, po$rela, po$sere, po$peac).
compute po$lap2 = mean (po$quie, po$stil, po$rest).
compute po$la = mean (po$idle, po$pass, po$inac).
compute po$lan = mean (po$dull, po$slee, po$slug).
compute po$n = mean (po$lone, po$sadx, po$unha).
compute po$han = mean (po$fear, po$host, po$nerv, po$angr).
compute po$ha = mean (po$asto, po$surp, po$aler).
execute.         

*------------Ipsatizing Scores-------------------.

compute ro$mean = mean (ro$enth, ro$dull, ro$exci, ro$slee, ro$slug, ro$euph, ro$idle, ro$aler, ro$rest, ro$asto, ro$quie, ro$surp, ro$stil, ro$pass,
 ro$inac, ro$fear, ro$calm, ro$host, ro$peac, ro$nerv, ro$rela, ro$elat, ro$angr, ro$lone, ro$cont, ro$sadx, ro$happ, ro$unha, ro$sati, ro$sere).
compute ro$SD= SD(ro$enth, ro$dull, ro$exci, ro$slee, ro$slug, ro$euph, ro$idle, ro$aler, ro$rest, ro$asto, ro$quie, ro$surp, ro$stil, ro$pass,
 ro$inac, ro$fear, ro$calm, ro$host, ro$peac, ro$nerv, ro$rela, ro$elat, ro$angr, ro$lone, ro$cont, ro$sadx, ro$happ, ro$unha, ro$sati, ro$sere).
compute po$mean = mean (po$enth, po$dull, po$exci, po$slee, po$slug, po$euph, po$idle, po$aler, po$rest, po$asto, po$quie, po$surp, po$stil, po$pass,
 po$inac, po$fear, po$calm, po$host, po$peac, po$nerv, po$rela, po$elat, po$angr, po$lone, po$cont, po$sadx, po$happ, po$unha, po$sati, po$sere).
compute po$SD= SD(po$enth, po$dull, po$exci, po$slee, po$slug, po$euph, po$idle, po$aler, po$rest, po$asto, po$quie, po$surp, po$stil, po$pass,
 po$inac, po$fear, po$calm, po$host, po$peac, po$nerv, po$rela, po$elat, po$angr, po$lone, po$cont, po$sadx, po$happ, po$unha, po$sati, po$sere)
.
execute.

compute ro$enth1i = (ro$enth - ro$mean)/ro$sd.
compute ro$dull1i = (ro$dull - ro$mean)/ro$sd.
compute ro$exci1i = (ro$exci - ro$mean)/ro$sd.
compute ro$slee1i = (ro$slee - ro$mean)/ro$sd.
compute ro$slug1i = (ro$slug - ro$mean)/ro$sd.
compute ro$euph1i = (ro$euph - ro$mean)/ro$sd.
compute ro$idle1i = (ro$idle - ro$mean)/ro$sd.
compute ro$aler1i = (ro$aler - ro$mean)/ro$sd.
compute ro$rest1i = (ro$rest - ro$mean)/ro$sd.
compute ro$asto1i = (ro$asto - ro$mean)/ro$sd.
compute ro$quie1i = (ro$quie - ro$mean)/ro$sd.
compute ro$surp1i = (ro$surp - ro$mean)/ro$sd.
compute ro$stil1i = (ro$stil - ro$mean)/ro$sd.
compute ro$pass1i = (ro$pass - ro$mean)/ro$sd.
compute ro$inac1i = (ro$inac - ro$mean)/ro$sd.
compute ro$fear1i = (ro$fear - ro$mean)/ro$sd.
compute ro$calm1i = (ro$calm - ro$mean)/ro$sd.
compute ro$host1i = (ro$host - ro$mean)/ro$sd.
compute ro$peac1i = (ro$peac - ro$mean)/ro$sd.
compute ro$nerv1i = (ro$nerv - ro$mean)/ro$sd.
compute ro$rela1i = (ro$rela - ro$mean)/ro$sd.
compute ro$elat1i = (ro$elat - ro$mean)/ro$sd.
compute ro$angr1i = (ro$angr - ro$mean)/ro$sd.
compute ro$lone1i = (ro$lone - ro$mean)/ro$sd.
compute ro$cont1i = (ro$cont - ro$mean)/ro$sd.
compute ro$sadx1i = (ro$sadx - ro$mean)/ro$sd.
compute ro$happ1i = (ro$happ - ro$mean)/ro$sd.
compute ro$unha1i = (ro$unha - ro$mean)/ro$sd.
compute ro$sati1i = (ro$sati - ro$mean)/ro$sd.
compute ro$sere1i = (ro$sere- ro$mean)/ro$sd
.
execute.

compute po$enth1i = (po$enth - po$mean)/po$sd.
compute po$dull1i = (po$dull - po$mean)/po$sd.
compute po$exci1i = (po$exci - po$mean)/po$sd.
compute po$slee1i = (po$slee - po$mean)/po$sd.
compute po$slug1i = (po$slug - po$mean)/po$sd.
compute po$euph1i = (po$euph - po$mean)/po$sd.
compute po$idle1i = (po$idle - po$mean)/po$sd.
compute po$aler1i = (po$aler - po$mean)/po$sd.
compute po$rest1i = (po$rest - po$mean)/po$sd.
compute po$asto1i = (po$asto - po$mean)/po$sd.
compute po$quie1i = (po$quie - po$mean)/po$sd.
compute po$surp1i = (po$surp - po$mean)/po$sd.
compute po$stil1i = (po$stil - po$mean)/po$sd.
compute po$pass1i = (po$pass - po$mean)/po$sd.
compute po$inac1i = (po$inac - po$mean)/po$sd.
compute po$fear1i = (po$fear - po$mean)/po$sd.
compute po$calm1i = (po$calm - po$mean)/po$sd.
compute po$host1i = (po$host - po$mean)/po$sd.
compute po$peac1i = (po$peac - po$mean)/po$sd.
compute po$nerv1i = (po$nerv - po$mean)/po$sd.
compute po$rela1i = (po$rela - po$mean)/po$sd.
compute po$elat1i = (po$elat - po$mean)/po$sd.
compute po$angr1i = (po$angr - po$mean)/po$sd.
compute po$lone1i = (po$lone - po$mean)/po$sd.
compute po$cont1i = (po$cont - po$mean)/po$sd.
compute po$sadx1i = (po$sadx - po$mean)/po$sd.
compute po$happ1i = (po$happ - po$mean)/po$sd.
compute po$unha1i = (po$unha - po$mean)/po$sd.
compute po$sati1i = (po$sati - po$mean)/po$sd.
compute po$sere1i = (po$sere- po$mean)/po$sd
.
execute.

*--------Means for Each Octant Based on Ipsatized Scores-----------.

compute ro$hap1i = mean (ro$enth1i, ro$exci1i, ro$euph1i, ro$elat1i).
compute ro$p1i = mean (ro$happ1i, ro$cont1i, ro$sati1i).
compute ro$lap1i = mean (ro$calm1i, ro$rela1i, ro$sere1i, ro$peac1i).
compute ro$lap21i = mean (ro$quie1i, ro$stil1i, ro$rest1i).
compute ro$la1i = mean (ro$idle1i, ro$pass1i, ro$inac1i).
compute ro$lan1i = mean (ro$dull1i, ro$slee1i, ro$slug1i).
compute ro$n1i = mean (ro$lone1i, ro$sadx1i, ro$unha1i).
compute ro$han1i = mean (ro$fear1i, ro$host1i, ro$nerv1i, ro$angr1i).
compute ro$ha1i = mean (ro$asto1i, ro$surp1i, ro$aler1i).
compute ro$hap31i = mean (ro$exci1i, ro$euph1i, ro$elat1i).
compute ro$hap3a1i = mean (ro$enth1i, ro$exci1i, ro$elat1i).

execute.

compute po$hap1i = mean (po$enth1i, po$exci1i, po$euph1i, po$elat1i).
compute po$p1i = mean (po$happ1i, po$cont1i, po$sati1i).
compute po$lap1i = mean (po$calm1i, po$rela1i, po$sere1i, po$peac1i).
compute po$lap21i = mean (po$quie1i, po$stil1i, po$rest1i).
compute po$la1i = mean (po$idle1i, po$pass1i, po$inac1i).
compute po$lan1i = mean (po$dull1i, po$slee1i, po$slug1i).
compute po$n1i = mean (po$lone1i, po$sadx1i, po$unha1i).
compute po$han1i = mean (po$fear1i, po$host1i, po$nerv1i, po$angr1i).
compute po$ha1i = mean (po$asto1i, po$surp1i, po$aler1i).
compute po$hap31i = mean (po$exci1i, po$euph1i, po$elat1i).
compute po$hap3a1i = mean (po$enth1i, po$exci1i, po$elat1i)
.
execute.

*----------MANOVAS on Ideal, Peer, and Parent Affect--------------.

GLM
  i$lap1i po$lap1i ro$lap1i BY group  WITH r$hap1i
  /WSFACTOR = type 3 Polynomial
  /METHOD = SSTYPE(3)
  /EMMEANS = TABLES(OVERALL) WITH(r$hap1i=MEAN)
  /EMMEANS = TABLES(group) WITH(r$hap1i=MEAN)
  /EMMEANS = TABLES(type) WITH(r$hap1i=MEAN)
  /EMMEANS = TABLES(group*type) WITH(r$hap1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ OPOWER HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /WSDESIGN = type
  /DESIGN = r$hap1i group .

GLM
  i$hap1i po$hap1i ro$hap1i BY group  WITH r$hap1i
  /WSFACTOR = type 3 Polynomial
  /METHOD = SSTYPE(3)
  /EMMEANS = TABLES(OVERALL) WITH(r$hap1i=MEAN)
  /EMMEANS = TABLES(group) WITH(r$hap1i=MEAN)
  /EMMEANS = TABLES(type) WITH(r$hap1i=MEAN)
  /EMMEANS = TABLES(group*type) WITH(r$hap1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ OPOWER HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /WSDESIGN = type
  /DESIGN = r$hap1i group .

*-----------Pairwise T-Tests Between Ideal and Should Affect-----------.

T-TEST
  PAIRS = i$hap1i i$p1i i$lap1i i$la1i i$lan1i i$n1i i$han1i i$ha1i  WITH ro$hap1i ro$p1i ro$lap1i ro$la1i ro$lan1i ro$n1i
  ro$han1i ro$ha1i (PAIRED)
  /CRITERIA = CI(.95)
  /MISSING = ANALYSIS.

T-TEST
  PAIRS = i$hap1i i$p1i i$lap1i i$la1i i$lan1i i$n1i i$han1i i$ha1i  WITH po$hap1i po$p1i po$lap1i po$la1i po$lan1i po$n1i
  po$han1i po$ha1i (PAIRED)
  /CRITERIA = CI(.95)
  /MISSING = ANALYSIS.

T-TEST
  PAIRS = i$hap1i i$hap1i ro$hap1i r$hap1i r$hap1i  WITH ro$hap1i po$hap1i po$hap1i po$hap1i ro$hap1i (PAIRED)
  /CRITERIA = CI(.95)
  /MISSING = ANALYSIS.

T-TEST
  PAIRS = i$lap1i i$lap1i ro$lap1i r$lap1i r$lap1i  WITH ro$lap1i po$lap1i po$lap1i po$lap1i ro$lap1i (PAIRED)
  /CRITERIA = CI(.95)
  /MISSING = ANALYSIS.

*--------Group Differences in Ideal HAP and LAP--------------.

*Without covarying for actual affect and including Sex.

GLM
  po$hap1i po$lap1i BY group sex
  /WSFACTOR = type 2 Polynomial
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /EMMEANS = TABLES(OVERALL)
  /EMMEANS = TABLES(group)
  /EMMEANS = TABLES(sex)
  /EMMEANS = TABLES(type)
  /EMMEANS = TABLES(group*sex)
  /EMMEANS = TABLES(group*type)
  /EMMEANS = TABLES(sex*type)
  /EMMEANS = TABLES(group*sex*type)
  /PRINT = DESCRIPTIVE ETASQ OPOWER HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /WSDESIGN = type
  /DESIGN = group sex group*sex 

*Without covarying for actual affect and excluding Sex.

GLM
  po$hap1i po$lap1i BY group
  /WSFACTOR = type 2 Polynomial
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /EMMEANS = TABLES(OVERALL)
  /EMMEANS = TABLES(group)
  /EMMEANS = TABLES(type)
  /EMMEANS = TABLES(group*type)
  /PRINT = DESCRIPTIVE ETASQ OPOWER HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /WSDESIGN = type
  /DESIGN = group .

*Covarying for actual affect and including Sex.

GLM
  po$hap1i po$lap1i BY group sex  WITH ro$hap1i ro$lap1i
  /WSFACTOR = type 2 Polynomial
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /EMMEANS = TABLES(OVERALL) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /EMMEANS = TABLES(group) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /EMMEANS = TABLES(type) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /EMMEANS = TABLES(group*type) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /EMMEANS = TABLES(sex) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /EMMEANS = TABLES(group*sex) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /EMMEANS = TABLES(sex*type) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /EMMEANS = TABLES(group*sex*type) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ OPOWER HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /WSDESIGN = type
  /DESIGN = ro$hap1i ro$lap1i group sex group*sex .

*Covarying for actual affect and not including Sex.

GLM
  po$hap1i po$lap1i BY group  WITH ro$hap1i ro$lap1i
  /WSFACTOR = type 2 Polynomial
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /EMMEANS = TABLES(OVERALL) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /EMMEANS = TABLES(group) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /EMMEANS = TABLES(type) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /EMMEANS = TABLES(group*type) WITH(ro$hap1i=MEAN ro$lap1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ OPOWER HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /WSDESIGN = type
  /DESIGN = ro$hap1i ro$lap1i group .

*------------ANCOVAS on Ideal Affect---------------.

UNIANOVA
  po$hap1i  BY group  WITH ro$hap1i
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(ro$hap1i=MEAN)
  /EMMEANS = TABLES(group) WITH(ro$hap1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = ro$hap1i group 
.
UNIANOVA
  po$p1i  BY group  WITH ro$p1i
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(ro$p1i=MEAN)
  /EMMEANS = TABLES(group) WITH(ro$p1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = ro$p1i group .
UNIANOVA
  po$lap1i  BY group  WITH ro$lap1i
  /CONTRAST (group)=Simple(1)
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(ro$lap1i=MEAN)
  /EMMEANS = TABLES(group) WITH(ro$lap1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = ro$lap1i group .
UNIANOVA
  po$la1i  BY group  WITH ro$la1i
  /CONTRAST (group)=Simple(1)
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(ro$la1i=MEAN)
  /EMMEANS = TABLES(group) WITH(ro$la1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = ro$la1i group .
UNIANOVA
  po$lan1i  BY group  WITH ro$lan1i
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(ro$lan1i=MEAN)
  /EMMEANS = TABLES(group) WITH(ro$lan1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = ro$lan1i group .
UNIANOVA
  po$n1i  BY group  WITH ro$n1i
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(ro$n1i=MEAN)
  /EMMEANS = TABLES(group) WITH(ro$n1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = ro$n1i group .
UNIANOVA
  po$han1i  BY group  WITH ro$han1i
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(ro$han1i=MEAN)
  /EMMEANS = TABLES(group) WITH(ro$han1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = ro$han1i group .
UNIANOVA
  po$ha1i  BY group  WITH ro$ha1i
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(ro$ha1i=MEAN)
  /EMMEANS = TABLES(group) WITH(ro$ha1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = ro$ha1i group .

*------------ANCOVAS on Actual Affect---------------.

UNIANOVA
  ro$hap1i  BY group  WITH po$hap1i
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(po$hap1i=MEAN)
  /EMMEANS = TABLES(group) WITH(po$hap1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = po$hap1i group .

UNIANOVA
  ro$p1i  BY group  WITH po$p1i
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(po$p1i=MEAN)
  /EMMEANS = TABLES(group) WITH(po$p1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = po$p1i group .

UNIANOVA
  ro$lap1i  BY group  WITH po$lap1i
  /CONTRAST (group)=Simple(1)
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(po$lap1i=MEAN)
  /EMMEANS = TABLES(group) WITH(po$lap1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = po$lap1i group .

UNIANOVA
  ro$la1i  BY group  WITH po$la1i
  /CONTRAST (group)=Simple(1)
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(po$la1i=MEAN)
  /EMMEANS = TABLES(group) WITH(po$la1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = po$la1i group .
UNIANOVA
  ro$lan1i  BY group  WITH po$lan1i
  /CONTRAST (group)=Simple
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(po$lan1i=MEAN)
  /EMMEANS = TABLES(group) WITH(po$lan1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = po$lan1i group .
UNIANOVA
  ro$n1i  BY group  WITH po$n1i
  /CONTRAST (group)=Simple(1)
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(po$n1i=MEAN)
  /EMMEANS = TABLES(group) WITH(po$n1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = po$n1i group .
UNIANOVA
  ro$han1i  BY group  WITH po$han1i
  /CONTRAST (group)=Simple(1)
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(po$han1i=MEAN)
  /EMMEANS = TABLES(group) WITH(po$han1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = po$han1i group .
UNIANOVA
  ro$ha1i  BY group  WITH po$ha1i
  /CONTRAST (group)=Simple(1)
  /METHOD = SSTYPE(3)
  /INTERCEPT = INCLUDE
  /EMMEANS = TABLES(OVERALL) WITH(po$ha1i=MEAN)
  /EMMEANS = TABLES(group) WITH(po$ha1i=MEAN)
  /PRINT = DESCRIPTIVE ETASQ HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /DESIGN = po$ha1i group .

GLM
  r$hap1i i$hap1i po$hap1i ro$hap1i BY group
  /WSFACTOR = type 4 Polynomial
  /METHOD = SSTYPE(3)
  /EMMEANS = TABLES(OVERALL)
  /EMMEANS = TABLES(group)
  /EMMEANS = TABLES(type)
  /EMMEANS = TABLES(group*type)
  /PRINT = DESCRIPTIVE ETASQ OPOWER HOMOGENEITY
  /CRITERIA = ALPHA(.05)
  /WSDESIGN = type
  /DESIGN = group .
T-TEST
  PAIRS = i$hap1i i$hap1i ro$hap1i r$hap1i r$hap1i  WITH ro$hap1i po$hap1i po$hap1i po$hap1i ro$hap1i (PAIRED)
  /CRITERIA = CI(.95)
  /MISSING = ANALYSIS.
T-TEST
  PAIRS = i$hap1i i$hap1i ro$hap1i r$hap1i r$hap1i  WITH ro$hap1i po$hap1i po$hap1i po$hap1i ro$hap1i (PAIRED)
  /CRITERIA = CI(.95)
  /MISSING = ANALYSIS.
