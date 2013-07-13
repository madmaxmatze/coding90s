SCREEN 13
DO
  col = col + 1
  v = INT(RND * 255)
  LINE (160 - col, 100)-(0, 0), col
  LINE (160, 100)-(col, 0), col
  LINE (160 + col * 19 / 20, 100 - col)-(255, 100 - col), col
  LINE (256, 100 - col)-(320, 100 - col), v
  LINE (159 - col * 2, 101)-(159, 101 + col * 2), col
  LINE (-351 + col * 2, 102)-(158, 611 - col * 2), col - 100
  LINE (col + 160, 100)-STEP(0, col), col
  LINE (160, col + 100)-STEP(col, 0), col
  FOR a = 1 TO 1000: NEXT a
  IF col = 256 THEN col = 0: CLS
LOOP UNTIL INKEY$ <> ""

