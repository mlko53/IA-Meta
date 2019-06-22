title 'Calculate aggregates for Real Affect Time 1'.

compute r$HPA1i = mean (r$enth1i, r$exci1i, r$ener1i, r$live1i, r$moti1i, r$eage1i).
compute r$PLE1i = mean (r$happ1i, r$cont1i).
compute r$LNA1i = mean (r$calm1i, r$rela1i, r$comp1i, r$peac1i, r$ease1i, r$harm1i). 
compute r$DIS1i = mean (r$quie1i, r$stil1i).
compute r$LPA1i = mean (r$dull1i, r$slug1i, r$slee1i).
compute r$UNP1i = mean (r$sadx1i).
compute r$HNA1i = mean (r$fear1i, r$host1i, r$nerv1i).
compute r$ENG1i = mean (r$arou1i).
.
execute.

var labels 
r$HPA1i 'Real Affect Time 1i - High Positive Activation Ipsatized - Excited'
r$PLE1i 'Real Affect Time 1i- Pleasantness Ipsatized- Happy'
r$LNA1i 'Real Affect Time 1i- Low Negative Activation Ipsatized - Calm'
r$DIS1i  'Real Affect Time 1i- Disengagement Ipsatized - Still'
r$LPA1i 'Real Affect Time 1i- Low Positive Activation Ipsatized - Dull'
r$UNP1i 'Real Affect Time 1i- Unpleasantness Ipsatized - Sad'
r$HNA1i 'Real Affect Time 1i- High Negative Activation Ipsatized - Fear'
r$ENG1i 'Real Affect Time 1i- Strong Engagement Ipsatized - Aroused'
.

title 'Calculate aggregates for Real Affect Time 2'.

compute r$HPA2i = mean (r$enth2i, r$exci2i, r$ener2i, r$live2i, r$moti2i, r$eage2i).
compute r$PLE2i = mean (r$happ2i, r$cont2i).
compute r$LNA2i = mean (r$calm2i, r$rela2i, r$comp2i, r$peac2i, r$ease2i, r$harm2i). 
compute r$DIS2i = mean (r$quie2i, r$stil2i).
compute r$LPA2i = mean (r$dull2i, r$slug2i, r$slee2i).
compute r$UNP2i = mean (r$sadx2i).
compute r$HNA2i = mean (r$fear2i, r$host2i, r$nerv2i).
compute r$ENG2i = mean (r$arou2i).
.
execute.

var labels 
r$HPA2i 'Real Affect Time 2i - High Positive Activation Ipsatized - Excited'
r$PLE2i 'Real Affect Time 2i- Pleasantness Ipsatized - Happy'
r$LNA2i 'Real Affect Time 2i- Low Negative Activation Ipsatized - Calm'
r$DIS2i  'Real Affect Time 2i- Disengagement Ipsatized - Still'
r$LPA2i 'Real Affect Time 2i- Low Positive Activation Ipsatized - Dull'
r$UNP2i 'Real Affect Time 2i- Unpleasantness Ipsatized- Sad'
r$HNA2i 'Real Affect Time 2i- High Negative Activation Ipsatized - Fear'
r$ENG2i 'Real Affect Time 2i- Strong Engagement Ipsatized - Aroused'
.
