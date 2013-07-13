CLS
RANDOMIZE TIMER

LOCATE 12, 12: PRINT "Geben sie die oktale (0 - 7.777.777) Zahl ein:"
LOCATE 13, 11: PRINT "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�"
LOCATE 14, 12: INPUT "", okt

DO
  S$ = ""
  FOR l = 10 TO 1 STEP -1
      IF okt - 10 ^ l >= 0 THEN FOR w = 1 TO l: S$ = S$ + "7": NEXT w: GOTO w
  NEXT l
w:
  T = VAL(S$)
  IF okt - (10 ^ l) >= 0 THEN okt = okt - 10 ^ l: dez = dez + 8 ^ l
  IF okt < 10 THEN dez = dez + okt: okt = 0
LOOP UNTIL okt = 0

LOCATE 17, 12: PRINT "Die deximale Zahl lautet:"
LOCATE 18, 11: PRINT "컴컴컴컴컴컴컴컴컴컴컴컴컴�"
LOCATE 19, 12: PRINT USING "###########"; dez

a$ = OCT$(dez)
LOCATE 19, 30: PRINT "(Computer: Dez"; dez; "= Okt "; a$; ")"

DO
  col = INT(RND * 15) + 1
  COLOR col: LOCATE 21, 12: PRINT "Bitte Taste dr갷ken"
  FOR a = 1 TO 10000: NEXT a
  I$ = INKEY$
LOOP UNTIL I$ <> ""
RUN

