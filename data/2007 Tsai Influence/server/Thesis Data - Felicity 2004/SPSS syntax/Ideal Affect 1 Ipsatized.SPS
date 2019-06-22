title 'Ideal Affect Time 1 Ipsatized'.

compute ia1mean = mean (i$enth1, i$exci1, i$ener1, i$live1, i$moti1, i$eage1, i$happ1, i$cont1, 
i$calm1, i$rela1, i$comp1, i$peac1, i$ease1, i$harm1, i$quie1, i$stil1, 
i$dull1, i$slug1, i$slee1, i$sadx1, i$fear1, i$host1, i$nerv1, i$arou1)
.
compute ia1sd = sd (i$enth1, i$exci1, i$ener1, i$live1, i$moti1, i$eage1, i$happ1, i$cont1, 
i$calm1, i$rela1, i$comp1, i$peac1, i$ease1, i$harm1, i$quie1, i$stil1, 
i$dull1, i$slug1, i$slee1, i$sadx1, i$fear1, i$host1, i$nerv1, i$arou1)
.
execute.

compute i$enth1i = (i$enth1 - ia1mean)/ia1sd.
compute i$dull1i = (i$dull1 - ia1mean)/ia1sd.
compute i$exci1i = (i$exci1 - ia1mean)/ia1sd.
compute i$slee1i = (i$slee1 - ia1mean)/ia1sd.
compute i$comp1i = (i$comp1 - ia1mean)/ia1sd.
compute i$arou1i = (i$arou1 - ia1mean)/ia1sd.
compute i$ener1i = (i$ener1 - ia1mean)/ia1sd.
compute i$slug1i = (i$slug1 - ia1mean)/ia1sd.
compute i$moti1i = (i$moti1 - ia1mean)/ia1sd.
compute i$quie1i = (i$quie1 - ia1mean)/ia1sd.
compute i$cont1i = (i$cont1 - ia1mean)/ia1sd.
compute i$eage1i = (i$eage1 - ia1mean)/ia1sd.
compute i$fear1i = (i$fear1 - ia1mean)/ia1sd.
compute i$calm1i = (i$calm1 - ia1mean)/ia1sd.
compute i$harm1i = (i$harm1 - ia1mean)/ia1sd.
compute i$peac1i = (i$peac1 - ia1mean)/ia1sd.
compute i$stil1i = (i$stil1 - ia1mean)/ia1sd.
compute i$ease1i = (i$ease1 - ia1mean)/ia1sd.
compute i$nerv1i = (i$nerv1 - ia1mean)/ia1sd.
compute i$rela1i = (i$rela1 - ia1mean)/ia1sd.
compute i$sadx1i = (i$sadx1 - ia1mean)/ia1sd.
compute i$happ1i = (i$happ1 - ia1mean)/ia1sd.
compute i$live1i = (i$live1 - ia1mean)/ia1sd.
compute i$host1i = (i$host1 - ia1mean)/ia1sd.
.
execute.

