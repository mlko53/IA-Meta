*ipsatizing (mean and sd) individualism collectivism scores.

compute ic$total = mean.28 (ics01,ics02, ics03, ics04, ics05, ics06, ics07, ics08, ics09, ics10, ics11, ics12, ics13,
  ics14, ics15, ics16, ics17, ics18, ics19, ics20, ics21, ics22, ics23, ics24, ics25,
  ics26, ics27, ics28, ics29, ics30, ics31, ics32).
execute.

compute ic$sd = SD.28 (ics01,ics02, ics03, ics04, ics05, ics06, ics07, ics08, ics09, ics10, ics11, ics12, ics13,
  ics14, ics15, ics16, ics17, ics18, ics19, ics20, ics21, ics22, ics23, ics24, ics25,
  ics26, ics27, ics28, ics29, ics30, ics31, ics32).
execute.

compute ics01$i = (ics01 - ic$total)/ic$sd.
compute ics02$i = (ics02 - ic$total)/ic$sd.
compute ics03$i = (ics03 - ic$total)/ic$sd.
compute ics04$i = (ics04 - ic$total)/ic$sd.
compute ics05$i = (ics05 - ic$total)/ic$sd.
compute ics06$i = (ics06 - ic$total)/ic$sd.
compute ics07$i = (ics07 - ic$total)/ic$sd.
compute ics08$i = (ics08 - ic$total)/ic$sd.
compute ics09$i = (ics09 - ic$total)/ic$sd.
compute ics10$i = (ics10 - ic$total)/ic$sd.
compute ics11$i = (ics11 - ic$total)/ic$sd.
compute ics12$i = (ics12 - ic$total)/ic$sd.
compute ics13$i = (ics13 - ic$total)/ic$sd.
compute ics14$i = (ics14 - ic$total)/ic$sd.
compute ics15$i = (ics15 - ic$total)/ic$sd.
compute ics16$i = (ics16 - ic$total)/ic$sd.
compute ics17$i = (ics17 - ic$total)/ic$sd.
compute ics18$i = (ics18 - ic$total)/ic$sd.
compute ics19$i = (ics19 - ic$total)/ic$sd.
compute ics20$i = (ics20 - ic$total)/ic$sd.
compute ics21$i = (ics21 - ic$total)/ic$sd.
compute ics22$i = (ics22 - ic$total)/ic$sd.
compute ics23$i = (ics23 - ic$total)/ic$sd.
compute ics24$i = (ics24 - ic$total)/ic$sd.
compute ics25$i = (ics25 - ic$total)/ic$sd.
compute ics26$i = (ics26 - ic$total)/ic$sd.
compute ics27$i = (ics27 - ic$total)/ic$sd.
compute ics28$i = (ics28 - ic$total)/ic$sd.
compute ics29$i = (ics29 - ic$total)/ic$sd.
compute ics30$i = (ics30 - ic$total)/ic$sd.
compute ics31$i = (ics31 - ic$total)/ic$sd.
compute ics32$i = (ics32 - ic$total)/ic$sd.
execute.

compute ics$vci = mean(ics03$i, ics21$i, ics22$i).
compute ics$vii = mean(ics04$i, ics06$i, ics16$i).
compute ics$hii = mean(ics30$i, ics14$i, ics32$i).
execute.
RELIABILITY
  /VARIABLES=ics03 ics21 ics22
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR .

RELIABILITY
  /VARIABLES=ics04 ics06 ics16
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR .

RELIABILITY
  /VARIABLES=ics30 ics14 ics32
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR .
