'------------------kodierte Zahlen-------------------------------------------
Z$(0) = "1011111"
Z$(1) = "0000011"
Z$(2) = "1110110"
Z$(3) = "1110011"
Z$(4) = "0101011"
Z$(5) = "1111001"
Z$(6) = "1111101"
Z$(7) = "1000011"
Z$(8) = "1111111"
Z$(9) = "1111011"

anf:
SCREEN 12
CLS

LOCATE 2, 5: INPUT "Geben Sie bitte eine Zahl von 0 bis 9 ein: ", g
farb$ = Z$(g)

'---------------------------- Display -------------------------------------------
FOR Z = 1 TO 7
    Disp(Z) = VAL(MID$(farb$, Z, 1))
NEXT Z

IF Disp(1) THEN fa = 12: LINE (210, 100)-STEP(100, 10), fa, BF                     '1
IF Disp(2) THEN fa = 12: LINE (210, 200)-STEP(100, 10), fa, BF                     '2
IF Disp(3) THEN fa = 12: LINE (210, 300)-STEP(100, 10), fa, BF                     '3
IF Disp(4) THEN fa = 12: LINE (200, 112)-STEP(10, 86), fa, BF                      '4
IF Disp(5) THEN fa = 12: LINE (200, 212)-STEP(10, 86), fa, BF                      '5
IF Disp(6) THEN fa = 12: LINE (310, 112)-STEP(10, 86), fa, BF                      '6
IF Disp(7) THEN fa = 12: LINE (310, 212)-STEP(10, 86), fa, BF                      '7

LOCATE 28, 60: PRINT "Taste DrÅcken"
SLEEP
GOSUB anf


