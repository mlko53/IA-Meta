*----------------Mean Deviate 64 item CSIV---------------------------------
.
compute csv$mean = mean.60 (csiv01, csiv02, csiv03, csiv04, csiv05, csiv06, csiv07, csiv08, csiv09, csiv10, csiv11,
  csiv12, csiv13, csiv14, csiv15, csiv16, csiv17, csiv18, csiv19, csiv20, csiv21, csiv22,
  csiv23, csiv24, csiv25, csiv26, csiv27, csiv28, csiv29, csiv30, csiv31, csiv32, csiv33,
  csiv34, csiv35, csiv36, csiv37, csiv38, csiv39, csiv40, csiv41, csiv42, csiv43, csiv44,
  csiv45, csiv46, csiv47, csiv48, csiv49, csiv50, csiv51, csiv52, csiv53, csiv54, csiv55,
  csiv56, csiv57, csiv58, csiv59, csiv60, csiv61, csiv62, csiv63, csiv64).
 
compute csv$sd = SD.60 (csiv01, csiv02, csiv03, csiv04, csiv05, csiv06, csiv07, csiv08, csiv09, csiv10, csiv11,
  csiv12, csiv13, csiv14, csiv15, csiv16, csiv17, csiv18, csiv19, csiv20, csiv21, csiv22,
  csiv23, csiv24, csiv25, csiv26, csiv27, csiv28, csiv29, csiv30, csiv31, csiv32, csiv33,
  csiv34, csiv35, csiv36, csiv37, csiv38, csiv39, csiv40, csiv41, csiv42, csiv43, csiv44,
  csiv45, csiv46, csiv47, csiv48, csiv49, csiv50, csiv51, csiv52, csiv53, csiv54, csiv55,
  csiv56, csiv57, csiv58, csiv59, csiv60, csiv61, csiv62, csiv63, csiv64).
.
execute.

compute csv01m = (csiv01 - csv$mean).
compute csv02m = (csiv02 - csv$mean).
compute csv03m = (csiv03 - csv$mean).
compute csv04m = (csiv04 - csv$mean).
compute csv05m = (csiv05 - csv$mean).
compute csv06m = (csiv06 - csv$mean).
compute csv07m = (csiv07 - csv$mean).
compute csv08m = (csiv08  - csv$mean).
compute csv09m = (csiv09 - csv$mean).
compute csv10m = (csiv10 - csv$mean).
compute csv11m = (csiv11 - csv$mean).
compute csv12m = (csiv12 - csv$mean).
compute csv13m = (csiv13 - csv$mean).
compute csv14m = (csiv14 - csv$mean).
compute csv15m = (csiv15 - csv$mean).
compute csv16m = (csiv16 - csv$mean).
compute csv17m = (csiv17 - csv$mean).
compute csv18m = (csiv18  - csv$mean).
compute csv19m = (csiv19 - csv$mean).
compute csv20m = (csiv20 - csv$mean).
compute csv21m = (csiv21 - csv$mean).
compute csv22m = (csiv22 - csv$mean).
compute csv23m = (csiv23 - csv$mean).
compute csv24m = (csiv24 - csv$mean).
compute csv25m = (csiv25 - csv$mean).
compute csv26m = (csiv26 - csv$mean).
compute csv27m = (csiv27 - csv$mean).
compute csv28m = (csiv28  - csv$mean).
compute csv29m = (csiv29 - csv$mean).
compute csv30m = (csiv30 - csv$mean).
compute csv31m = (csiv31 - csv$mean).
compute csv32m = (csiv32 - csv$mean).
compute csv33m = (csiv33 - csv$mean).
compute csv34m = (csiv34 - csv$mean).
compute csv35m = (csiv35 - csv$mean).
compute csv36m = (csiv36 - csv$mean).
compute csv37m = (csiv37 - csv$mean).
compute csv38m = (csiv38  - csv$mean).
compute csv39m = (csiv39 - csv$mean).
compute csv40m = (csiv40 - csv$mean).
compute csv41m = (csiv41 - csv$mean).
compute csv42m = (csiv42 - csv$mean).
compute csv43m = (csiv43 - csv$mean).
compute csv44m = (csiv44 - csv$mean).
compute csv45m = (csiv45 - csv$mean).
compute csv46m = (csiv46 - csv$mean).
compute csv47m = (csiv47 - csv$mean).
compute csv48m = (csiv48  - csv$mean).
compute csv49m = (csiv49 - csv$mean).
compute csv50m = (csiv50 - csv$mean).
compute csv51m = (csiv51 - csv$mean).
compute csv52m = (csiv52 - csv$mean).
compute csv53m = (csiv53 - csv$mean).
compute csv54m = (csiv54 - csv$mean).
compute csv55m = (csiv55 - csv$mean).
compute csv56m = (csiv56 - csv$mean).
compute csv57m = (csiv57 - csv$mean).
compute csv58m = (csiv58  - csv$mean).
compute csv59m = (csiv59 - csv$mean).
compute csv60m = (csiv60 - csv$mean).
compute csv61m = (csiv61 - csv$mean).
compute csv62m = (csiv62 - csv$mean).
compute csv63m = (csiv63 - csv$mean).
compute csv64m = (csiv64 - csv$mean).
execute
.
*----------------Ipsatize 64 item CSIV---------------------------------
.

