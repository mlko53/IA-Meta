*-----Satisfaction with Life Scale----------------.

RELIABILITY
  /VARIABLES=swls01 swls02 swls03 swls04 swls05
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=CORR .

compute swl = sum (swls01, swls02, swls03, swls04, swls05).
execute.

compute swl$mean = mean (swls01, swls02, swls03, swls04, swls05).
compute swl$sd = SD(swls01, swls02, swls03, swls04, swls05).
execute.

compute swl01i = (swls01 - swl$mean)/swl$sd.
compute swl02i = (swls02 - swl$mean/swl$sd).
compute swl03i = (swls03 - swl$mean)/swl$sd.
compute swl04i = (swls04 - swl$mean)/swl$sd.
compute swl05i = (swls05 - swl$mean)/swl$sd.
execute.

compute swli = mean (swl01i, swl02i, swl03i, swl04i, swl05i).
execute.

compute d$hapi = i$hap1i - r$hap1i.
compute d$lapi = i$lap1i - r$lap1i.
execute.





