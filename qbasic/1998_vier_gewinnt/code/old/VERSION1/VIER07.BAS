DEFINT A-Z
DECLARE SUB spielfeld ()
DECLARE SUB Spieler1 (farb, fall, sp1na$, sp2na$)
DECLARE SUB Spieler2 (farb, fall, sp1na$, sp2na$)
DECLARE SUB eingabe (sp1na$, sp2na$)

CLS
SCREEN 12
RANDOMIZE TIMER

begi = INT(RND * 2 + 1)
CALL spielfeld
CALL eingabe(sp1na$, sp2na$)
CALL spielfeld
IF begi = 2 THEN GOTO b2
DO
CALL Spieler1(farb, fall, sp1na$, sp2na$)
b2:
CALL Spieler2(farb, fall, sp1na$, sp2na$)
LOOP

SUB eingabe (sp1na$, sp2na$)
LINE (150, 100)-STEP(320, 40), 15, B
LINE (151, 101)-STEP(318, 38), 0, BF
LOCATE 8, 22: INPUT "Wie heiát Spieler 1"; sp1na$
LOCATE 3, 10: PRINT "Spieler 1 = "; sp1na$
LOCATE 8, 42: PRINT "                 "
LOCATE 8, 22: INPUT "Wie heiát Spieler 2"; sp2na$
LOCATE 3, 41: PRINT "Spieler 2 = "; sp2na$
LINE (150, 100)-STEP(320, 40), 0, BF
END SUB

SUB Spieler1 (farb, fall, sp1na$, sp2na$)
SCREEN 12
COLOR 15
x = 100: Y = 100: farb = 1
fall = 1
PAINT (x + 30, Y - 10), farb, 15
LINE (x, Y - 40)-STEP(60, 60), farb, B
COLOR 15: LOCATE 3, 10: PRINT "Spieler 1 = "; sp1na$
COLOR 8: LOCATE 3, 41: PRINT "Spieler 2 = "; sp2na$
LINE (x - 40, Y - 75)-STEP(250, 28), 15, B
LINE (x + 211, Y - 75)-STEP(249, 28), 8, B

DO
  kbd$ = INKEY$
  SELECT CASE kbd$
         CASE CHR$(0) + "K"
              LINE (x, Y - 40)-STEP(60, 60), 2, B
              PAINT (x + 30, Y - 10), 0, 15
              IF NOT POINT(x - 30, Y - 10) = 0 THEN x = x - 60: IF x < 150 THEN IF NOT POINT(490, Y - 10) = 0 THEN x = 460 ELSE x = 520
              x = x - 60
              IF x < 95 THEN x = 460
              PAINT (x + 30, Y - 10), farb, 15
              LINE (x, Y - 40)-STEP(60, 60), farb, B
                   fall = fall - 1
                   IF fall = 8 THEN fall = 1
                   IF fall = 0 THEN fall = 7
       
         CASE CHR$(0) + "M"
              LINE (x, Y - 40)-STEP(60, 60), 2, B
              PAINT (x + 30, Y - 10), 0, 15
              IF NOT POINT(x + 80, Y - 10) = 0 THEN x = x + 60: IF x > 390 THEN IF NOT POINT(130, Y - 10) = 0 THEN x = 100 ELSE x = 40
              IF x > 450 THEN x = 40
              x = x + 60
              LINE (x, Y - 40)-STEP(60, 60), farb, B
              PAINT (x + 30, Y - 10), farb, 15
                   fall = fall + 1
                   IF fall = 8 THEN fall = 1
                   IF fall = 0 THEN fall = 7
       
         CASE CHR$(13)
              Y = 100
              IF fall = 1 THEN x = 130
              IF fall = 2 THEN x = 190
              IF fall = 3 THEN x = 250
              IF fall = 4 THEN x = 310
              IF fall = 5 THEN x = 370
              IF fall = 6 THEN x = 430
              IF fall = 7 THEN x = 490

IF POINT(x, Y + 60) = 0 THEN GOTO weiter1
GOTO ende
weiter1:
              PAINT (x, Y - 10), 0, 15
              PAINT (x, Y + 60), farb, 15
              FOR a = 1 TO 20000: NEXT
IF POINT(x, Y + 120) = 0 THEN GOTO weiter2
GOTO ende
weiter2:
              PAINT (x, Y + 60), 0, 15
              PAINT (x, Y + 120), farb, 15
              FOR a = 1 TO 20000: NEXT
IF POINT(x, Y + 180) = 0 THEN GOTO weiter3
GOTO ende
weiter3:
              PAINT (x, Y + 120), 0, 15
              PAINT (x, Y + 170), farb, 15
              FOR a = 1 TO 20000: NEXT
IF POINT(x, Y + 240) = 0 THEN GOTO weiter4
GOTO ende
weiter4:
              PAINT (x, Y + 170), 0, 15
              PAINT (x, Y + 230), farb, 15
              FOR a = 1 TO 20000: NEXT
