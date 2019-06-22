GEQ Am Ipsatized

compute gasmean =  mean (geqas01, geqas02, geqas03, geqas04, geqas05, geqas06, 
geqas07, geqas08, geqas09, geqas10, geqas11, geqas12, 
geqas13, geqas14, geqas15, geqas16, geqas17, geqas18, 
geqas19, geqas20, geqas21, geqas22, geqas23, geqas24, 
geqas25, geqas26, geqas27, geqas28, geqas29, geqas30, 
geqas31, geqas32, geqas33, geqas34, geqas35, geqas36,
geqas37, geqas38).
.
compute gassd = sd (geqas01, geqas02, geqas03, geqas04, geqas05, geqas06, 
geqas07, geqas08, geqas09, geqas10, geqas11, geqas12, 
geqas13, geqas14, geqas15, geqas16, geqas17, geqas18, 
geqas19, geqas20, geqas21, geqas22, geqas23, geqas24, 
geqas25, geqas26, geqas27, geqas28, geqas29, geqas30, 
geqas31, geqas32, geqas33, geqas34, geqas35, geqas36,
geqas37, geqas38).
.
execute.

compute geqas01i = (geqas01 - gasmean)/gassd.
compute geqas02i = (geqas02 - gasmean)/gassd.
compute geqas03i = (geqas03 - gasmean)/gassd.
compute geqas04i = (geqas04 - gasmean)/gassd.
compute geqas05i = (geqas05 - gasmean)/gassd.
compute geqas06i = (geqas06 - gasmean)/gassd.
compute geqas07i = (geqas07 - gasmean)/gassd.
compute geqas08i = (geqas08 - gasmean)/gassd.
compute geqas09i = (geqas09 - gasmean)/gassd.
compute geqas10i = (geqas10 - gasmean)/gassd.
compute geqas11i = (geqas11 - gasmean)/gassd.
compute geqas12i = (geqas12 - gasmean)/gassd.
compute geqas13i = (geqas13 - gasmean)/gassd.
compute geqas14i = (geqas14 - gasmean)/gassd.
compute geqas15i = (geqas15 - gasmean)/gassd.
compute geqas16i = (geqas16 - gasmean)/gassd.
compute geqas17i = (geqas17 - gasmean)/gassd.
compute geqas18i = (geqas18 - gasmean)/gassd.
compute geqas19i = (geqas19 - gasmean)/gassd.
compute geqas20i = (geqas20 - gasmean)/gassd.
compute geqas21i = (geqas21 - gasmean)/gassd.
compute geqas22i = (geqas22 - gasmean)/gassd.
compute geqas23i = (geqas23 - gasmean)/gassd.
compute geqas24i = (geqas24 - gasmean)/gassd.
compute geqas25i = (geqas25 - gasmean)/gassd.
compute geqas26i = (geqas26 - gasmean)/gassd.
compute geqas27i = (geqas27 - gasmean)/gassd.
compute geqas28i = (geqas28 - gasmean)/gassd.
compute geqas29i = (geqas29 - gasmean)/gassd.
compute geqas30i = (geqas30 - gasmean)/gassd.
compute geqas31i = (geqas31 - gasmean)/gassd.
compute geqas32i = (geqas32 - gasmean)/gassd.
compute geqas33i = (geqas33 - gasmean)/gassd.
compute geqas34i = (geqas34 - gasmean)/gassd.
compute geqas35i = (geqas35 - gasmean)/gassd.
compute geqas36i = (geqas36 - gasmean)/gassd.
compute geqas37i = (geqas37 - gasmean)/gassd.
compute geqas38i = (geqas38 - gasmean)/gassd.
.
execute.



compute geqas1$i = mean (geqas01i, geqas02i, geqas03i, geqas04i, geqas05i, geqas06i, geqas07i, geqas08i, geqas09i, geqas10i, geqas11i,
  geqas12i, geqas13i, geqas14i, geqas15i, geqas16i, geqas17i, geqas18i, geqas19i, geqas20i, geqas21i, geqas22i,
  geqas23i, geqas24i, geqas25i, geqas26i, geqas27i, geqas28i, geqas29i, geqas30i, geqas31i, geqas32i, geqas33i, geqas34i, geqas35i, geqas36i,
  geqas37i, geqas38i).
execute.

compute CLANGFM = mean(geqas36i, geqas37i, geqas30i, geqas35i, geqas38i, geqas26i,
                     geqas34i, geqas27i, geqas31i, geqas32i, geqas29i, geqas15i,
                     geqas21i, geqas08i, geqas28i).
compute CSOCFFFM = mean(geqas23i, geqas22i, geqas14i, geqas13i, geqas24i, geqas10i, geqas12i).
compute CACTFM= mean(geqas33i, geqas17i, geqas16i).
compute CATTITFM = mean(geqas06i, geqas07i, geqas05i, geqas04i).
compute CEXPOFM = mean(geqas02i, geqas01i, geqas03i, geqas11i).
compute CFOODFM = mean(geqas20i, geqas19i, geqas18i).
var label
CLANGFM 'Chinese Language'
CSOCFFFM 'Chinese Social Affiliation'
CACTFM 'Chinese Activities'
CATTITFM 'Chinese Attitudes'
CEXPOFM 'Chinese Exposure'
CFOODFM ' Chinese Food and Holidays'
.
execute.

compute geqas$i = mean(clangfm,csocfffm,cactfm,cattitfm,cexpofm,cfoodfm). 
execute.