compute csv01i = (csiv01 - csv$mean)/csv$sd.
compute csv02i = (csiv02 - csv$mean)/csv$sd.
compute csv03i = (csiv03 - csv$mean)/csv$sd.
compute csv04i = (csiv04 - csv$mean)/csv$sd.
compute csv05i = (csiv05 - csv$mean)/csv$sd.
compute csv06i = (csiv06 - csv$mean)/csv$sd.
compute csv07i = (csiv07 - csv$mean)/csv$sd.
compute csv08i = (csiv08  - csv$mean)/csv$sd.
compute csv09i = (csiv09 - csv$mean)/csv$sd.
compute csv10i = (csiv10 - csv$mean)/csv$sd.
compute csv11i = (csiv11 - csv$mean)/csv$sd.
compute csv12i = (csiv12 - csv$mean)/csv$sd.
compute csv13i = (csiv13 - csv$mean)/csv$sd.
compute csv14i = (csiv14 - csv$mean)/csv$sd.
compute csv15i = (csiv15 - csv$mean)/csv$sd.
compute csv16i = (csiv16 - csv$mean)/csv$sd.
compute csv17i = (csiv17 - csv$mean)/csv$sd.
compute csv18i = (csiv18  - csv$mean)/csv$sd.
compute csv19i = (csiv19 - csv$mean)/csv$sd.
compute csv20i = (csiv20 - csv$mean)/csv$sd.
compute csv21i = (csiv21 - csv$mean)/csv$sd.
compute csv22i = (csiv22 - csv$mean)/csv$sd.
compute csv23i = (csiv23 - csv$mean)/csv$sd.
compute csv24i = (csiv24 - csv$mean)/csv$sd.
compute csv25i = (csiv25 - csv$mean)/csv$sd.
compute csv26i = (csiv26 - csv$mean)/csv$sd.
compute csv27i = (csiv27 - csv$mean)/csv$sd.
compute csv28i = (csiv28  - csv$mean)/csv$sd.
compute csv29i = (csiv29 - csv$mean)/csv$sd.
compute csv30i = (csiv30 - csv$mean)/csv$sd.
compute csv31i = (csiv31 - csv$mean)/csv$sd.
compute csv32i = (csiv32 - csv$mean)/csv$sd.
compute csv33i = (csiv33 - csv$mean)/csv$sd.
compute csv34i = (csiv34 - csv$mean)/csv$sd.
compute csv35i = (csiv35 - csv$mean)/csv$sd.
compute csv36i = (csiv36 - csv$mean)/csv$sd.
compute csv37i = (csiv37 - csv$mean)/csv$sd.
compute csv38i = (csiv38  - csv$mean)/csv$sd.
compute csv39i = (csiv39 - csv$mean)/csv$sd.
compute csv40i = (csiv40 - csv$mean)/csv$sd.
compute csv41i = (csiv41 - csv$mean)/csv$sd.
compute csv42i = (csiv42 - csv$mean)/csv$sd.
compute csv43i = (csiv43 - csv$mean)/csv$sd.
compute csv44i = (csiv44 - csv$mean)/csv$sd.
compute csv45i = (csiv45 - csv$mean)/csv$sd.
compute csv46i = (csiv46 - csv$mean)/csv$sd.
compute csv47i = (csiv47 - csv$mean)/csv$sd.
compute csv48i = (csiv48  - csv$mean)/csv$sd.
compute csv49i = (csiv49 - csv$mean)/csv$sd.
compute csv50i = (csiv50 - csv$mean)/csv$sd.
compute csv51i = (csiv51 - csv$mean)/csv$sd.
compute csv52i = (csiv52 - csv$mean)/csv$sd.
compute csv53i = (csiv53 - csv$mean)/csv$sd.
compute csv54i = (csiv54 - csv$mean)/csv$sd.
compute csv55i = (csiv55 - csv$mean)/csv$sd.
compute csv56i = (csiv56 - csv$mean)/csv$sd.
compute csv57i = (csiv57 - csv$mean)/csv$sd.
compute csv58i = (csiv58  - csv$mean)/csv$sd.
compute csv59i = (csiv59 - csv$mean)/csv$sd.
compute csv60i = (csiv60 - csv$mean)/csv$sd.
compute csv61i = (csiv61 - csv$mean)/csv$sd.
compute csv62i = (csiv62 - csv$mean)/csv$sd.
compute csv63i = (csiv63 - csv$mean)/csv$sd.
compute csv64i = (csiv64 - csv$mean)/csv$sd.
execute.

*----------------Reliability for Five Interpersonal Octants-------------------------------.
*since the stem asked about people feel close to and connected with
.

RELIABILITY
  /VARIABLES=csiv01 csiv09 csiv17 csiv25 csiv33 csiv41 csiv49 csiv57
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .
RELIABILITY
  /VARIABLES=csiv02 csiv10 csiv18 csiv26 csiv34 csiv42 csiv50 csiv58
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .
RELIABILITY
  /VARIABLES=csiv03 csiv11 csiv19 csiv27 csiv35 csiv43 csiv51 csiv59
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .
RELIABILITY
  /VARIABLES=csiv04 csiv12 csiv20 csiv28 csiv36 csiv44 csiv52 csiv60
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .
RELIABILITY
  /VARIABLES=csiv05 csiv13 csiv21 csiv29 csiv37 csiv45 csiv53 csiv61
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 .

compute HAg = mean (csv01i, csv09i, csv17i, csv25i, csv33i, csv41i, csv49i, csv57i).
compute HAgHC = mean (csv02i, csv10i, csv18i, csv26i, csv34i, csv42i, csv50i, csv58i).
compute HC = mean (csv03i, csv11i, csv19i, csv27i, csv35i, csv43i, csv51i, csv59i).
compute LAgHC = mean (csv04i, csv12i, csv20i, csv28i, csv36i, csv44i, csv52i, csv60i).
compute LAg = mean (csv05i, csv13i, csv21i, csv29i, csv37i, csv45i, csv53i, csv61i).
execute.

*-----Create aggregates for items that groups differ on-----------------------
.
compute influi = mean (csv01i, csv10i, csv26i, csv34i, csv49i, csv50i, csv57i).
compute adjusi = mean (csv04i, csv05i, csv28i, csv29i).
execute.

*-----Create aggregates based on theoretical predictions-----------------------
.
compute influ2i = mean (csv01i, csv34i, csv10i, csv26i, csv49i, csv50i, csv57i, csv41i).
compute adjus2i = mean (csv04i, csv05i, csv21i, csv13i, csv29i, csv45i, csv61i, csv60i).
compute adjus3i = mean (csv04i, csv05i, csv13i, csv29i).
execute.

RELIABILITY
  /VARIABLES=csiv01 csiv09 csiv26 csiv34 csiv41 csiv49 csiv50 csiv57
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR .

RELIABILITY
  /VARIABLES=csiv04 csiv05 csiv13 csiv29 csiv45 csiv60 csiv61
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR .

RELIABILITY
  /VARIABLES=csiv04 csiv05 csiv13 csiv29
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR .


*---Create aggregates based on factor analysis from another study-----------
.
compute hahc = mean (csiv26, csiv18, csiv10, csiv20, csiv25, csiv17, csiv09).
compute lahc = mean (csiv27, csiv03, csiv19, csiv11, csiv04, csiv28, csiv13, csiv29).
compute halc = mean (csiv14, csiv21, csiv06, csiv22, csiv30, csiv05, csiv12).
compute lalc = mean (csiv31, csiv08, csiv23, csiv07, csiv15, csiv32, csiv24, csiv16).
execute.

compute hahci = mean (csv26i, csv18i, csv10i, csv20i, csv25i, csv17i, csv09i).
compute lahci = mean (csv27i, csv03i, csv19i, csv11i, csv04i, csv28i, csv13i, csv29i).
compute halci = mean (csv14i, csv21i, csv06i, csv22i, csv30i, csv05i, csv12i).
compute lalci = mean (csv31i, csv08i, csv23i, csv07i, csv15i, csv32i, csv24i, csv16i).
execute.


