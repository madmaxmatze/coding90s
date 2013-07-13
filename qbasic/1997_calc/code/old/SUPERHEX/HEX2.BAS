z = 1
COLOR , 7: CLS

LOCATE 1, 1: COLOR 15, 13: PRINT SPACE$(25); "Super-Hex von Mathias Nitzsche"; SPACE$(25)
 
COLOR , 1: LOCATE 3, 22: PRINT " ษออออออออออออออออออออออออออออออออออป "
FOR r = 4 TO 8
    LOCATE r, 22: PRINT " บ"; SPACE$(34); "บ "
NEXT r
LOCATE 9, 22: PRINT " ศออออออออออออออออออออออออออออออออออผ "

COLOR 14: LOCATE 4, 27: PRINT "*** H a u p t - M e n  ***"

GOSUB d

DO
  T$ = INKEY$
  GOSUB d
  SELECT CASE T$
         CASE CHR$(0) + "H"
              IF z = 1 THEN z = 4
              z = z - 1
              GOSUB d
              SOUND 200, .5
         CASE CHR$(0) + "P"
              IF z = 3 THEN z = 0
              z = z + 1
              GOSUB d
              SOUND 200, .5
  END SELECT
LOOP UNTIL T$ = CHR$(13)

SOUND 200, .5

IF z = 1 THEN
   GOSUB F
   LOCATE 13, 10: INPUT "Geben sie die Dezimale ein: ", g: SOUND 200, .5
   a$ = HEX$(g)
   COLOR 14: LOCATE 14, 10: PRINT "Die Hexadezimale Zahl von"; g; "= "; a$;
   LOCATE 14, 60: PRINT "=> Esc drcken"
   DO: LOOP UNTIL INKEY$ = CHR$(27)
   RUN
END IF

IF z = 2 THEN
   GOSUB F
   COLOR 15
   LOCATE 13, 10: INPUT "Geben sie die Hexzahl ein: ", z$: SOUND 200, .5
   z$ = UCASE$(z$)
   LOCATE 13, 37: PRINT z$
   M = LEN(z$)
   FOR L = 1 TO M
       x = ASC(MID$(z$, L, 1))
       x = x - 48
       IF x > 9 THEN x = x - 7
       z = z + x * 16 ^ (M - L)
   NEXT
   e$ = STR$(z)
   COLOR 14, 1: LOCATE 14, 10: PRINT "Die Dezimale Zahl von "; z$; " ="; e$
   LOCATE 14, 60: PRINT "=> Esc drcken"
   DO: LOOP UNTIL INKEY$ = CHR$(27)
   RUN
END IF

COLOR 13, 0: CLS
LOCATE 22, 19: PRINT "ษออออออออออออออออออออออออออออออออออออออออป"
LOCATE 23, 19: PRINT "บ"; SPACE$(40); "บ"
LOCATE 24, 19: PRINT "ศออออออออออออออออออออออออออออออออออออออออผ"
COLOR 15, 0
LOCATE 22, 21: PRINT "Danke daแ sie Super-Hex benutzt haben."
SLEEP
CLS
END

d:

COLOR 15
IF NOT z = 1 THEN LOCATE 6, 25: PRINT "    Dezimal zu Hexerdezimal    "
IF NOT z = 2 THEN LOCATE 7, 25: PRINT "    Hexerdezimal zu Dezimal    "
IF NOT z = 3 THEN LOCATE 8, 34: PRINT "    Ende    "

COLOR 12
IF z = 1 THEN LOCATE 6, 25: PRINT "=>  Dezimal zu Hexerdezimal  <="
IF z = 2 THEN LOCATE 7, 25: PRINT "=>  Hexerdezimal zu Dezimal  <="
IF z = 3 THEN LOCATE 8, 34: PRINT "=>  Ende  <="
RETURN

F:
  COLOR 15: LOCATE 12, 5: PRINT " ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป "
  FOR x = 13 TO 14
      LOCATE x, 5: PRINT " บ"; SPACE$(68); "บ "
  NEXT
  LOCATE 15, 5: PRINT " ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ "
RETURN

