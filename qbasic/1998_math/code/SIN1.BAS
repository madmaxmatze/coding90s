
CLS
SCREEN 12

COLOR 9: LOCATE 1, 1: PRINT "Sin"
COLOR 2: LOCATE 2, 1: PRINT "Cos"
COLOR 4: LOCATE 3, 1: PRINT "Tan"

DeltaX = 1
DeltaY = 100
XAchse = 240
Intervall = 1.8
Genauigkeit = .1

FOR x = 1 TO 360 * Intervall STEP Genauigkeit
    PSET (x \ DeltaX, XAchse - (SIN(x * .0174532) * DeltaY)), 9
    PSET (x \ DeltaX, XAchse - (COS(x * .0174532) * DeltaY)), 2
    PSET (x \ DeltaX, XAchse - (TAN(x * .0174532) * DeltaY)), 4
    PSET (x - DeltaX, XAchse), 15
NEXT x

FOR A = 1 TO 639 STEP 45 \ DeltaX
    LINE (A, XAchse - DeltaY \ 15)-(A, XAchse + DeltaY \ 15), 15
NEXT A


