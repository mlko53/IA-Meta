*'Ideal predictors'.

*--------------Mean Deviating Ideal Predictors--------------.

compute ip$mean = mean (ip01, ip02, ip03, ip04, ip05, ip06, ip07, ip08, ip09, ip10, ip11, ip12, ip13, ip14, ip15, ip16, ip17, ip18, ip19, ip20, ip21, ip22, ip23, ip24, ip25,
  ip26, ip27, ip28).
compute ip$sd= SD (ip01, ip02, ip03, ip04, ip05, ip06, ip07, ip08, ip09, ip10, ip11, ip12, ip13, ip14, ip15, ip16, ip17, ip18, ip19, ip20, ip21, ip22, ip23, ip24, ip25,
  ip26, ip27, ip28).
execute.

compute ip01m = ip01 - ip$mean.
compute ip02m = ip02 - ip$mean.
compute ip03m = ip03 - ip$mean.
compute ip04m = ip04 - ip$mean.
compute ip05m = ip05 - ip$mean.
compute ip06m = ip06 - ip$mean.
compute ip07m = ip07 - ip$mean.
compute ip08m = ip08 - ip$mean.
compute ip09m = ip09 - ip$mean.
compute ip10m = ip10 - ip$mean.
compute ip11m = ip11 - ip$mean.
compute ip12m = ip12 - ip$mean.
compute ip13m = ip13 - ip$mean.
compute ip14m = ip14 - ip$mean.
compute ip15m = ip15 - ip$mean.
compute ip16m = ip16 - ip$mean.
compute ip17m = ip17 - ip$mean.
compute ip18m = ip18 - ip$mean.
compute ip19m = ip19 - ip$mean.
compute ip20m = ip20 - ip$mean.
compute ip21m = ip21 - ip$mean.
compute ip22m = ip22 - ip$mean.
compute ip23m = ip23 - ip$mean.
compute ip24m = ip24 - ip$mean.
compute ip25m = ip25 - ip$mean.
compute ip26m = ip26 - ip$mean.
compute ip27m = ip27 - ip$mean.
compute ip28m = ip28 - ip$mean.
execute.

*------------Ipsatizing Ideal Predictors----------------------
.

compute ip01i = (ip01 - ip$mean)/ip$sd.
compute ip02i = (ip02 - ip$mean)/ip$sd.
compute ip03i = (ip03 - ip$mean)/ip$sd.
compute ip04i = (ip04 - ip$mean)/ip$sd.
compute ip05i = (ip05 - ip$mean)/ip$sd.
compute ip06i = (ip06 - ip$mean)/ip$sd.
compute ip07i = (ip07 - ip$mean)/ip$sd.
compute ip08i = (ip08 - ip$mean)/ip$sd.
compute ip09i = (ip09 - ip$mean)/ip$sd.
compute ip10i = (ip10 - ip$mean)/ip$sd.
compute ip11i = (ip11 - ip$mean)/ip$sd.
compute ip12i = (ip12 - ip$mean)/ip$sd.
compute ip13i = (ip13 - ip$mean)/ip$sd.
compute ip14i = (ip14 - ip$mean)/ip$sd.
compute ip15i = (ip15 - ip$mean)/ip$sd.
compute ip16i = (ip16 - ip$mean)/ip$sd.
compute ip17i = (ip17 - ip$mean)/ip$sd.
compute ip18i = (ip18 - ip$mean)/ip$sd.
compute ip19i = (ip19 - ip$mean)/ip$sd.
compute ip20i = (ip20 - ip$mean)/ip$sd.
compute ip21i = (ip21 - ip$mean)/ip$sd.
compute ip22i = (ip22 - ip$mean)/ip$sd.
compute ip23i = (ip23 - ip$mean)/ip$sd.
compute ip24i = (ip24 - ip$mean)/ip$sd.
compute ip25i = (ip25 - ip$mean)/ip$sd.
compute ip26i = (ip26 - ip$mean)/ip$sd.
compute ip27i = (ip27 - ip$mean)/ip$sd.
compute ip28i = (ip28 - ip$mean)/ip$sd.
execute.

*---------Aggregates based on Factor Analyses--------------.

compute ip$self = mean (ip25i,ip26i, ip27i, ip28i, ip23i, ip16i, ip02i).
compute ip$fate = mean (ip06i, ip07i, ip08i, ip12i).
compute ip$oexp = mean (ip18i, ip19i, ip13i).
compute ip$awar = mean (ip21i, ip15i).
execute.
