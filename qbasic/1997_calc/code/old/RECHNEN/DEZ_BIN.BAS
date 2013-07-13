CLS

PRINT "1234567890"
INPUT "", dez

dez1 = dez

DO
  rest = dez MOD 2
  IF rest = 0 THEN dez = dez / 2: A$ = "0" + A$ ELSE dez = dez / 2 - .5: A$ = "1" + A$
LOOP UNTIL dez = 0

LOCATE 5, 1: PRINT "Rechnung 1 = "; A$

LOCATE 6, 1: PRINT "Rechnung 2 ="
dez = dez1

X = 13
Y = 6

FOR A = 90 TO 0 STEP -1
    test = dez - (2 ^ A)
    IF test < 0 AND p = 1 THEN : X = X + 1: LOCATE Y, X: PRINT "0"
    IF test >= 0 THEN : r = r + 1: X = X + 1: p = 1: LOCATE Y, X: PRINT "1": LOCATE r, 60: ge = ge + dez - test: PRINT dez - test: test = dez - test: dez = dez - test
NEXT A
IF X = 11 THEN LOCATE 19, 12: PRINT "0"

LOCATE r + 1, 60: PRINT "--------------------"
g$ = STR$(ge)
LOCATE r + 2, 60: PRINT g$

DO
LOOP UNTIL INKEY$ <> ""
RUN

