title 'Calculate aggregates for Real Affect Time 1'.

compute r$HPA1 = mean (r$enth1, r$exci1, r$ener1, r$live1, r$moti1, r$eage1).
compute r$PLE1 = mean (r$happ1, r$cont1).
compute r$LNA1 = mean (r$calm1, r$rela1, r$comp1, r$peac1, r$ease1, r$harm1). 
compute r$DIS1 = mean (r$quie1, r$stil1).
compute r$LPA1 = mean (r$dull1, r$slug1, r$slee1).
compute r$UNP1 = mean (r$sadx1).
compute r$HNA1 = mean (r$fear1, r$host1, r$nerv1).
compute r$ENG1 = mean (r$arou1).
.
execute.

var labels 
r$HPA1 'Real Affect Time 1 - High Positive Activation- Excited'
r$PLE1 'Real Affect Time 1- Pleasantness - Happy'
r$LNA1 'Real Affect Time 1- Low Negative Activation - Calm'
r$DIS1  'Real Affect Time 1- Disengagement- Still'
r$LPA1 'Real Affect Time 1- Low Positive Activation - Dull'
r$UNP1 'Real Affect Time 1- Unpleasantness - Sad'
r$HNA1 'Real Affect Time 1- High Negative Activation - Fear'
r$ENG1 'Real Affect Time 1- Strong Engagement - Aroused'
.

title 'Calculate aggregates for Real Affect Time 2'.

compute r$HPA2 = mean (r$enth2, r$exci2, r$ener2, r$live2, r$moti2, r$eage2).
compute r$PLE2 = mean (r$happ2, r$cont2).
compute r$LNA2 = mean (r$calm2, r$rela2, r$comp2, r$peac2, r$ease2, r$harm2). 
compute r$DIS2 = mean (r$quie2, r$stil2).
compute r$LPA2 = mean (r$dull2, r$slug2, r$slee2).
compute r$UNP2 = mean (r$sadx2).
compute r$HNA2 = mean (r$fear2, r$host2, r$nerv2).
compute r$ENG2 = mean (r$arou2).
.
execute.

var labels 
r$HPA2 'Real Affect Time 2 - High Positive Activation- Excited'
r$PLE2 'Real Affect Time 2- Pleasantness - Happy'
r$LNA2 'Real Affect Time 2- Low Negative Activation - Calm'
r$DIS2  'Real Affect Time 2- Disengagement- Still'
r$LPA2 'Real Affect Time 2- Low Positive Activation - Dull'
r$UNP2 'Real Affect Time 2- Unpleasantness - Sad'
r$HNA2 'Real Affect Time 2- High Negative Activation - Fear'
r$ENG2 'Real Affect Time 2- Strong Engagement - Aroused'
.

