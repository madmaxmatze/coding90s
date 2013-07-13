CLS
SCREEN 12
a = 14: B = 130: d = 40
LOCATE 1, 3: PRINT "Was ist an dem Viereck anders?"
LOCATE 1, 44: PRINT "Welcher Strich ist l„nger?"
LOCATE 14, 7: PRINT "Kreis oder nicht Kreis,"
LOCATE 15, 7: PRINT "das ist hier die Frage!"

LINE (310, 0)-STEP(0, 480), 8, B
LINE (0, 190)-STEP(620, 0), 8, B
'------------------------------- Tauschung 1 -----------------------------------
DO
CIRCLE (150, 100), a, 15
a = a + 7
LOOP UNTIL a = 70
LINE (180, 130)-(120, 70), 14, B
'------------------------------- Tauschung 2 -----------------------------------
LINE (400, 50)-(400, 130), 9
LINE (500, 50)-(500, 130), 9
DO
  LINE (400, B)-(410, B + 10), 9
  LINE (400, B)-(390, B + 10), 9
  LINE (400, d + 10)-(390, d), 9
  LINE (400, d + 10)-(410, d), 9
  LINE (500, B - 60)-(510, B - 50), 9
  LINE (510, B - 10)-(500, B), 9
  LINE (500, B)-(490, B - 10), 9
  LINE (500, d + 10)-(490, d + 20), 9
  d = d + 10: B = B - 10
LOOP UNTIL B = 100
'------------------------------- Tauschung 3 -----------------------------------
FOR x = 30 TO 280 STEP 15
    LINE (150, 250)-(x, 350), 12
    LINE (150, 450)-(x, 350), 12
NEXT x
CIRCLE (150, 350), 100, 15
SLEEP

