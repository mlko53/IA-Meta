title 'Real Affect Time 1 Ipsatized'.

compute ra1mean = mean (r$enth1, r$exci1, r$ener1, r$live1, r$moti1, r$eage1, r$happ1, r$cont1, 
r$calm1, r$rela1, r$comp1, r$peac1, r$ease1, r$harm1, r$quie1, r$stil1, 
r$dull1, r$slug1, r$slee1, r$sadx1, r$fear1, r$host1, r$nerv1, r$arou1)
.
compute ra1sd = sd (r$enth1, r$exci1, r$ener1, r$live1, r$moti1, r$eage1, r$happ1, r$cont1, 
r$calm1, r$rela1, r$comp1, r$peac1, r$ease1, r$harm1, r$quie1, r$stil1, 
r$dull1, r$slug1, r$slee1, r$sadx1, r$fear1, r$host1, r$nerv1, r$arou1)
.
execute.

compute r$enth1i = (r$enth1 - ra1mean)/ra1sd.
compute r$dull1i = (r$dull1 - ra1mean)/ra1sd.
compute r$exci1i = (r$exci1 - ra1mean)/ra1sd.
compute r$slee1i = (r$slee1 - ra1mean)/ra1sd.
compute r$comp1i = (r$comp1 - ra1mean)/ra1sd.
compute r$arou1i = (r$arou1 - ra1mean)/ra1sd.
compute r$ener1i = (r$ener1 - ra1mean)/ra1sd.
compute r$slug1i = (r$slug1 - ra1mean)/ra1sd.
compute r$moti1i = (r$moti1 - ra1mean)/ra1sd.
compute r$quie1i = (r$quie1 - ra1mean)/ra1sd.
compute r$cont1i = (r$cont1 - ra1mean)/ra1sd.
compute r$eage1i = (r$eage1 - ra1mean)/ra1sd.
compute r$fear1i = (r$fear1 - ra1mean)/ra1sd.
compute r$calm1i = (r$calm1 - ra1mean)/ra1sd.
compute r$harm1i = (r$harm1 - ra1mean)/ra1sd.
compute r$peac1i = (r$peac1 - ra1mean)/ra1sd.
compute r$stil1i = (r$stil1 - ra1mean)/ra1sd.
compute r$ease1i = (r$ease1 - ra1mean)/ra1sd.
compute r$nerv1i = (r$nerv1 - ra1mean)/ra1sd.
compute r$rela1i = (r$rela1 - ra1mean)/ra1sd.
compute r$sadx1i = (r$sadx1 - ra1mean)/ra1sd.
compute r$happ1i = (r$happ1 - ra1mean)/ra1sd.
compute r$live1i = (r$live1 - ra1mean)/ra1sd.
compute r$host1i = (r$host1 - ra1mean)/ra1sd.
.
execute.



