title 'Real Affect Time 2 Ipsatized'.

compute ra2mean = mean (r$enth2, r$exci2, r$ener2, r$live2, r$moti2, r$eage2, r$happ2, r$cont2, 
r$calm2, r$rela2, r$comp2, r$peac2, r$ease2, r$harm2, r$quie2, r$stil2, 
r$dull2, r$slug2, r$slee2, r$sadx2, r$fear2, r$host2, r$nerv2, r$arou2)
.
compute ra2sd = sd (r$enth2, r$exci2, r$ener2, r$live2, r$moti2, r$eage2, r$happ2, r$cont2, 
r$calm2, r$rela2, r$comp2, r$peac2, r$ease2, r$harm2, r$quie2, r$stil2, 
r$dull2, r$slug2, r$slee2, r$sadx2, r$fear2, r$host2, r$nerv2, r$arou2)
.
execute.

compute r$enth2i = (r$enth2 - ra2mean)/ra2sd.
compute r$dull2i = (r$dull2 - ra2mean)/ra2sd.
compute r$exci2i = (r$exci2 - ra2mean)/ra2sd.
compute r$slee2i = (r$slee2 - ra2mean)/ra2sd.
compute r$comp2i = (r$comp2 - ra2mean)/ra2sd.
compute r$arou2i = (r$arou2 - ra2mean)/ra2sd.
compute r$ener2i = (r$ener2 - ra2mean)/ra2sd.
compute r$slug2i = (r$slug2 - ra2mean)/ra2sd.
compute r$moti2i = (r$moti2 - ra2mean)/ra2sd.
compute r$quie2i = (r$quie2 - ra2mean)/ra2sd.
compute r$cont2i = (r$cont2 - ra2mean)/ra2sd.
compute r$eage2i = (r$eage2 - ra2mean)/ra2sd.
compute r$fear2i = (r$fear2 - ra2mean)/ra2sd.
compute r$calm2i = (r$calm2 - ra2mean)/ra2sd.
compute r$harm2i = (r$harm2 - ra2mean)/ra2sd.
compute r$peac2i = (r$peac2 - ra2mean)/ra2sd.
compute r$stil2i = (r$stil2 - ra2mean)/ra2sd.
compute r$ease2i = (r$ease2 - ra2mean)/ra2sd.
compute r$nerv2i = (r$nerv2 - ra2mean)/ra2sd.
compute r$rela2i = (r$rela2 - ra2mean)/ra2sd.
compute r$sadx2i = (r$sadx2 - ra2mean)/ra2sd.
compute r$happ2i = (r$happ2 - ra2mean)/ra2sd.
compute r$live2i = (r$live2 - ra2mean)/ra2sd.
compute r$host2i = (r$host2 - ra2mean)/ra2sd.
.
execute.
