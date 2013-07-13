REM Mathias------------------------------------------------
REM Sprites------------------------------------------------
DIM SHARED sprites(1 TO 606, 1 TO 1) AS INTEGER
DEF SEG = VARSEG(sprites(1, 1))
BLOAD "KUGEL.SPR", VARPTR(sprites(1, 1))
SCREEN 7

LINE (21, 21)-(219, 179), 8, BF
LINE (9, 9)-(211, 171), 11, BF
LINE (11, 11)-(209, 169), 0, BF
x = 50: y = 50: dx = 1: dy = 1

REM Bewegung-----------------------------------------------
DO
  x = x + dx
  y = y + dy
  PUT (x, y), sprites(1, 1), PSET
  IF x < 12 OR x > 169 THEN dx = -dx
  IF y < 12 OR y > 129 THEN dy = -dy
LOOP UNTIL LEN(INKEY$)


