CLS
radius = 100
MitX = 160
MitY = 100

FOR A = 0 TO 90000 STEP 1
    col = col + 1
    IF col = 16 THEN col = 1
    radius = radius - 0
   
    SCREEN 7, , 1, 0
   
    LINE (MitX, MitY)-(MitX + (COS(A * .0174532) * radius), MitY - (SIN(A * .0174532) * radius)), col
   
    PCOPY 1, 0
   
    LINE (MitX, MitY)-(MitX + (COS(A * .0174532) * radius), MitY - (SIN(A * .0174532) * radius)), 0
   
    SCREEN 7, , 0, 0
    
    PSET (MitX + (COS(A * .0174532) * radius), MitY - (SIN(A * .0174532) * radius)), col

NEXT A

