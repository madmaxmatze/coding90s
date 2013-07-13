DECLARE SUB Displaygross (x!, y!, Fa!, Farb$, z!)
DECLARE SUB Displayklein (x!, y!, Fa!, Farb$, z!)
DECLARE SUB Digital ()
DECLARE SUB Analog ()

SCREEN 12

DO
Analog
Digital
LOOP

SUB Analog

CLS

Mitx = 320: Mity = 240

CIRCLE (Mitx, Mity), 190, 14

FOR A = 0 TO 360 STEP 6
    LINE (Mitx - COS(A * .0174532) * 183, Mity - SIN(A * .0174532) * 183)-(Mitx - COS(A * .0174532) * 190, Mity - SIN(A * .0174532) * 190), 14
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

END SUB

SUB Digital
DIM z(0 TO 9)  AS STRING

CLS

y = 135

z$(0) = "1011111"
z$(1) = "0000011"
z$(2) = "1110110"
z$(3) = "1110011"
z$(4) = "0101011"
z$(5) = "1111001"
z$(6) = "1111101"
z$(7) = "1000011"
z$(8) = "1111111"
z$(9) = "1111011"

CLS
SCREEN 12
LINE (202.5, 180)-STEP(10, 10), 12, BF                ' :::::::::::::::
LINE (202.5, 250)-STEP(10, 10), 12, BF                ' ::  Doppel-  ::
LINE (427.5, 180)-STEP(10, 10), 12, BF                ' ::  punkte   ::
LINE (427.5, 250)-STEP(10, 10), 12, BF                ' :::::::::::::::

DO
  I$ = INKEY$
  z8 = VAL(MID$(TIME$, 8, 1))                        ' Sekunden - Zehnerstelle
  IF z8 > 0 THEN f = 1
  z7 = VAL(MID$(TIME$, 7, 1))                        ' Sekunden - Einerstelle
  z5 = VAL(MID$(TIME$, 5, 1))                        ' Minuten  - Zehnerstelle
  z4 = VAL(MID$(TIME$, 4, 1))                        ' Minuten  - Einerstelle
  z2 = VAL(MID$(TIME$, 2, 1))                        ' Stunden  - Zehnerstelle
  z1 = VAL(MID$(TIME$, 1, 1))                        ' Stunden  - Einerstelle
  IF f = 1 THEN Farb$ = z$(z1): x = 0: Displaygross x, y, Fa, Farb$, z
  Farb$ = z$(z2): x = 100: Displaygross x, y, Fa, Farb$, z
  Farb$ = z$(z4): x = 225: Displaygross x, y, Fa, Farb$, z
  Farb$ = z$(z5): x = 325: Displaygross x, y, Fa, Farb$, z
  Farb$ = z$(z7): x = 460: Displayklein x, y, Fa, Farb$, z
  Farb$ = z$(z8): x = 550: Displayklein x, y, Fa, Farb$, z
LOOP UNTIL I$ = CHR$(13) OR I$ = CHR$(27)

IF I$ = CHR$(13) THEN GOTO ende ELSE END

ende:

END SUB

SUB Displaygross (x, y, Fa, Farb$, z)
DIM disp(1 TO 7)  AS INTEGER

FOR z = 1 TO 7
    disp(z) = VAL(MID$(Farb$, z, 1))
NEXT z

IF disp(1) = 1 THEN Fa = 12: LINE (x + 10, y)-STEP(70, 10), Fa, BF
IF disp(1) = 0 THEN Fa = 0: LINE (x + 10, y)-STEP(70, 10), Fa, BF
IF disp(2) = 1 THEN Fa = 12: LINE (x + 10, y + 80)-STEP(70, 10), Fa, BF
IF disp(2) = 0 THEN Fa = 0: LINE (x + 10, y + 80)-STEP(70, 10), Fa, BF
IF disp(3) = 1 THEN Fa = 12: LINE (x + 10, y + 160)-STEP(70, 10), Fa, BF
IF disp(3) = 0 THEN Fa = 0: LINE (x + 10, y + 160)-STEP(70, 10), Fa, BF
IF disp(4) = 1 THEN Fa = 12: LINE (x, y + 10)-STEP(10, 70), Fa, BF
IF disp(4) = 0 THEN Fa = 0: LINE (x, y + 10)-STEP(10, 70), Fa, BF
IF disp(5) = 1 THEN Fa = 12: LINE (x, y + 90)-STEP(10, 70), Fa, BF
IF disp(5) = 0 THEN Fa = 0: LINE (x, y + 90)-STEP(10, 70), Fa, BF
IF disp(6) = 1 THEN Fa = 12: LINE (x + 80, y + 10)-STEP(10, 70), Fa, BF
IF disp(6) = 0 THEN Fa = 0: LINE (x + 80, y + 10)-STEP(10, 70), Fa, BF
IF disp(7) = 1 THEN Fa = 12: LINE (x + 80, y + 90)-STEP(10, 70), Fa, BF
IF disp(7) = 0 THEN Fa = 0: LINE (x + 80, y + 90)-STEP(10, 70), Fa, BF

END SUB

SUB Displayklein (x, y, Fa, Farb$, z)
DIM disp(1 TO 7)  AS INTEGER

FOR z = 1 TO 7
    disp(z) = VAL(MID$(Farb$, z, 1))
NEXT z

IF disp(1) = 1 THEN Fa = 12: LINE (x + 10, y + 40)-STEP(50, 10), Fa, BF
IF disp(1) = 0 THEN Fa = 0: LINE (x + 10, y + 40)-STEP(50, 10), Fa, BF
IF disp(2) = 1 THEN Fa = 12: LINE (x + 10, y + 100)-STEP(50, 10), Fa, BF
IF disp(2) = 0 THEN Fa = 0: LINE (x + 10, y + 100)-STEP(50, 10), Fa, BF
IF disp(3) = 1 THEN Fa = 12: LINE (x + 10, y + 160)-STEP(50, 10), Fa, BF
IF disp(3) = 0 THEN Fa = 0: LINE (x + 10, y + 160)-STEP(50, 10), Fa, BF
IF disp(4) = 1 THEN Fa = 12: LINE (x, y + 50)-STEP(10, 50), Fa, BF
IF disp(4) = 0 THEN Fa = 0: LINE (x, y + 50)-STEP(10, 50), Fa, BF
IF disp(5) = 1 THEN Fa = 12: LINE (x, y + 110)-STEP(10, 50), Fa, BF
IF disp(5) = 0 THEN Fa = 0: LINE (x, y + 110)-STEP(10, 50), Fa, BF
IF disp(6) = 1 THEN Fa = 12: LINE (x + 60, y + 50)-STEP(10, 50), Fa, BF
IF disp(6) = 0 THEN Fa = 0: LINE (x + 60, y + 50)-STEP(10, 50), Fa, BF
IF disp(7) = 1 THEN Fa = 12: LINE (x + 60, y + 110)-STEP(10, 50), Fa, BF
IF disp(7) = 0 THEN Fa = 0: LINE (x + 60, y + 110)-STEP(10, 50), Fa, BF

END SUB

