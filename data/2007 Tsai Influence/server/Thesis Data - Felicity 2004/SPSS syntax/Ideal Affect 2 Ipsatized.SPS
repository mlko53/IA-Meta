title 'Ideal Affect Time 2 Ipsatized'.

compute ia2mean = mean (i$enth2, i$exci2, i$ener2, i$live2, i$moti2, i$eage2, i$happ2, i$cont2, 
i$calm2, i$rela2, i$comp2, i$peac2, i$ease2, i$harm2, i$quie2, i$stil2, 
i$dull2, i$slug2, i$slee2, i$sadx2, i$fear2, i$host2, i$nerv2, i$arou2)
.
compute ia2sd = sd (i$enth2, i$exci2, i$ener2, i$live2, i$moti2, i$eage2, i$happ2, i$cont2, 
i$calm2, i$rela2, i$comp2, i$peac2, i$ease2, i$harm2, i$quie2, i$stil2, 
i$dull2, i$slug2, i$slee2, i$sadx2, i$fear2, i$host2, i$nerv2, i$arou2)
.
execute.

compute i$enth2i = (i$enth2 - ia2mean)/ia2sd.
compute i$dull2i = (i$dull2 - ia2mean)/ia2sd.
compute i$exci2i = (i$exci2 - ia2mean)/ia2sd.
compute i$slee2i = (i$slee2 - ia2mean)/ia2sd.
compute i$comp2i = (i$comp2 - ia2mean)/ia2sd.
compute i$arou2i = (i$arou2 - ia2mean)/ia2sd.
compute i$ener2i = (i$ener2 - ia2mean)/ia2sd.
compute i$slug2i = (i$slug2 - ia2mean)/ia2sd.
compute i$moti2i = (i$moti2 - ia2mean)/ia2sd.
compute i$quie2i = (i$quie2 - ia2mean)/ia2sd.
compute i$cont2i = (i$cont2 - ia2mean)/ia2sd.
compute i$eage2i = (i$eage2 - ia2mean)/ia2sd.
compute i$fear2i = (i$fear2 - ia2mean)/ia2sd.
compute i$calm2i = (i$calm2 - ia2mean)/ia2sd.
compute i$harm2i = (i$harm2 - ia2mean)/ia2sd.
compute i$peac2i = (i$peac2 - ia2mean)/ia2sd.
compute i$stil2i = (i$stil2 - ia2mean)/ia2sd.
compute i$ease2i = (i$ease2 - ia2mean)/ia2sd.
compute i$nerv2i = (i$nerv2 - ia2mean)/ia2sd.
compute i$rela2i = (i$rela2 - ia2mean)/ia2sd.
compute i$sadx2i = (i$sadx2 - ia2mean)/ia2sd.
compute i$happ2i = (i$happ2 - ia2mean)/ia2sd.
compute i$live2i = (i$live2 - ia2mean)/ia2sd.
compute i$host2i = (i$host2 - ia2mean)/ia2sd.
.
execute.


