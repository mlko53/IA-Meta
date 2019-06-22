title 'Calculate aggregates for Global Real Affect Ipsatized'.

compute grmean = mean (g$r$enth, g$r$exci, g$r$ener, g$r$live, g$r$moti, g$r$eage, g$r$happ, g$r$cont, 
g$r$calm, g$r$rela, g$r$comp, g$r$peac, g$r$ease, g$r$harm, g$r$quie, g$r$stil, 
g$r$dull, g$r$slug, g$r$slee, g$r$sadx, g$r$fear, g$r$host, g$r$nerv, g$r$arou)
.
compute grsd = sd (g$r$enth, g$r$exci, g$r$ener, g$r$live, g$r$moti, g$r$eage, g$r$happ, g$r$cont, 
g$r$calm, g$r$rela, g$r$comp, g$r$peac, g$r$ease, g$r$harm, g$r$quie, g$r$stil, 
g$r$dull, g$r$slug, g$r$slee, g$r$sadx, g$r$fear, g$r$host, g$r$nerv, g$r$arou)
.
execute.

compute gr$enthi = (g$r$enth - grmean)/grsd.
compute gr$dulli = (g$r$dull - grmean)/grsd.
compute gr$excii = (g$r$exci - grmean)/grsd.
compute gr$sleei = (g$r$slee - grmean)/grsd.
compute gr$compi = (g$r$comp - grmean)/grsd.
compute gr$aroui = (g$r$arou - grmean)/grsd.
compute gr$eneri = (g$r$ener - grmean)/grsd.
compute gr$slugi = (g$r$slug - grmean)/grsd.
compute gr$motii = (g$r$moti - grmean)/grsd.
compute gr$quiei = (g$r$quie - grmean)/grsd.
compute gr$conti = (g$r$cont - grmean)/grsd.
compute gr$eagei = (g$r$eage - grmean)/grsd.
compute gr$feari = (g$r$fear - grmean)/grsd.
compute gr$calmi = (g$r$calm - grmean)/grsd.
compute gr$harmi = (g$r$harm - grmean)/grsd.
compute gr$peaci = (g$r$peac - grmean)/grsd.
compute gr$stili = (g$r$stil - grmean)/grsd.
compute gr$easei = (g$r$ease - grmean)/grsd.
compute gr$nervi = (g$r$nerv - grmean)/grsd.
compute gr$relai = (g$r$rela - grmean)/grsd.
compute gr$sadxi = (g$r$sadx - grmean)/grsd.
compute gr$happi = (g$r$happ - grmean)/grsd.
compute gr$livei = (g$r$live - grmean)/grsd.
compute gr$hosti = (g$r$host - grmean)/grsd.
.
execute.

compute gr$HPAi = mean (gr$enthi, gr$excii, gr$eneri, gr$livei, gr$motii, gr$eagei).
compute gr$PLEi = mean (gr$happi, gr$conti).
compute gr$LNAi = mean (gr$calmi, gr$relai, gr$peaci, gr$compi, gr$easei, gr$harmi). 
compute gr$DISi = mean (gr$quiei, gr$stili).
compute gr$LPAi = mean (gr$dulli, gr$slugi, gr$sleei).
compute gr$UNPi = mean (gr$sadxi).
compute gr$HNAi = mean (gr$feari, gr$hosti, gr$nervi).
compute gr$ENGi = mean (gr$aroui)
.
execute.

var labels 
gr$HPAi 'Global Real Affect - High Positive Activation- Excited Ipsatized'
gr$PLEi 'Global Real Affect - Pleasantness - Happy Ipsatized'
gr$LNAi 'Global Real Affect - Low Negative Activation - Calm Ipsatized'
gr$DISi  'Global Real Affect - Disengagement- Still Ipsatized'
gr$LPAi 'Global Real Affect - Low Positive Activation - Dull Ipsatized'
gr$UNPi 'Global Real Affect - Unpleasantness - Sad Ipsatized'
gr$HNAi 'Global Real Affect - High Negative Activation - Fear Ipsatized'
gr$ENGi 'Global Real Affect - Strong Engagement - Aroused Ipsatized'
.

