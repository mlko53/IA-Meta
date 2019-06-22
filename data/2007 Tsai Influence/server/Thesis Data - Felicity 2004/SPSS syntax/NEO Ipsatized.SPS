compute neo$mean = mean (neo01,neo02, neo03, neo04, neo05, neo06, neo07, neo08, neo09, neo10, neo11, neo12, neo13,
  neo14, neo15, neo16, neo17, neo18, neo19, neo20, neo21, neo22, neo23, neo24, neo25,
  neo26, neo27, neo28, neo29, neo30, neo31, neo32, neo33, neo34, neo35, neo36, neo37,
  neo38, neo39, neo40, neo41, neo42, neo43, neo44, neo45, neo46, neo47, neo48, neo49,
  neo50, neo51, neo52, neo53, neo54, neo55, neo56, neo57, neo58, neo59, neo60)
.
compute neo$sd = sd (neo01,neo02, neo03, neo04, neo05, neo06, neo07, neo08, neo09, neo10, neo11, neo12, neo13,
  neo14, neo15, neo16, neo17, neo18, neo19, neo20, neo21, neo22, neo23, neo24, neo25,
  neo26, neo27, neo28, neo29, neo30, neo31, neo32, neo33, neo34, neo35, neo36, neo37,
  neo38, neo39, neo40, neo41, neo42, neo43, neo44, neo45, neo46, neo47, neo48, neo49,
  neo50, neo51, neo52, neo53, neo54, neo55, neo56, neo57, neo58, neo59, neo60)
.
execute.

compute neo01i = (neo01 - neo$mean)/neo$sd.
compute neo02i = (neo02 - neo$mean)/neo$sd.
compute neo03i = (neo03 - neo$mean)/neo$sd.
compute neo04i = (neo04 - neo$mean)/neo$sd.
compute neo05i = (neo05 - neo$mean)/neo$sd.
compute neo06i = (neo06 - neo$mean)/neo$sd.
compute neo07i = (neo07 - neo$mean)/neo$sd.
compute neo08i = (neo08 - neo$mean)/neo$sd.
compute neo09i = (neo09 - neo$mean)/neo$sd
.
compute neo10i = (neo10 - neo$mean)/neo$sd.
compute neo11i = (neo11 - neo$mean)/neo$sd.
compute neo12i = (neo12 - neo$mean)/neo$sd.
compute neo13i = (neo13 - neo$mean)/neo$sd.
compute neo14i = (neo14 - neo$mean)/neo$sd.
compute neo15i = (neo15 - neo$mean)/neo$sd.
compute neo16i = (neo16 - neo$mean)/neo$sd.
compute neo17i = (neo17 - neo$mean)/neo$sd.
compute neo18i = (neo18 - neo$mean)/neo$sd.
compute neo19i = (neo19 - neo$mean)/neo$sd
.
compute neo20i = (neo20 - neo$mean)/neo$sd.
compute neo21i = (neo21 - neo$mean)/neo$sd.
compute neo22i = (neo22 - neo$mean)/neo$sd.
compute neo23i = (neo23 - neo$mean)/neo$sd.
compute neo24i = (neo24 - neo$mean)/neo$sd.
compute neo25i = (neo25 - neo$mean)/neo$sd.
compute neo26i = (neo26 - neo$mean)/neo$sd.
compute neo27i = (neo27 - neo$mean)/neo$sd.
compute neo28i = (neo28 - neo$mean)/neo$sd.
compute neo29i = (neo29 - neo$mean)/neo$sd
.
compute neo30i = (neo30 - neo$mean)/neo$sd.
compute neo31i = (neo31 - neo$mean)/neo$sd.
compute neo32i = (neo32 - neo$mean)/neo$sd.
compute neo33i = (neo33 - neo$mean)/neo$sd.
compute neo34i = (neo34 - neo$mean)/neo$sd.
compute neo35i = (neo35 - neo$mean)/neo$sd.
compute neo36i = (neo36 - neo$mean)/neo$sd.
compute neo37i = (neo37 - neo$mean)/neo$sd.
compute neo38i = (neo38 - neo$mean)/neo$sd.
compute neo39i = (neo39 - neo$mean)/neo$sd
.
compute neo40i = (neo40 - neo$mean)/neo$sd.
compute neo41i = (neo41 - neo$mean)/neo$sd.
compute neo42i = (neo42 - neo$mean)/neo$sd.
compute neo43i = (neo43 - neo$mean)/neo$sd.
compute neo44i = (neo44 - neo$mean)/neo$sd.
compute neo45i = (neo45 - neo$mean)/neo$sd.
compute neo46i = (neo46 - neo$mean)/neo$sd.
compute neo47i = (neo47 - neo$mean)/neo$sd.
compute neo48i = (neo48 - neo$mean)/neo$sd.
compute neo49i = (neo49 - neo$mean)/neo$sd
.
compute neo50i = (neo50 - neo$mean)/neo$sd.
compute neo51i = (neo51 - neo$mean)/neo$sd.
compute neo52i = (neo52 - neo$mean)/neo$sd.
compute neo53i = (neo53 - neo$mean)/neo$sd.
compute neo54i = (neo54 - neo$mean)/neo$sd.
compute neo55i = (neo55 - neo$mean)/neo$sd.
compute neo56i = (neo56 - neo$mean)/neo$sd.
compute neo57i = (neo57 - neo$mean)/neo$sd.
compute neo58i = (neo58 - neo$mean)/neo$sd.
compute neo59i = (neo59 - neo$mean)/neo$sd
.
compute neo60i = (neo60 - neo$mean)/neo$sd.
.
execute.

compute neu$i = mean (neo01i, neo06i, neo11i, neo16i, neo21i, neo26i, neo31i, neo36i, neo41i, neo46i, neo51i, neo56i).
compute ext$i = mean (neo02i, neo07i, neo12i, neo17i, neo22i, neo27i, neo32i, neo37i, neo42i, neo47i, neo52i, neo57i).
compute ope$i = mean (neo03i, neo08i, neo13i, neo18i, neo23i, neo28i, neo33i, neo38i, neo43i, neo48i, neo53i, neo58i).
compute agr$i = mean (neo04i, neo09i, neo14i, neo19i, neo24i, neo29i, neo34i, neo39i, neo44i, neo49i, neo54i, neo59i).
compute con$i = mean (neo05i, neo10i, neo15i, neo20i, neo25i, neo30i, neo35i, neo40i, neo45i, neo50i, neo55i, neo60i). 
execute.

