'*************************** Das Uhrendisplay ********************************

'*** Sub's und Variablen festlegen *******************************************
DECLARE SUB DoppelPunkte ()
DECLARE SUB ZeitLesen (z1, z2, z4, z5, z7, z8, f)
y = 135

'*** CodeZahlen **************************************************************
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

'*************************** Das Programm ************************************
CLS
SCREEN 12
LINE (202.5, 180)-STEP(10, 10), 12, BF                ' :::::::::::::::
LINE (202.5, 250)-STEP(10, 10), 12, BF                ' ::  Doppel-  ::
LINE (427.5, 180)-STEP(10, 10), 12, BF                ' ::  punkte   ::
LINE (427.5, 250)-STEP(10, 10), 12, BF                ' :::::::::::::::

DO
  LOCATE 1, 1: PRINT "Datum : "; DATE$
  ZeitLesen z1, z2, z4, z5, z7, z8, f
  IF f = 1 THEN farb$ = z$(z1): x = 0: GOSUB Displaygross
  farb$ = z$(z2): x = 100: GOSUB Displaygross
  farb$ = z$(z4): x = 225: GOSUB Displaygross
  farb$ = z$(z5): x = 325: GOSUB Displaygross
  farb$ = z$(z7): x = 460: GOSUB Displayklein
  farb$ = z$(z8): x = 550: GOSUB Displayklein
LOOP UNTIL INKEY$ <> ""
END

'****************************** Displaygroá **********************************
Displaygross:
           
FOR z = 1 TO 7
    disp(z) = VAL(MID$(farb$, z, 1))
NEXT z

IF disp(1) = 1 THEN fa = 12: LINE (x + 10, y)-STEP(70, 10), fa, BF
IF disp(1) = 0 THEN fa = 0: LINE (x + 10, y)-STEP(70, 10), fa, BF
IF disp(2) = 1 THEN fa = 12: LINE (x + 10, y + 80)-STEP(70, 10), fa, BF
IF disp(2) = 0 THEN fa = 0: LINE (x + 10, y + 80)-STEP(70, 10), fa, BF
IF disp(3) = 1 THEN fa = 12: LINE (x + 10, y + 160)-STEP(70, 10), fa, BF
IF disp(3) = 0 THEN fa = 0: LINE (x + 10, y + 160)-STEP(70, 10), fa, BF
IF disp(4) = 1 THEN fa = 12: LINE (x, y + 10)-STEP(10, 70), fa, BF
IF disp(4) = 0 THEN fa = 0: LINE (x, y + 10)-STEP(10, 70), fa, BF
IF disp(5) = 1 THEN fa = 12: LINE (x, y + 90)-STEP(10, 70), fa, BF
IF disp(5) = 0 THEN fa = 0: LINE (x, y + 90)-STEP(10, 70), fa, BF
IF disp(6) = 1 THEN fa = 12: LINE (x + 80, y + 10)-STEP(10, 70), fa, BF
IF disp(6) = 0 THEN fa = 0: LINE (x + 80, y + 10)-STEP(10, 70), fa, BF
IF disp(7) = 1 THEN fa = 12: LINE (x + 80, y + 90)-STEP(10, 70), fa, BF
IF disp(7) = 0 THEN fa = 0: LINE (x + 80, y + 90)-STEP(10, 70), fa, BF
RETURN

'****************************** Displayklein *********************************
Displayklein:
          
FOR z = 1 TO 7
    disp(z) = VAL(MID$(farb$, z, 1))
NEXT z

IF disp(1) = 1 THEN fa = 12: LINE (x + 10, y + 40)-STEP(50, 10), fa, BF
IF disp(1) = 0 THEN fa = 0: LINE (x + 10, y + 40)-STEP(50, 10), fa, BF
IF disp(2) = 1 THEN fa = 12: LINE (x + 10, y + 100)-STEP(50, 10), fa, BF
IF disp(2) = 0 THEN fa = 0: LINE (x + 10, y + 100)-STEP(50, 10), fa, BF
IF disp(3) = 1 THEN fa = 12: LINE (x + 10, y + 160)-STEP(50, 10), fa, BF
IF disp(3) = 0 THEN fa = 0: LINE (x + 10, y + 160)-STEP(50, 10), fa, BF
IF disp(4) = 1 THEN fa = 12: LINE (x, y + 50)-STEP(10, 50), fa, BF
IF disp(4) = 0 THEN fa = 0: LINE (x, y + 50)-STEP(10, 50), fa, BF
IF disp(5) = 1 THEN fa = 12: LINE (x, y + 110)-STEP(10, 50), fa, BF
IF disp(5) = 0 THEN fa = 0: LINE (x, y + 110)-STEP(10, 50), fa, BF
IF disp(6) = 1 THEN fa = 12: LINE (x + 60, y + 50)-STEP(10, 50), fa, BF
IF disp(6) = 0 THEN fa = 0: LINE (x + 60, y + 50)-STEP(10, 50), fa, BF
IF disp(7) = 1 THEN fa = 12: LINE (x + 60, y + 110)-STEP(10, 50), fa, BF
IF disp(7) = 0 THEN fa = 0: LINE (x + 60, y + 110)-STEP(10, 50), fa, BF
RETURN

SUB ZeitLesen (z1, z2, z4, z5, z7, z8, f)
z8 = VAL(MID$(TIME$, 8, 1))                        ' Sekunden - Zehnerstelle
IF z8 > 0 THEN f = 1
z7 = VAL(MID$(TIME$, 7, 1))                        ' Sekunden - Einerstelle
z5 = VAL(MID$(TIME$, 5, 1))                        ' Minuten  - Zehnerstelle
z4 = VAL(MID$(TIME$, 4, 1))                        ' Minuten  - Einerstelle
z2 = VAL(MID$(TIME$, 2, 1))                        ' Stunden  - Zehnerstelle
z1 = VAL(MID$(TIME$, 1, 1))                        ' Stunden  - Einerstelle
END SUB

