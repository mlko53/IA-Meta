recode  cesd04 cesd08 cesd12 cesd16 
(3=0) (2=1) (1=2) (0=3) into cesd04r cesd08r cesd12r cesd16r.
execute.


compute cesd =sum (cesd01, cesd02, cesd03, cesd05, cesd06, cesd07, cesd09, cesd10, cesd11,
  cesd13, cesd14, cesd15, cesd17, cesd18, cesd19, cesd20, cesd04r,  cesd08r, cesd12r, cesd16r).
execute.

RELIABILITY
  /VARIABLES=cesd01 cesd02 cesd03 cesd05 cesd06 cesd07 cesd09 cesd10 cesd11
  cesd13 cesd14 cesd15 cesd17 cesd18 cesd19 cesd20 cesd04r cesd08r cesd12r
  cesd16r
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0 
.

*Ipsatize.

compute cesd$tot = mean.18(cesd01, cesd02, cesd03, cesd05, cesd06, cesd07, cesd09, cesd10, cesd11, 
cesd13, cesd14, cesd15, cesd17, cesd18, cesd19, cesd20, cesd04r,  cesd08r, cesd12r, cesd16r).
compute cesd$sd = SD.18(cesd01, cesd02, cesd03, cesd05, cesd06, cesd07, cesd09, cesd10, cesd11, 
cesd13, cesd14, cesd15, cesd17, cesd18, cesd19, cesd20, cesd04r,  cesd08r, cesd12r, cesd16r).

compute cesd01$i = (cesd01 - cesd$tot)/cesd$sd.
compute cesd02$i = (cesd02 - cesd$tot)/cesd$sd.
compute cesd03$i = (cesd03 - cesd$tot)/cesd$sd.
compute ces04r$i = (cesd04r - cesd$tot)/cesd$sd.
compute cesd05$i = (cesd05 - cesd$tot)/cesd$sd.
compute cesd06$i = (cesd06 - cesd$tot)/cesd$sd.
compute cesd07$i = (cesd07 - cesd$tot)/cesd$sd.
compute ces08r$i = (cesd08r - cesd$tot)/cesd$sd.
compute cesd09$i = (cesd09 - cesd$tot)/cesd$sd.
compute cesd10$i = (cesd10 - cesd$tot)/cesd$sd.
compute cesd11$i = (cesd11 - cesd$tot)/cesd$sd.
compute ces12r$i = (cesd12r - cesd$tot)/cesd$sd.
compute cesd13$i = (cesd13 - cesd$tot)/cesd$sd.
compute cesd14$i = (cesd14 - cesd$tot)/cesd$sd.
compute cesd15$i = (cesd15 - cesd$tot)/cesd$sd.
compute ces16r$i = (cesd16r - cesd$tot)/cesd$sd.
compute cesd17$i = (cesd17 - cesd$tot)/cesd$sd.
compute cesd18$i = (cesd18 - cesd$tot)/cesd$sd.
compute cesd19$i = (cesd19 - cesd$tot)/cesd$sd.
compute cesd20$i = (cesd20 - cesd$tot)/cesd$sd.
execute.


