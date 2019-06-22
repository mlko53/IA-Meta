title 'Calculate aggregates for Global Ideal Affect Ipsatized'.

compute gimean = mean (g$i$enth, g$i$exci, g$i$ener, g$i$live, g$i$moti, g$i$eage, g$i$happ, g$i$cont, 
g$i$calm, g$i$rela, g$i$comp, g$i$peac, g$i$ease, g$i$harm, g$i$quie, g$i$stil, 
g$i$dull, g$i$slug, g$i$slee, g$i$sadx, g$i$fear, g$i$host, g$i$nerv, g$i$arou)
.
compute gisd = sd (g$i$enth, g$i$exci, g$i$ener, g$i$live, g$i$moti, g$i$eage, g$i$happ, g$i$cont, 
g$i$calm, g$i$rela, g$i$comp, g$i$peac, g$i$ease, g$i$harm, g$i$quie, g$i$stil, 
g$i$dull, g$i$slug, g$i$slee, g$i$sadx, g$i$fear, g$i$host, g$i$nerv, g$i$arou)
.
execute.

compute gi$enthi = (g$i$enth - gimean)/gisd.
compute gi$dulli = (g$i$dull - gimean)/gisd.
compute gi$excii = (g$i$exci - gimean)/gisd.
compute gi$sleei = (g$i$slee - gimean)/gisd.
compute gi$compi = (g$i$comp - gimean)/gisd.
compute gi$aroui = (g$i$arou - gimean)/gisd.
compute gi$eneri = (g$i$ener - gimean)/gisd.
compute gi$slugi = (g$i$slug - gimean)/gisd.
compute gi$motii = (g$i$moti - gimean)/gisd.
compute gi$quiei = (g$i$quie - gimean)/gisd.
compute gi$conti = (g$i$cont - gimean)/gisd.
compute gi$eagei = (g$i$eage - gimean)/gisd.
compute gi$feari = (g$i$fear - gimean)/gisd.
compute gi$calmi = (g$i$calm - gimean)/gisd.
compute gi$harmi = (g$i$harm - gimean)/gisd.
compute gi$peaci = (g$i$peac - gimean)/gisd.
compute gi$stili = (g$i$stil - gimean)/gisd.
compute gi$easei = (g$i$ease - gimean)/gisd.
compute gi$nervi = (g$i$nerv - gimean)/gisd.
compute gi$relai = (g$i$rela - gimean)/gisd.
compute gi$sadxi = (g$i$sadx - gimean)/gisd.
compute gi$happi = (g$i$happ - gimean)/gisd.
compute gi$livei = (g$i$live - gimean)/gisd.
compute gi$hosti = (g$i$host - gimean)/gisd.
.
execute.

compute gi$HPAi = mean (gi$enthi, gi$excii, gi$eneri, gi$livei, gi$motii, gi$eagei).
compute gi$PLEi = mean (gi$happi, gi$conti).
compute gi$LNAi = mean (gi$calmi, gi$relai, gi$peaci, gi$compi, gi$easei, gi$harmi). 
compute gi$DISi = mean (gi$quiei, gi$stili).
compute gi$LPAi = mean (gi$dulli, gi$slugi, gi$sleei).
compute gi$UNPi = mean (gi$sadxi).
compute gi$HNAi = mean (gi$feari, gi$hosti, gi$nervi).
compute gi$ENGi = mean (gi$aroui)
.
execute.

var labels 
gi$HPAi 'Global Ideal Affect - High Positive Activation- Excited Ipsatized'
gi$PLEi 'Global Ideal Affect - Pleasantness - Happy Ipsatized'
gi$LNAi 'Global Ideal Affect - Low Negative Activation - Calm Ipsatized'
gi$DISi  'Global Ideal Affect - Disengagement- Still Ipsatized'
gi$LPAi 'Global Ideal Affect - Low Positive Activation - Dull Ipsatized'
gi$UNPi 'Global Ideal Affect - Unpleasantness - Sad Ipsatized'
gi$HNAi 'Global Ideal Affect - High Negative Activation - Fear Ipsatized'
gi$ENGi 'Global Ideal Affect - Strong Engagement - Aroused Ipsatized'
.


