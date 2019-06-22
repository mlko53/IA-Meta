title 'Calculate aggregates for Ideal Affect Time 1'.

compute i$HPA1i = mean (i$enth1i, i$exci1i, i$ener1i, i$live1i, i$moti1i, i$eage1i).
compute i$PLE1i = mean (i$happ1i, i$cont1i).
compute i$LNA1i = mean (i$calm1i, i$rela1i, i$comp1i, i$peac1i, i$ease1i, i$harm1i). 
compute i$DIS1i = mean (i$quie1i, i$stil1i).
compute i$LPA1i = mean (i$dull1i, i$slug1i, i$slee1i).
compute i$UNP1i = mean (i$sadx1i).
compute i$HNA1i = mean (i$fear1i, i$host1i, i$nerv1i).
compute i$ENG1i = mean (i$arou1i).
.
execute.

var labels 
i$HPA1i 'Ideal Affect Time 1i - High Positive Activation Ipsatized - Excited'
i$PLE1i 'Ideal Affect Time 1i- Pleasantness Ipsatized- Happy'
i$LNA1i 'Ideal Affect Time 1i- Low Negative Activation Ipsatized - Calm'
i$DIS1i  'Ideal Affect Time 1i- Disengagement Ipsatized - Still'
i$LPA1i 'Ideal Affect Time 1i- Low Positive Activation Ipsatized - Dull'
i$UNP1i 'Ideal Affect Time 1i- Unpleasantness Ipsatized - Sad'
i$HNA1i 'Ideal Affect Time 1i- High Negative Activation Ipsatized - Fear'
i$ENG1i 'Ideal Affect Time 1i- Strong Engagement Ipsatized - Aroused'
.

title 'Calculate aggregates for Ideal Affect Time 2'.

compute i$HPA2i = mean (i$enth2i, i$exci2i, i$ener2i, i$live2i, i$moti2i, i$eage2i).
compute i$PLE2i = mean (i$happ2i, i$cont2i).
compute i$LNA2i = mean (i$calm2i, i$rela2i, i$comp2i, i$peac2i, i$ease2i, i$harm2i). 
compute i$DIS2i = mean (i$quie2i, i$stil2i).
compute i$LPA2i = mean (i$dull2i, i$slug2i, i$slee2i).
compute i$UNP2i = mean (i$sadx2i).
compute i$HNA2i = mean (i$fear2i, i$host2i, i$nerv2i).
compute i$ENG2i = mean (i$arou2i).
.
execute.

var labels 
i$HPA2i 'Ideal Affect Time 2i - High Positive Activation Ipsatized - Excited'
i$PLE2i 'Ideal Affect Time 2i- Pleasantness Ipsatized - Happy'
i$LNA2i 'Ideal Affect Time 2i- Low Negative Activation Ipsatized - Calm'
i$DIS2i  'Ideal Affect Time 2i- Disengagement Ipsatized - Still'
i$LPA2i 'Ideal Affect Time 2i- Low Positive Activation Ipsatized - Dull'
i$UNP2i 'Ideal Affect Time 2i- Unpleasantness Ipsatized- Sad'
i$HNA2i 'Ideal Affect Time 2i- High Negative Activation Ipsatized - Fear'
i$ENG2i 'Ideal Affect Time 2i- Strong Engagement Ipsatized - Aroused'
.

