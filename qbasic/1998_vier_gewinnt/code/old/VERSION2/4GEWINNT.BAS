CLS
RANDOMIZE TIMER

COLOR 11
LOCATE 11, 28: PRINT "Willkommen bei 4 Gewinnt"
LOCATE 12, 28: PRINT "ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ"

DO: LOOP UNTIL INKEY$ <> ""

SHELL "c:\qbasic\vier\version2\flyplay.exe c:\qbasic\vier\version2\brett3.fli"

SCREEN 12

DO
x = 60
z = 0
s = 0

LINE (20, 80)-(460, 460), 15, B
LINE (21, 81)-(459, 459), 0, BF

FOR z = 120 TO 420 STEP 60
    FOR s = 60 TO 420 STEP 60
        CIRCLE (s, z), 20, 15
    NEXT s
NEXT z

PAINT (21, 81), 1, 15

LOCATE 11, 63
PRINT "             "
LOCATE 23, 63
PRINT "             "

IF Sp1Win + Sp2Win > 0 THEN GOSUB Runde2weiter

LOCATE 2, 33
PRINT "4  G E W I N N T"
LINE (245, 11)-(395, 34), 15, B

LINE (480, 80)-(620, 255), 15, B

COLOR 4
LOCATE 7, 65
PRINT "Spieler 1"
LINE (508, 112)-(586, 112), 4

LOCATE 13, 63
PRINT " Win  ∫ Lose"
LOCATE 14, 63
PRINT "ÕÕÕÕÕÕŒÕÕÕÕÕÕ "
LOCATE 15, 63
PRINT "      ∫"

LINE (480, 270)-(620, 445), 15, B

COLOR 2
LOCATE 19, 65
PRINT "Spieler 2"
LINE (508, 306)-(586, 306), 2

LOCATE 25, 63
PRINT " Win  ∫ Lose"
LOCATE 26, 63
PRINT "ÕÕÕÕÕÕŒÕÕÕÕÕÕ "
LOCATE 27, 63
PRINT "      ∫"

PAINT (0, 0), 6, 15
Runde2weiter:
GOSUB SpielerWinLose
IF Sp1Win + Sp2Win = 0 THEN
   COLOR 4
   LOCATE 9, 63: LINE INPUT sp1na$
   sp1na$ = UCASE$(sp1na$)
   LOCATE 9, 63
   PRINT sp1na$
   COLOR 2
   LOCATE 21, 63
   LINE INPUT sp2na$
   sp2na$ = UCASE$(sp2na$)
   LOCATE 21, 63
   PRINT sp2na$
END IF
Farbe = INT(RND * 2) + 1
Farbe = Farbe + Farbe
GOSUB Kreismalen

DO
  kbd$ = INKEY$
  SELECT CASE kbd$
       
         CASE CHR$(0) + "K"
              SOUND 100, 1
              IF x > 60 THEN x = x - 60: GOSUB Kreismalen
         CASE CHR$(0) + "M"
              SOUND 100, 1
              IF x < 420 THEN x = x + 60: GOSUB Kreismalen
       
         CASE CHR$(13)
              IF POINT(x, 120) = 0 THEN
                 LINE (21, 37)-(460, 79), 6, BF
                 FOR y = 120 TO 420 STEP 60
                     IF POINT(x, y) = 0 THEN
                        PAINT (x, y), Farbe, 15
                        SOUND 40, .1
                        FOR a = 1 TO 1400
                        NEXT
                        IF POINT(x, y + 60) = 0 THEN PAINT (x, y), 0, 15 ELSE GOTO Pruefen
                     END IF
                 NEXT y

Pruefen:
w = 0
wr = 0
wl = 0
s = 0
d1 = 0
d1o = 0
d1u = 0
d2 = 0
d2o = 0
d2u = 0
u = 0

FOR z = 1 TO 3
    IF POINT(x + z * 60, y) = Farbe THEN
       IF wr = 0 THEN w = w + 1
    ELSE wr = 1
    END IF
  
    IF POINT(x - z * 60, y) = Farbe THEN
       IF wl = 0 THEN w = w + 1
    ELSE wl = 1
    END IF
  
    IF POINT(x, y + z * 60) = Farbe THEN s = s + 1
  
    IF POINT(x - z * 60, y - z * 60) = Farbe THEN
       IF d1o = 0 THEN d1 = d1 + 1
    ELSE
       d1o = 1
    END IF

    IF POINT(x + z * 60, y + z * 60) = Farbe THEN
       IF d1u = 0 THEN d1 = d1 + 1
    ELSE
       d1u = 1
    END IF

    IF POINT(x + z * 60, y - z * 60) = Farbe THEN
       IF d2o = 0 THEN d2 = d2 + 1
    ELSE
       d2o = 1
    END IF

    IF POINT(x - z * 60, y + z * 60) = Farbe THEN
       IF d2u = 0 THEN d2 = d2 + 1
    ELSE
       d2u = 1
    END IF
NEXT z
                                          
FOR z = 1 TO 7
    IF POINT(z * 60, 120) = 0 THEN u = u + 1
NEXT z

IF u > 0 THEN u = 2 ELSE u = 3
IF w > 2 THEN GOSUB Gewonnen
IF s > 2 THEN GOSUB Gewonnen
IF d1 > 2 THEN GOSUB Gewonnen
IF d2 > 2 THEN GOSUB Gewonnen
               
                 IF w > 2 OR s > 2 OR d1 > 2 OR d2 > 2 OR u > 2 THEN kbd$ = CHR$(27)
               
                 IF Farbe = 4 THEN Farbe = 2 ELSE Farbe = 4
                 x = 60
                 GOSUB Kreismalen
              ELSE
                 SOUND 50, 1
              END IF
         CASE ELSE
  END SELECT
LOOP UNTIL kbd$ = CHR$(27)

  LINE (30, 135)-(450, 165), 15, B
  LINE (31, 136)-(449, 164), 0, BF
  LOCATE 10, 6
  PRINT "Wollen Sie noch einmal spielen ? (DrÅcke J oder N)"
DO
  antw$ = INKEY$
  antw$ = UCASE$(antw$)
LOOP UNTIL antw$ = "J" OR antw$ = "N"
IF antw$ = "N" THEN END ELSE

LOOP

SpielerWinLose:
COLOR 4
LOCATE 15, 64
PRINT Sp1Win
LOCATE 15, 72
PRINT Sp2Win

COLOR 2
LOCATE 27, 64
PRINT Sp2Win
LOCATE 27, 72
PRINT Sp1Win
RETURN

Kreismalen:
LINE (21, 37)-(460, 79), 6, BF
CIRCLE (x, 57), 20, 15
PAINT (x, 57), Farbe, 15
RETURN

Gewonnen:
COLOR 15
IF u = 0 THEN
   LOCATE 11, 63
   PRINT "UNENTSCHIEDEN"
   LOCATE 23, 63
   PRINT "UNENTSCHIEDEN"
   GOSUB SpielerWinLose
END IF

IF Farbe = 4 THEN
   Sp1Win = Sp1Win + 1
   REM SHELL "flyplay.exe Gewonnen.fli"
   LOCATE 11, 65
   PRINT "GEWONNEN"
   GOSUB SpielerWinLose
END IF

IF Farbe = 2 THEN
   Sp2Win = Sp2Win + 1
   LOCATE 23, 65
   PRINT "GEWONNEN"
   GOSUB SpielerWinLose
END IF
RETURN

