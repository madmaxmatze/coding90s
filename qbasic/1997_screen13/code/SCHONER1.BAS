SCREEN 13
PAINT (1, 1), 1
DO
  FOR col = 0 TO 200
      LINE (160 - col / 2, 100 - col / 2)-STEP(col, col), col, B
      SOUND 100 + col * 3, .1
  NEXT col
  FOR col = 200 TO 0 STEP -1
      LINE (160 - col / 2, 100 - col / 2)-STEP(col, col), 200 - col, B
      SOUND 100 + col * 3, .1
  NEXT col
LOOP

