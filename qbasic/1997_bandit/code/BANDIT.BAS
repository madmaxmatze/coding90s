DECLARE SUB Hebel.gezogen ()
DECLARE SUB Hauptprogramm (SpielerGeld)
DECLARE SUB Spielfeld (SpielerGeld)

SpielerGeld = 100

CALL Spielfeld(SpielerGeld)

DO
  DO: LOOP UNTIL INKEY$ = CHR$(13)
  CALL Hebel.gezogen
  CALL Hauptprogramm(SpielerGeld)
LOOP UNTIL INKEY$ = CHR$(27)

END

SUB Hauptprogramm (SpielerGeld)

zeile = 11

CheckMoney = SpielerGeld

SpielerGeld = SpielerGeld - 5
COLOR 4: LOCATE zeile, 39: PRINT "1x drehen = -   5 $"

COLOR 15: LOCATE 26, 28: PRINT USING "Geld = #,###,### $"; SpielerGeld

s = 300
FOR z = 1 TO 15
    K1 = INT(RND * 5) + 1                        ' die Farben bestimmen
    K2 = INT(RND * 5) + 1
    K3 = INT(RND * 5) + 1
    K4 = INT(RND * 5) + 1
    K5 = INT(RND * 5) + 1

    'K1 = 1: K2 = 1: K3 = 1: K4 = 1: K5 = 1
   
    PAINT (90, 300), K1 * 3, 5
    PAINT (180, 300), K2 * 3, 5
    PAINT (270, 300), K3 * 3, 5
    PAINT (360, 300), K4 * 3, 5
    PAINT (450, 300), K5 * 3, 5
    s = s - 15
    IF z < 15 THEN SOUND s, 1 ELSE SOUND 60, 3
    B = B + 200: FOR a = 0 TO B: NEXT
NEXT z

FOR z = 1 TO 5
    IF POINT(z * 90, 300) = 3 THEN F1 = F1 + 1
    IF POINT(z * 90, 300) = 6 THEN F2 = F2 + 1
    IF POINT(z * 90, 300) = 9 THEN F3 = F3 + 1
    IF POINT(z * 90, 300) = 12 THEN F4 = F4 + 1
    IF POINT(z * 90, 300) = 15 THEN F5 = F5 + 1
NEXT z

FOR z = 3 TO 5
    IF F1 = z THEN GOSUB Gewinn
    IF F2 = z THEN GOSUB Gewinn
    IF F3 = z THEN GOSUB Gewinn
    IF F4 = z THEN GOSUB Gewinn
    IF F5 = z THEN GOSUB Gewinn
NEXT z

IF F1 = 1 AND F2 = 1 AND F3 = 1 AND F4 = 1 AND F5 = 1 THEN
   SpielerGeld = SpielerGeld + 10
   zeile = zeile + 1
   COLOR 10
   LOCATE zeile, 37
   PRINT "5 Ungleiche = +  10 $"
END IF

zeile = zeile + 2
COLOR 7: LOCATE zeile - 1, 41: PRINT "ÕÕÕÕÕÕÕÕÕÕÕÕÕÕ"
COLOR 10: IF CheckMoney < SpielerGeld THEN LOCATE zeile, 39: PRINT USING "Gewinn    =   ### $"; SpielerGeld - CheckMoney
COLOR 4: IF CheckMoney > SpielerGeld THEN LOCATE zeile, 39: PRINT USING "Verlust   =   ### $"; CheckMoney - SpielerGeld
COLOR 9: IF CheckMoney = SpielerGeld THEN LOCATE zeile, 38: PRINT "kein Verlust / Gewinn"

COLOR 15: LOCATE 26, 28: PRINT USING "Geld = #,###,### $"; SpielerGeld

IF SpielerGeld < 5 THEN
   COLOR 4: LOCATE 26, 28: PRINT "P L E I T E  ("; SpielerGeld; ")"
   DO
   PLAY "o2 CDGDBADEBDA"
   LOOP UNTIL INKEY$ <> INKEY$
   PLAY "o0 fe"
   END
END IF

GOTO w1

Gewinn:

COLOR 10

IF z = 2 THEN
   'SpielerGeld = SpielerGeld + 1
   'zeile = zeile + 1
   'LOCATE zeile, 39: PRINT "2 Gleiche = +   1 $"
END IF

IF z = 3 THEN
   SpielerGeld = SpielerGeld + 5
   zeile = zeile + 1
   LOCATE zeile, 39: PRINT "3 Gleiche = +   5 $"
