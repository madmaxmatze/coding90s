CLS
SCREEN 12

radius = 240
MitX = 320
MitY = 240

FOR A = 0 TO 90000 STEP .1
    col = col + 1
    IF col = 16 THEN col = 1
    radius = radius - .002
    LINE (MitX, MitY)-(MitX + (COS(A * .0174532) * radius), MitY - (SIN(A * .0174532) * radius)), col
    LINE (MitX, MitY)-(MitX + (COS(A * .0174532) * radius), MitY - (SIN(A * .0174532) * radius)), 0
    PSET (MitX + (COS(A * .0174532) * radius), MitY - (SIN(A * .0174532) * radius)), col
NEXT A



