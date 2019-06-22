Partner Affect

title 'Calculate aggregates for Partner Affect'.

compute p$HPA = mean (p$enth, p$exci, p$ener, p$live, p$moti, p$eage).
compute p$PLE = mean (p$happ, p$cont).
compute p$LNA = mean (p$calm, p$rela, p$comp, p$peac, p$ease, p$harm). 
compute p$DIS = mean (p$quie, p$stil).
compute p$LPA = mean (p$dull, p$slug, p$slee).
compute p$UNP = mean (p$sadx).
compute p$HNA = mean (p$fear, p$host, p$nerv).
compute p$ENG = mean (p$arou).
.
execute.

var labels 
p$HPA 'Partner Affect - High Positive Activation- Excited'
p$PLE 'Partner Affect  - Pleasantness - Happy'
p$LNA 'Partner Affect  - Low Negative Activation - Calm'
p$DIS  'Partner Affect  - Disengagement- Still'
p$LPA 'Partner Affect  - Low Positive Activation - Dull'
p$UNP 'Partner Affect  - Unpleasantness - Sad'
p$HNA 'Partner Affect  - High Negative Activation - Fear'
p$ENG 'Partner Affect  - Strong Engagement - Aroused'
.
