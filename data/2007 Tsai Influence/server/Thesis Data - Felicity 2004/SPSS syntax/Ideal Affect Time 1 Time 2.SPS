title 'Calculate aggregates for Ideal Affect Time 1'.

compute i$HPA1 = mean (i$enth1, i$exci1, i$ener1, i$live1, i$moti1, i$eage1).
compute i$PLE1 = mean (i$happ1, i$cont1).
compute i$LNA1 = mean (i$calm1, i$rela1, i$comp1, i$peac1, i$ease1, i$harm1). 
compute i$DIS1 = mean (i$quie1, i$stil1).
compute i$LPA1 = mean (i$dull1, i$slug1, i$slee1).
compute i$UNP1 = mean (i$sadx1).
compute i$HNA1 = mean (i$fear1, i$host1, i$nerv1).
compute i$ENG1 = mean (i$arou1).
.
execute.

var labels 
i$HPA1 'Ideal Affect Time 1 - High Positive Activation- Excited'
i$PLE1 'Ideal Affect Time 1- Pleasantness - Happy'
i$LNA1 'Ideal Affect Time 1- Low Negative Activation - Calm'
i$DIS1  'Ideal Affect Time 1- Disengagement- Still'
i$LPA1 'Ideal Affect Time 1- Low Positive Activation - Dull'
i$UNP1 'Ideal Affect Time 1- Unpleasantness - Sad'
i$HNA1 'Ideal Affect Time 1- High Negative Activation - Fear'
i$ENG1 'Ideal Affect Time 1- Strong Engagement - Aroused'
.

title 'Calculate aggregates for Ideal Affect Time 2'.

compute i$HPA2 = mean (i$enth2, i$exci2, i$ener2, i$live2, i$moti2, i$eage2).
compute i$PLE2 = mean (i$happ2, i$cont2).
compute i$LNA2 = mean (i$calm2, i$rela2, i$comp2, i$peac2, i$ease2, i$harm2). 
compute i$DIS2 = mean (i$quie2, i$stil2).
compute i$LPA2 = mean (i$dull2, i$slug2, i$slee2).
compute i$UNP2 = mean (i$sadx2).
compute i$HNA2 = mean (i$fear2, i$host2, i$nerv2).
compute i$ENG2 = mean (i$arou2).
.
execute.

var labels 
i$HPA2 'Ideal Affect Time 2 - High Positive Activation- Excited'
i$PLE2 'Ideal Affect Time 2- Pleasantness - Happy'
i$LNA2 'Ideal Affect Time 2- Low Negative Activation - Calm'
i$DIS2  'Ideal Affect Time 2- Disengagement- Still'
i$LPA2 'Ideal Affect Time 2- Low Positive Activation - Dull'
i$UNP2 'Ideal Affect Time 2- Unpleasantness - Sad'
i$HNA2 'Ideal Affect Time 2- High Negative Activation - Fear'
i$ENG2 'Ideal Affect Time 2- Strong Engagement - Aroused'
.
