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
  a = a + 1

  FOR r = 1 TO 400
      t2x = INT(RND * 438) + 101
      t2y = INT(RND * 278) + 101
      IF POINT(t2x, t2y) <> 0 THEN a = a - 1
      PSET (t2x, t2y), 0
  NEXT r
   
LOCATE 1, 1: PRINT a

LOOP UNTIL INKEY$ <> ""

