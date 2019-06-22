GEQ Am Ipsatized

compute gammean =  mean (geqam01, geqam02, geqam03, geqam04, geqam05, geqam06, 
geqam07, geqam08, geqam09, geqam10, geqam11, geqam12, 
geqam13, geqam14, geqam15, geqam16, geqam17, geqam18, 
geqam19, geqam20, geqam21, geqam22, geqam23, geqam24, 
geqam25, geqam26, geqam27, geqam28, geqam29, geqam30, 
geqam31, geqam32, geqam33, geqam34, geqam35, geqam36,
geqam37, geqam38).
.
compute gamsd = sd (geqam01, geqam02, geqam03, geqam04, geqam05, geqam06, 
geqam07, geqam08, geqam09, geqam10, geqam11, geqam12, 
geqam13, geqam14, geqam15, geqam16, geqam17, geqam18, 
geqam19, geqam20, geqam21, geqam22, geqam23, geqam24, 
geqam25, geqam26, geqam27, geqam28, geqam29, geqam30, 
geqam31, geqam32, geqam33, geqam34, geqam35, geqam36,
geqam37, geqam38).
.
execute.

compute geqam01i = (geqam01 - gammean)/gamsd.
compute geqam02i = (geqam02 - gammean)/gamsd.
compute geqam03i = (geqam03 - gammean)/gamsd.
compute geqam04i = (geqam04 - gammean)/gamsd.
compute geqam05i = (geqam05 - gammean)/gamsd.
compute geqam06i = (geqam06 - gammean)/gamsd.
compute geqam07i = (geqam07 - gammean)/gamsd.
compute geqam08i = (geqam08 - gammean)/gamsd.
compute geqam09i = (geqam09 - gammean)/gamsd.
compute geqam10i = (geqam10 - gammean)/gamsd.
compute geqam11i = (geqam11 - gammean)/gamsd.
compute geqam12i = (geqam12 - gammean)/gamsd.
compute geqam13i = (geqam13 - gammean)/gamsd.
compute geqam14i = (geqam14 - gammean)/gamsd.
compute geqam15i = (geqam15 - gammean)/gamsd.
compute geqam16i = (geqam16 - gammean)/gamsd.
compute geqam17i = (geqam17 - gammean)/gamsd.
compute geqam18i = (geqam18 - gammean)/gamsd.
compute geqam19i = (geqam19 - gammean)/gamsd.
compute geqam20i = (geqam20 - gammean)/gamsd.
compute geqam21i = (geqam21 - gammean)/gamsd.
compute geqam22i = (geqam22 - gammean)/gamsd.
compute geqam23i = (geqam23 - gammean)/gamsd.
compute geqam24i = (geqam24 - gammean)/gamsd.
compute geqam25i = (geqam25 - gammean)/gamsd.
compute geqam26i = (geqam26 - gammean)/gamsd.
compute geqam27i = (geqam27 - gammean)/gamsd.
compute geqam28i = (geqam28 - gammean)/gamsd.
compute geqam29i = (geqam29 - gammean)/gamsd.
compute geqam30i = (geqam30 - gammean)/gamsd.
compute geqam31i = (geqam31 - gammean)/gamsd.
compute geqam32i = (geqam32 - gammean)/gamsd.
compute geqam33i = (geqam33 - gammean)/gamsd.
compute geqam34i = (geqam34 - gammean)/gamsd.
compute geqam35i = (geqam35 - gammean)/gamsd.
compute geqam36i = (geqam36 - gammean)/gamsd.
compute geqam37i = (geqam37 - gammean)/gamsd.
compute geqam38i = (geqam38 - gammean)/gamsd.
.
execute.



compute geqam1$i = mean (geqam01i, geqam02i, geqam03i, geqam04i, geqam05i, geqam06i, geqam07i, geqam08i, geqam09i, geqam10i, geqam11i,
  geqam12i, geqam13i, geqam14i, geqam15i, geqam16i, geqam17i, geqam18i, geqam19i, geqam20i, geqam21i, geqam22i,
  geqam23i, geqam24i, geqam25i, geqam26i, geqam27i, geqam28i, geqam29i, geqam30i, geqam31i, geqam32i, geqam33i, geqam34i, geqam35i, geqam36i,
  geqam37i, geqam38i).
execute.

compute ELANGFM = mean(geqam35i, geqam38i, geqam36i, geqam37i, geqam27i,
                     geqam30i, geqam34i, geqam02i, geqam26i, geqam28i, geqam11i,
                     geqam01i).
compute ESOCFFFM = mean(geqam24i, geqam22i, geqam14i, geqam21i, geqam12i, geqam10i).
compute EACTFM = mean(geqam16i, geqam17i, geqam15i, geqam18i).
compute EATTITFM = mean(geqam06i, geqam07i, geqam05i, geqam04i, geqam13i).
compute EMEDIAFM = mean(geqam32i, geqam33i, geqam31i).
compute EFOODFM = mean(geqam19i, geqam20i).
var label
ELANGFM 'English Language'
ESOCFFFM 'EAmerican Social Affiliation'
EMEDIAFM 'EAmerican Media'
EATTITFM 'EAmerican Cultural Pride'
EACTFM 'EAmerican Activities'
EFOODFM 'EAmerican Food'

execute.

compute geqam$i= mean(elangfm,esocfffm,eactfm,eattitfm,emediafm,efoodfm).
execute.