END IF

IF z = 4 THEN
   SpielerGeld = SpielerGeld + 50
   zeile = zeile + 1
   LOCATE zeile, 39: PRINT "4 Gleiche = +  50 $"
END IF

IF z = 5 THEN
   SpielerGeld = SpielerGeld + 200
   zeile = zeile + 2
   LOCATE zeile, 39: PRINT "5 Gleiche = + 200 $"
   COLOR 14: LOCATE zeile - 1, 40: PRINT "  J A C K P O T   "
   FOR r = 1 TO 12
       SOUND r * 50, 1
       PAINT (480, 400), 7, 5
       PAINT (90, 400), 14, 5
       FOR e = 1 TO 1000: NEXT e
       SOUND r * 50, 1
       PAINT (90, 400), 7, 5
       PAINT (480, 400), 14, 5
       FOR e = 1 TO 1000: NEXT
   NEXT r
   SOUND 500, 1
   PAINT (90, 400), 14, 5
   FOR e = 1 TO 2000: NEXT e
   SOUND 650, 1
   PAINT (480, 400), 14, 5
   FOR e = 1 TO 1000: NEXT e
   PAINT (90, 400), 7, 5
   PAINT (480, 400), 7, 5
END IF

RETURN

w1:

END SUB

SUB Hebel.gezogen
  
FOR z = 12 TO 15
    LOCATE z, 37: PRINT SPACE$(22)
NEXT z

FOR z = 60 TO 220
    FOR dummy = 1 TO 5: NEXT dummy
    LINE (541, z)-(560, z), 8, BF
NEXT z

FOR z = 230 TO 400
    FOR dummy = 1 TO 5: NEXT dummy
    LINE (541, z)-(560, z), 3, BF
NEXT z

FOR z = 400 TO 230 STEP -1
    FOR dummy = 1 TO 5: NEXT dummy
    LINE (541, z)-(560, z), 8, BF
NEXT z

FOR z = 220 TO 60 STEP -1
    FOR dummy = 1 TO 5: NEXT dummy
    LINE (541, z)-(560, z), 3, BF
NEXT z

END SUB

SUB Spielfeld (SpielerGeld)

CLS
SCREEN 12
RANDOMIZE TIMER

LINE (50, 50)-(520, 430), 5, B              ' Spielfeld

LOCATE 6, 17: PRINT "D E R   E I N A R M I G E   B A N D I T"
LINE (100, 70)-(470, 103), 5, B             ' öberschriftskasten
                                          
LINE (137, 144)-(238, 144), 15, B           ' GewinnKasten-öberschriftsunterstreien
LINE (337, 144)-(415, 144), 15, B           ' PunkteKasten-öberschriftsunterstreien

LOCATE 9, 19: PRINT "Die Gewinne              Das Geld"
                                       
COLOR 7
LOCATE 11, 14: PRINT "2 Gleiche   =   0 $"   ' Schrift im GewinnKasten
LOCATE 12, 14: PRINT "3 Gleiche   =   5 $"
LOCATE 13, 14: PRINT "4 Gleiche   =  50 $"
LOCATE 14, 14: PRINT "5 Gleiche   = 200 $"
LOCATE 15, 14: PRINT "5 Ungleiche =  10 $"

LINE (90, 120)-(480, 250), 5, B             ' Gewinn-Kasten
LINE (280, 120)-(280, 250), 5, B            ' Gewinn-Kasten-Mittelstrich

LINE (200, 392)-(370, 422), 5, B            ' GeldKasten

PAINT (51, 51), 7, 5                        ' die Leisten und KÑsten ausmalen

CIRCLE (90, 400), 20, 5                     ' Die beiden Kreise in den Ecken
CIRCLE (480, 400), 20, 5

FOR z = 1 TO 5                              ' Malen der KÑsten
    LINE (z * 90 - 20, 270)-(z * 90 + 50, 370), 5, B
NEXT z

PAINT (51, 51), "a1", 5                     ' Einarmigen B. ausmalen
PAINT (0, 0), 8, 5                          ' Hintergrund ausmalen

LINE (521, 200)-(540, 250), 5, BF           ' Maschiene-Hebel-VerbindungsstÅck
LINE (541, 60)-(560, 235), 3, BF            ' der Hebel

COLOR 15: LOCATE 26, 28: PRINT USING "Geld = #,###,### $"; SpielerGeld

END SUB

