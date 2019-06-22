title 'Partner Affect Ipsatized'.

compute pmean = mean (p$enth, p$exci, p$ener, p$live, p$moti, p$eage, p$happ, p$cont, 
p$calm, p$rela, p$comp, p$peac, p$ease, p$harm, p$quie, p$stil, 
p$dull, p$slug, p$slee, p$sadx, p$fear, p$host, p$nerv, p$arou)
.
compute psd = sd (p$enth, p$exci, p$ener, p$live, p$moti, p$eage, p$happ, p$cont, 
p$calm, p$rela, p$comp, p$peac, p$ease, p$harm, p$quie, p$stil, 
p$dull, p$slug, p$slee, p$sadx, p$fear, p$host, p$nerv, p$arou)
.
execute.

compute p$enthi = (p$enth - pmean)/psd.
compute p$dulli = (p$dull - pmean)/psd.
compute p$excii = (p$exci - pmean)/psd.
compute p$sleei = (p$slee - pmean)/psd.
compute p$compi = (p$comp - pmean)/psd.
compute p$aroui = (p$arou - pmean)/psd.
compute p$eneri = (p$ener - pmean)/psd.
compute p$slugi = (p$slug - pmean)/psd.
compute p$motii = (p$moti - pmean)/psd.
compute p$quiei = (p$quie - pmean)/psd.
compute p$conti = (p$cont - pmean)/psd.
compute p$eagei = (p$eage - pmean)/psd.
compute p$feari = (p$fear - pmean)/psd.
compute p$calmi = (p$calm - pmean)/psd.
compute p$harmi = (p$harm - pmean)/psd.
compute p$peaci = (p$peac - pmean)/psd.
compute p$stili = (p$stil - pmean)/psd.
compute p$easei = (p$ease - pmean)/psd.
compute p$nervi = (p$nerv - pmean)/psd.
compute p$relai = (p$rela - pmean)/psd.
compute p$sadxi = (p$sadx - pmean)/psd.
compute p$happi = (p$happ - pmean)/psd.
compute p$livei = (p$live - pmean)/psd.
compute p$hosti = (p$host - pmean)/psd.
.
execute.




title 'Calculate aggregates for Partner Affect '.

compute p$HPAi = mean (p$enthi, p$excii, p$eneri, p$livei, p$motii, p$eagei).
compute p$PLEi = mean (p$happi, p$conti).
compute p$LNAi = mean (p$calmi, p$relai, p$compi, p$peaci, p$easei, p$harmi). 
compute p$DISi = mean (p$quiei, p$stili).
compute p$LPAi = mean (p$dulli, p$slugi, p$sleei).
compute p$UNPi = mean (p$sadxi).
compute p$HNAi = mean (p$feari, p$hosti, p$nervi).
compute p$ENGi = mean (p$aroui).
.
execute.

var labels 
p$HPAi 'Partner Affect  - High Positive Activation Ipsatized - Excited'
p$PLEi 'Partner Affect - Pleasantness Ipsatized- Happy'
p$LNAi 'Partner Affect - Low Negative Activation Ipsatized - Calm'
p$DISi  'Partner Affect - Disengagement Ipsatized - Still'
p$LPAi 'Partner Affect - Low Positive Activation Ipsatized - Dull'
p$UNPi 'Partner Affect - Unpleasantness Ipsatized - Sad'
p$HNAi 'Partner Affect - High Negative Activation Ipsatized - Fear'
p$ENGi 'Partner Affect - Strong Engagement Ipsatized - Aroused'
.






