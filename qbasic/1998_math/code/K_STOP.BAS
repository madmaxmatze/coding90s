CLS
SCREEN 12

Radius = 100
MitX = 100
MitY = 100

starttime = TIMER
FOR A = 0 TO 360 STEP .5
    PSET (MitX + (COS(A * .0174532) * Radius), MitY - SIN(A * .0174532) * Radius), 9
NEXT A
stoptime = TIMER
LOCATE 1, 1: PRINT stoptime - starttime

starttime = TIMER
FOR A = 1 TO 200
CIRCLE (400, 200), 100, 9
NEXT A
stoptime = TIMER
LOCATE 1, 30: PRINT stoptime - starttime


