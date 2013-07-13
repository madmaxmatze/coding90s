CLS
SCREEN 12
RANDOMIZE TIMER

LINE (100, 100)-(539, 379), 15, B
DO
  col = INT(RND * 3) + 7
  IF col = 9 THEN col = 15
  t1x = INT(RND * 438) + 101
  t1y = INT(RND * 278) + 101
  PSET (t1x, t1y), col

  FOR r = 1 TO 300
      t2x = INT(RND * 438) + 101
      t2y = INT(RND * 278) + 101
      PSET (t2x, t2y), 0
  NEXT r
   
a = 0
FOR y% = 101 TO 378
    FOR x% = 101 TO 538
        IF POINT(x%, y%) <> 0 THEN a = a + 1: LOCATE 1, 1: PRINT a
    NEXT x%
NEXT y%

LOOP UNTIL INKEY$ <> ""