IF POINT(x, Y + 300) = 0 THEN GOTO weiter5
GOTO ende
weiter5:
              PAINT (x, Y + 230), 0, 15
              PAINT (x, Y + 290), farb, 15
ende:      
              LINE (x - 30, Y - 40)-STEP(60, 60), 2, B
              x = 100: LINE (x - 40, Y - 75)-STEP(250, 28), 8, B
         CASE ELSE
END SELECT
LOOP UNTIL kbd$ = CHR$(13)

END SUB

SUB Spieler2 (farb, fall, sp1na$, sp2na$)
SCREEN 12
COLOR 15
x = 100: Y = 100: farb = 4
fall = 1
PAINT (x + 30, Y - 10), farb, 15
LINE (x, Y - 40)-STEP(60, 60), farb, B
COLOR 8: LOCATE 3, 10: PRINT "Spieler 1 = "; sp1na$
COLOR 15: LOCATE 3, 41: PRINT "Spieler 2 = "; sp2na$
LINE (x - 40, Y - 75)-STEP(250, 28), 8, B
LINE (x + 211, Y - 75)-STEP(249, 28), 15, B

DO
  kbd$ = INKEY$
  SELECT CASE kbd$
         CASE CHR$(0) + "K"
              LINE (x, Y - 40)-STEP(60, 60), 2, B
              PAINT (x + 30, Y - 10), 0, 15
              IF NOT POINT(x - 30, Y - 10) = 0 THEN x = x - 60
              x = x - 60
              IF x < 95 THEN x = 460
              PAINT (x + 30, Y - 10), farb, 15
              LINE (x, Y - 40)-STEP(60, 60), farb, B
                   fall = fall - 1
                   IF fall = 8 THEN fall = 1
                   IF fall = 0 THEN fall = 7
        
         CASE CHR$(0) + "M"
              LINE (x, Y - 40)-STEP(60, 60), 2, B
              PAINT (x + 30, Y - 10), 0, 15
              IF x > 450 THEN x = 40
              x = x + 60
              LINE (x, Y - 40)-STEP(60, 60), farb, B
              PAINT (x + 30, Y - 10), farb, 15
                   fall = fall + 1
                   IF fall = 8 THEN fall = 1
                   IF fall = 0 THEN fall = 7
        
         CASE CHR$(13)
              Y = 100
              IF fall = 1 THEN x = 130
              IF fall = 2 THEN x = 190
              IF fall = 3 THEN x = 250
              IF fall = 4 THEN x = 310
              IF fall = 5 THEN x = 370
              IF fall = 6 THEN x = 430
              IF fall = 7 THEN x = 490
IF POINT(x, Y + 60) = 0 THEN GOTO weiter7
GOTO ende1
weiter7:
              PAINT (x, Y - 10), 0, 15
              PAINT (x, Y + 60), farb, 15
              FOR a = 1 TO 20000: NEXT
IF POINT(x, Y + 120) = 0 THEN GOTO weiter8
GOTO ende1
weiter8:
              PAINT (x, Y + 60), 0, 15
              PAINT (x, Y + 120), farb, 15
              FOR a = 1 TO 20000: NEXT
IF POINT(x, Y + 180) = 0 THEN GOTO weiter9
GOTO ende1
weiter9:
              PAINT (x, Y + 120), 0, 15
              PAINT (x, Y + 170), farb, 15
              FOR a = 1 TO 20000: NEXT
IF POINT(x, Y + 240) = 0 THEN GOTO weiter10
GOTO ende1
weiter10:
              PAINT (x, Y + 170), 0, 15
              PAINT (x, Y + 230), farb, 15
              FOR a = 1 TO 20000: NEXT
IF POINT(x, Y + 300) = 0 THEN GOTO weiter11
GOTO ende1
weiter11:
              PAINT (x, Y + 230), 0, 15
              PAINT (x, Y + 290), farb, 15
ende1:      
              LINE (x - 30, Y - 40)-STEP(60, 60), 2, B
              x = 100: LINE (x + 211, Y - 75)-STEP(249, 28), 8, B
         CASE ELSE
END SELECT
LOOP UNTIL kbd$ = CHR$(13)

END SUB

DEFSNG A-Z
SUB spielfeld
LINE (60, 25)-STEP(500, 28), 15, B     'Spieleerleiste
LINE (311, 25)-STEP(0, 28), 15         'Mittelstrich in Spielerleiste
LINE (99, 59)-STEP(423, 362), 15, B    'der Spielfeldumriá

FOR x = 130 TO 490 STEP 60
CIRCLE (x, 90), 20
CIRCLE (x, 150), 20
CIRCLE (x, 210), 20
CIRCLE (x, 270), 20
CIRCLE (x, 330), 20
CIRCLE (x, 390), 20
NEXT x

PAINT (180, 120), 2, 15
PAINT (1, 1), 8, 15
END SUB

