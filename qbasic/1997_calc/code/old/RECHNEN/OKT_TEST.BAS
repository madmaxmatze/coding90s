CLS
LOCATE 1, 1: PRINT "Teste Richtigkeit - Bitte Warten...                             Esc zum Beenden"
DO
  dez = 0
  e = e + 1: A$ = OCT$(e): okt = VAL(A$)
  DO
    S$ = ""
    FOR L = 10 TO 1 STEP -1
        IF okt - 10 ^ L >= 0 THEN FOR w = 1 TO L: S$ = S$ + "7": NEXT w: GOTO w
    NEXT L
w:
    t = VAL(S$)
    IF okt - (10 ^ L) >= 0 THEN okt = okt - 10 ^ L: dez = dez + 8 ^ L
    IF okt < 10 THEN dez = dez + okt: okt = 0
  LOOP UNTIL okt = 0
IF INKEY$ = CHR$(13) THEN LOCATE 2, 1: PRINT dez
LOOP UNTIL e <> dez OR INKEY$ = CHR$(27)
PRINT "Dezimal ="; dez

