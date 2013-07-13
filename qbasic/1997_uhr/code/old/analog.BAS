SCREEN 12
CLS

Mitx = 320: Mity = 240

CIRCLE (Mitx, Mity), 190, 14

FOR A = 0 TO 360 STEP 6
    LINE (Mitx - COS(A * .0174532) * 180, Mity - SIN(A * .0174532) * 180)-(Mitx - COS(A * .0174532) * 190, Mity - SIN(A * .0174532) * 190), 14
NEXT A

FOR A = 0 TO 360 STEP 30
    LINE (Mitx - COS(A * .0174532) * 175, Mity - SIN(A * .0174532) * 175)-(Mitx - COS(A * .0174532) * 190, Mity - SIN(A * .0174532) * 190), 14
NEXT A

COLOR 14

LOCATE 4, 53: PRINT "1"
LOCATE 9, 62: PRINT "2"
LOCATE 15, 66: PRINT "3"
LOCATE 22, 63: PRINT "4"
LOCATE 27, 53: PRINT "5"
LOCATE 28, 41: PRINT "6"
LOCATE 27, 28: PRINT "7"
LOCATE 22, 19: PRINT "8"
LOCATE 15, 15: PRINT "9"
LOCATE 9, 18: PRINT "10"
LOCATE 4, 28: PRINT "11"
LOCATE 3, 40: PRINT "12"

DO

I$ = INKEY$

H = VAL(MID$(TIME$, 1, 2))
m = VAL(MID$(TIME$, 4, 2))
S = VAL(MID$(TIME$, 7, 2))

IF S <> SaveS THEN
   LINE (Mitx, Mity)-(Mitx - COS((SaveS * 6 + 90) * .0174532) * 170, Mity - (SIN((SaveS * 6 + 90) * .0174532) * 170)), 0
   LINE (Mitx, Mity)-(Mitx - COS(((SaveH * 30 + 90) + (SaveM * .5)) * .0174532) * 150, Mity - (SIN(((SaveH * 30 + 90) + (SaveM * .5)) * .0174532) * 150)), 0

   LINE (Mitx, Mity)-(Mitx - COS((SaveM * 6 + 90) * .0174532) * 170, Mity - (SIN((SaveM * 6 + 90) * .0174532) * 170)), 0
   LINE (Mitx, Mity)-(Mitx - COS((m * 6 + 90) * .0174532) * 170, Mity - (SIN((m * 6 + 90) * .0174532) * 170)), 10
   SaveM = m

   LINE (Mitx, Mity)-(Mitx - COS((S * 6 + 90) * .0174532) * 170, Mity - (SIN((S * 6 + 90) * .0174532) * 170)), 12
   SaveS = S

   LINE (Mitx, Mity)-(Mitx - COS(((H * 30 + 90) + (m * .5)) * .0174532) * 150, Mity - (SIN(((H * 30 + 90) + (m * .5)) * .0174532) * 150)), 9
   SaveH = H
END IF

LOOP UNTIL I$ = CHR$(27) OR I$ = CHR$(13)

IF I$ = CHR$(27) THEN END ELSE GOTO Ende1

Ende1:

