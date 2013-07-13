COLOR , 1: CLS

x1 = 17: y1 = 13: x2 = 62: Y2 = 8
GOSUB F

A$ = "TASTATUR-SCHREIB-TEST"
B$ = "Copyright 1998, by MatzeMan"

COLOR 1
LOCATE 9, 29: PRINT A$
LOCATE 10, 26: PRINT B$
LOCATE 12, 19: PRINT "Drcke bitte ENTER wenn du bereit bist !!!"
COLOR 4: LOCATE 12, 32: PRINT "ENTER"

DO: LOOP UNTIL INKEY$ = CHR$(13)

COLOR 14, 1: CLS

PRINT A$; " ©,¸,TM"; SPACE$(25); B$

x1 = 36: y1 = 5: x2 = 43: Y2 = 2
GOSUB F
LOCATE 3, 38: PRINT "Zeit"

x1 = 3: y1 = 18: x2 = 78: Y2 = 7
GOSUB F

st = TIMER: S = 4: z = 8
 
DO
  I$ = INKEY$
 
  LOCATE 4, 39: PRINT USING "##"; st - TIMER + 60
 
  FOR A = 4.97 TO .8 STEP -1
      IF st - TIMER + 60 > A AND st - TIMER + 60 < A + .06 THEN SOUND 1100 - A * 100, .1
  NEXT

  IF I$ = CHR$(8) THEN
     IF S = 4 AND z = 8 THEN GOTO w
     IF S = 4 AND z > 7 THEN S = 76: z = z - 1: LOCATE z + 1, 5: PRINT " "
     S = S - 1: T = T - 1
     LOCATE z, S + 1: PRINT " "
  END IF
w:
 
  IF I$ = CHR$(32) OR I$ = CHR$(33) OR I$ = CHR$(44) OR I$ = CHR$(46) OR I$ > CHR$(47) AND I$ < CHR$(60) OR I$ = CHR$(63) OR I$ > CHR$(64) AND I$ < CHR$(91) OR I$ > CHR$(96) AND I$ < CHR$(123) OR I$ = CHR$(129) OR I$ = CHR$(132) OR I$ = CHR$(148) OR I$ = CHR$(142) OR I$ > CHR$(152) AND I$ < CHR$(155) THEN
     IF S = 76 THEN S = 4: z = z + 1
     IF S = 75 AND z = 17 THEN GOTO e
     S = S + 1: T = T + 1
     LOCATE z, S: PRINT I$
  END IF
 
  IF S < 76 THEN LOCATE z, S + 1: PRINT "_ " ELSE LOCATE z + 1, 5: PRINT "_"
 
LOOP UNTIL I$ = CHR$(27) OR TIMER - st - 60 >= 0
                                                   
e:
FOR A = 500 TO 100 STEP -100: SOUND A, 2: NEXT

x1 = 13: y1 = 22: x2 = 67: Y2 = 20
GOSUB F
LOCATE 21, 15: PRINT USING "Du hast > ### < Anschl„g(e) in ## Sekunden geschaft"; T; TIMER - st

x1 = 19: x2 = 60: y1 = 16: Y2 = 14
GOSUB F
LOCATE 15, 21: PRINT "ESC - beenden       ENTER - neustarten"

DO
  I$ = INKEY$
  IF I$ = CHR$(13) THEN RUN
LOOP UNTIL I$ = CHR$(27)

COLOR 7, 0: CLS : END

F:
q = q + .11
c$ = ""
COLOR 0, 1 + q
FOR A = x1 + 1 TO x2 + 1
    LOCATE y1 + 1, A: PRINT "ß"
NEXT
FOR A = Y2 + 1 TO y1
    LOCATE A, x2 + 1: PRINT "Û"
NEXT
LOCATE Y2, x2 + 1: PRINT "Ü"
COLOR 15, 2 - q
FOR A = x1 + 1 TO x2 - 1: c$ = c$ + "Í": NEXT
FOR A = Y2 + 1 TO y1 - 1
LOCATE Y2, x1: PRINT "É"; c$; "»"
LOCATE A, x1:  PRINT "º"; SPACE$(x2 - x1 - 1); "º"
LOCATE y1, x1: PRINT "È"; c$; "¼"
NEXT
RETURN

