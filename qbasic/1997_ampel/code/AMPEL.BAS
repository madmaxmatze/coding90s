REM Mathias------------------------------------------------
SCREEN 12
CLS

LINE (0, 0)-(600, 320), 14, B
LINE (100, 30)-(200, 290), 14, B
LOCATE 4, 40
PRINT "A M P E L - S T E U E R U N G "

REM AMPEL--------------------------------------------------
DO
  FOR a = 1 TO 4
      LINE (102, 32)-(198, 288), 8, BF
      CIRCLE (150, 80), 30, 15
      IF a = 3 OR a = 4 THEN PAINT (150, 80), 4, 15
      CIRCLE (150, 160), 30, 15
      IF a = 2 OR a = 4 THEN PAINT (150, 160), 14, 15
      CIRCLE (150, 240), 30, 15
      IF a = 1 THEN PAINT (150, 240), 2, 15
      SLEEP 1
  NEXT
LOOP UNTIL LEN(INKEY$)

 







