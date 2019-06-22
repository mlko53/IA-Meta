Experimental Manipulation Interpersonal Values

COMPUTE haghc = Mean (ipv2, ipv10, ipv18, ipv26) .
VARIABLE LABELS haghc 'High Agency High Communion' .
EXECUTE .

COMPUTE laghc = Mean (ipv4, ipv12, ipv20, ipv28) .
VARIABLE LABELS laghc 'Low Agency High Communion' .
EXECUTE .



Global Interpersonal Values

COMPUTE g$haghc = Mean (g$ipv2, g$ipv10, g$ipv18, g$ipv26) .
VARIABLE LABELS g$haghc 'Global High Agency High Communion' .
EXECUTE .

COMPUTE g$laghc = Mean (g$ipv4, g$ipv12, g$ipv20, g$ipv28) .
VARIABLE LABELS g$laghc 'Global Low Agency High Communion' .
EXECUTE .

