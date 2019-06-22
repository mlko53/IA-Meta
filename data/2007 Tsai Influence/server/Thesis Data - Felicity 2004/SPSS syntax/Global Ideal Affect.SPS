title 'Calculate aggregates for Global Ideal Affect'.

compute g$i$HPA = mean (g$i$enth, g$i$exci, g$i$ener, g$i$live, g$i$moti, g$i$eage).
compute g$i$PLE = mean (g$i$happ, g$i$cont).
compute g$i$LNA = mean (g$i$calm, g$i$rela, g$i$peac, g$i$comp, g$i$ease, g$i$harm). 
compute g$i$DIS = mean (g$i$quie, g$i$stil).
compute g$i$LPA = mean (g$i$dull, g$i$slug, g$i$slee).
compute g$i$UNP = mean (g$i$sadx).
compute g$i$HNA = mean (g$i$fear, g$i$host, g$i$nerv).
compute g$i$ENG = mean (g$i$arou)
.
execute.

var labels 
g$i$HPA 'Global Ideal Affect - High Positive Activation- Excited'
g$i$PLE 'Global Ideal Affect - Pleasantness - Happy'
g$i$LNA 'Global Ideal Affect - Low Negative Activation - Calm'
g$i$DIS  'Global Ideal Affect - Disengagement- Still'
g$i$LPA 'Global Ideal Affect - Low Positive Activation - Dull'
g$i$UNP 'Global Ideal Affect - Unpleasantness - Sad'
g$i$HNA 'Global Ideal Affect - High Negative Activation - Fear'
g$i$ENG 'Global Ideal Affect - Strong Engagement - Aroused'
.

