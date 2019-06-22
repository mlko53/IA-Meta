title 'Calculate aggregates for Global Real Affect'.

compute g$r$HPA = mean (g$r$enth, g$r$exci, g$r$ener, g$r$live, g$r$moti, g$r$eage).
compute g$r$PLE = mean (g$r$happ, g$r$cont).
compute g$r$LNA = mean (g$r$calm, g$r$rela, g$r$peac, g$r$comp, g$r$ease, g$r$harm). 
compute g$r$DIS = mean (g$r$quie, g$r$stil).
compute g$r$LPA = mean (g$r$dull, g$r$slug, g$r$slee).
compute g$r$UNP = mean (g$r$sadx).
compute g$r$HNA = mean (g$r$fear, g$r$host, g$r$nerv).
compute g$r$ENG = mean (g$r$arou)
.
execute.

var labels 
g$r$HPA 'Global Real Affect - High Positive Activation- Excited'
g$r$PLE 'Global Real Affect - Pleasantness - Happy'
g$r$LNA 'Global Real Affect - Low Negative Activation - Calm'
g$r$DIS  'Global Real Affect - Disengagement- Still'
g$r$LPA 'Global Real Affect - Low Positive Activation - Dull'
g$r$UNP 'Global Real Affect - Unpleasantness - Sad'
g$r$HNA 'Global Real Affect - High Negative Activation - Fear'
g$r$ENG 'Global Real Affect - Strong Engagement - Aroused'
.
