recode geqas05
        (1=5) (2=4) (3=3) (4=2) (5=1).
execute.

compute CLANGFM = mean(geqas36, geqas37, geqas30, geqas35, geqas38, geqas26,
                     geqas34, geqas27, geqas31, geqas32, geqas29, geqas15,
                     geqas21, geqas08, geqas28).
compute CSOCFFFM = mean(geqas23, geqas22, geqas14, geqas13, geqas24, geqas10, geqas12).
compute CACTFM= mean(geqas33, geqas17, geqas16).
compute CATTITFM = mean(geqas06, geqas07, geqas05, geqas04).
compute CEXPOFM = mean(geqas02, geqas01, geqas03, geqas11).
compute CFOODFM = mean(geqas20, geqas19, geqas18).
var label
CLANGFM 'Chinese Language'
CSOCFFFM 'Chinese Social Affiliation'
CACTFM 'Chinese Activities'
CATTITFM 'Chinese Attitudes'
CEXPOFM 'Chinese Exposure'
CFOODFM ' Chinese Food and Holidays'
.
execute.

*Create overall score.
compute geqas1 = mean (geqas01,geqas02, geqas03, geqas04, geqas05, geqas06, geqas07, geqas08, geqas09, geqas10, geqas11,
  geqas12, geqas13, geqas14, geqas15, geqas16, geqas17, geqas18, geqas19, geqas20, geqas21, geqas22,
  geqas23, geqas24, geqas25, geqas26, geqas27, geqas28, geqas29, geqas30, geqas31, geqas32, geqas33,
  geqas34, geqas35, geqas36, geqas37, geqas38).
execute.

compute geqas = mean(clangfm,csocfffm,cactfm,cattitfm,cexpofm,cfoodfm). 
execute.

