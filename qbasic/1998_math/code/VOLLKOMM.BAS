CLS
zeile = 2
Zahl = 4
DO
Zahl = Zahl + 2
LOCATE 1, 1: PRINT Zahl
n = 1
FOR a = 2 TO Zahl / 2
    IF Zahl MOD a = 0 THEN n = n + a
NEXT a
IF n = Zahl THEN zeile = zeile + 1: LOCATE zeile, 1: PRINT Zahl
LOOP

