CLS
SCREEN 12
RANDOMIZE TIMER

scol = 9

LINE (40, 1)-(40, 480), scol, B
LINE (1, 16)-(40, 16), scol, B

DO
  I$ = INKEY$
  REM col = INT(RND * 3) + 7: IF col = 9 THEN col = 15        ' 3 Farben
  col = INT(RND * 15) + 1                                     ' 15 Farben
  t1x = INT(RND * 599) + 41
  t1y = INT(RND * 479) + 1
  IF POINT(t1x, t1y) <> 0 THEN a = a - 1
  PSET (t1x, t1y), col: a = a + 1
 
  FOR r = 1 TO 1000
      t2x = INT(RND * 599) + 41
      t2y = INT(RND * 479) + 1
      IF POINT(t2x, t2y) <> 0 THEN a = a - 1
      PSET (t2x, t2y), 0
  NEXT r
   
LINE (1, 17)-(39, 479 - a), 0, BF
 LINE (1, 480 - a)-(39, 480), 1, BF

COLOR scol: LOCATE 1, 1: PRINT a

IF I$ = CHR$(13) THEN
   B = 0
   FOR y = 1 TO 480
       FOR x = 41 TO 640
           IF POINT(x, y) > 0 THEN B = B + 1: LOCATE 1, 1: COLOR 8: PRINT B
       NEXT x
   NEXT y
   LOCATE 1, 1
   IF a = B THEN COLOR 15: PRINT B: SOUND 100, 1 ELSE COLOR 4: PRINT B: BEEP: BEEP: BEEP
END IF

LOOP UNTIL I$ = CHR$(27)
COLOR 7

