recode geqam05
        (1=5) (2=4) (3=3) (4=2) (5=1).
execute.

compute geqam1 = mean (geqam01, geqam02, geqam03, geqam04, geqam05, geqam06, geqam07, geqam08, geqam09, geqam10, geqam11,
  geqam12, geqam13, geqam14, geqam15, geqam16, geqam17, geqam18, geqam19, geqam20, geqam21, geqam22,
  geqam23, geqam24, geqam25, geqam26, geqam27, geqam28, geqam29, geqam30, geqam31, geqam32, geqam33, geqam34, geqam35, geqam36,
  geqam37, geqam38).
execute.

compute ethn geqam = mean (geqam01, geqam02, geqam03, geqam04, geqam05, geqam06, geqam07, geqam08, geqam09, geqam10, geqam11,
  geqam12, geqam13, geqam14, geqam15, geqam16, geqam17, geqam18, geqam19, geqam20, geqam21, geqam22,
  geqam23, geqam24).


compute ELANGFM = mean(geqam35, geqam38, geqam36, geqam37, geqam27,
                     geqam30, geqam34, geqam02, geqam26, geqam28, geqam11,
                     geqam01).
compute ESOCFFFM = mean(geqam24, geqam22, geqam14, geqam21, geqam12, geqam10).
compute EACTFM = mean(geqam16, geqam17, geqam15, geqam18).
compute EATTITFM = mean(geqam06, geqam07, geqam05, geqam04, geqam13).
compute EMEDIAFM = mean(geqam32, geqam33, geqam31).
compute EFOODFM = mean(geqam19, geqam20).
var label
ELANGFM 'English Language'
ESOCFFFM 'EAmerican Social Affiliation'
EMEDIAFM 'EAmerican Media'
EATTITFM 'EAmerican Cultural Pride'
EACTFM 'EAmerican Activities'
EFOODFM 'EAmerican Food'

execute.

compute geqam = mean(elangfm,esocfffm,eactfm,eattitfm,emediafm,efoodfm).
execute.