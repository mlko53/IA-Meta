*---------------------Harmony Control-------------------
.
compute hc$mean = mean (hc01, hc02, hc03, hc04, hc05, hc06, hc07, hc08, hc09, hc10, 
hc11, hc12, hc13, hc14, hc15, hc16, hc17, hc18, hc19, hc20, hc21).
compute hc$SD = SD (hc01, hc02, hc03, hc04, hc05, hc06, hc07, hc08, hc09, hc10, 
hc11, hc12, hc13, hc14, hc15, hc16, hc17, hc18, hc19, hc20, hc21).
execute
.
compute hc01i = (hc01 - hc$mean)/hc$SD.
compute hc02i = (hc02 - hc$mean)/hc$SD.
compute hc03i = (hc03 - hc$mean)/hc$SD.
compute hc04i = (hc04 - hc$mean)/hc$SD.
compute hc05i = (hc05 - hc$mean)/hc$SD.
compute hc06i = (hc06 - hc$mean)/hc$SD.
compute hc07i = (hc07 - hc$mean)/hc$SD.
compute hc08i = (hc08 - hc$mean)/hc$SD.
compute hc09i = (hc09 - hc$mean)/hc$SD.
compute hc10i = (hc10 - hc$mean)/hc$SD.
compute hc11i = (hc11 - hc$mean)/hc$SD.
compute hc12i = (hc12 - hc$mean)/hc$SD.
compute hc13i = (hc13 - hc$mean)/hc$SD.
compute hc14i = (hc14 - hc$mean)/hc$SD.
compute hc15i = (hc15 - hc$mean)/hc$SD.
compute hc16i = (hc16 - hc$mean)/hc$SD.
compute hc17i = (hc17 - hc$mean)/hc$SD.
compute hc18i = (hc18 - hc$mean)/hc$SD.
compute hc19i = (hc19 - hc$mean)/hc$SD.
compute hc20i = (hc20 - hc$mean)/hc$SD.
compute hc21i = (hc21 - hc$mean)/hc$SD.
execute.

compute othcare = mean (hc06, hc16i, hc19i).
compute hcself = mean (hc12i, hc08i, hc09i).
execute.

