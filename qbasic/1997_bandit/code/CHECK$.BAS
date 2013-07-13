DECLARE SUB Hauptprogramm (SpielerGeld, Gleiche2, Gleiche3, Gleiche4, Gleiche5, Ungleiche)
DECLARE SUB Spielfeld ()

CALL Spielfeld

'laden
OPEN "c:\qbasic\bandit\save.dat" FOR INPUT AS #1
'INPUT #1, SpAn
'INPUT #1, GeVer
'INPUT #1, lose
'INPUT #1, win
'INPUT #1, GewinnGeld
'INPUT #1, DurchVer
'INPUT #1, high
'INPUT #1, low
'INPUT #1, Gleiche2
'INPUT #1, Gleiche3
'INPUT #1, Gleiche4
'INPUT #1, Gleiche5
'INPUT #1, Ungleiche
'INPUT #1, SpielerGeld
'INPUT #1, Ver
CLOSE #1

IF low = 0 THEN low = 10000

COLOR 15: LOCATE 20, 27: PRINT USING "##,###  บ  ##,###  บ  ##,###  บ  ##,###  บ  ##,###"; Gleiche2; Gleiche3; Gleiche4; Gleiche5; Ungleiche
LOCATE 13, 52: PRINT USING "##,### "; high
LOCATE 14, 52: PRINT USING "##,###"; low
LOCATE 7, 52: PRINT USING "##,###"; SpAn
LOCATE 12, 52: PRINT USING "##,###"; DurchVer

DO
  CheckMoney = SpielerGeld
  CALL Hauptprogramm(SpielerGeld, Gleiche2, Gleiche3, Gleiche4, Gleiche5, Ungleiche)
  Ver = Ver + 1: LOCATE 4, 35: PRINT USING "#,###"; Ver
  GeVer = GeVer + 1
  LOCATE 9, 52: PRINT USING "##,###"; GeVer
 
  IF SpielerGeld < CheckMoney THEN
     lose = lose + 1
     LOCATE 10, 52: PRINT USING "##,###"; lose: LOCATE 10, 70: PRINT USING "###,###"; lose * 5
  ELSE
     win = win + 1: GewinnGeld = GewinnGeld + (SpielerGeld - CheckMoney)
     LOCATE 11, 52: PRINT USING "##,###"; win: LOCATE 11, 70: PRINT USING "###,###"; GewinnGeld
  END IF
 
  IF SpielerGeld < 5 THEN
     COLOR 15: LOCATE 20, 27: PRINT USING "##,###  บ  ##,###  บ  ##,###  บ  ##,###  บ  ##,###"; Gleiche2; Gleiche3; Gleiche4; Gleiche5; Ungleiche
     IF Ver > high THEN high = Ver: LOCATE 13, 52: PRINT USING "##,### "; high
     IF Ver < low THEN low = Ver: LOCATE 14, 52: PRINT USING "##,###"; low
     LOCATE 15, 52: PRINT USING "##,###"; Ver
     SpAn = SpAn + 1
     SpielerGeld = 100: Ver = 0
     LOCATE 7, 52: PRINT USING "##,###"; SpAn
     LOCATE 12, 52: PRINT USING "##,###.#"; GeVer / SpAn
  END IF

LOOP UNTIL INKEY$ = CHR$(27)

DurchVer = GeVer / SpAn
ende:
'speichern
OPEN "c:\qbasic\bandit\save.dat" FOR OUTPUT AS #1
PRINT #1, SpAn
PRINT #1, GeVer
PRINT #1, lose
PRINT #1, win
PRINT #1, GewinnGeld
PRINT #1, DurchVer
PRINT #1, high
PRINT #1, low
PRINT #1, Gleiche2
PRINT #1, Gleiche3
PRINT #1, Gleiche4
PRINT #1, Gleiche5
PRINT #1, Ungleiche
PRINT #1, SpielerGeld
PRINT #1, Ver
CLOSE #1

END

SUB Hauptprogramm (SpielerGeld, Gleiche2, Gleiche3, Gleiche4, Gleiche5, Ungleiche)

SLEEP

SpielerGeld = SpielerGeld - 5

    K1 = INT(RND * 5) + 1                        ' die Farben bestimmen
    K2 = INT(RND * 5) + 1
    K3 = INT(RND * 5) + 1
    K4 = INT(RND * 5) + 1
    K5 = INT(RND * 5) + 1

    PAINT (310, 69), K1 * 3, 8
    PAINT (347, 69), K2 * 3, 8
    PAINT (385, 69), K3 * 3, 8
    PAINT (422, 69), K4 * 3, 8
    PAINT (459, 69), K5 * 3, 8

FOR z = 1 TO 5
    IF POINT(z * 37 + 273, 69) = 3 THEN F1 = F1 + 1
    IF POINT(z * 37 + 273, 69) = 6 THEN F2 = F2 + 1
    IF POINT(z * 37 + 273, 69) = 9 THEN F3 = F3 + 1
    IF POINT(z * 37 + 273, 69) = 12 THEN F4 = F4 + 1
    IF POINT(z * 37 + 273, 69) = 15 THEN F5 = F5 + 1
NEXT z

FOR z = 2 TO 5
    IF F1 = z THEN GOSUB Gewinn
    IF F2 = z THEN GOSUB Gewinn
    IF F3 = z THEN GOSUB Gewinn
    IF F4 = z THEN GOSUB Gewinn
    IF F5 = z THEN GOSUB Gewinn
NEXT z

IF F1 = 1 AND F2 = 1 AND F3 = 1 AND F4 = 1 AND F5 = 1 THEN
   SpielerGeld = SpielerGeld + 10
   Ungleiche = Ungleiche + 1
END IF

COLOR 15: LOCATE 4, 57: PRINT USING "##,### $"; SpielerGeld

GOTO w1

Gewinn:
COLOR 10
IF z = 2 THEN
   'SpielerGeld = SpielerGeld + 1
   Gleiche2 = Gleiche2 + 1
END IF
IF z = 3 THEN
   SpielerGeld = SpielerGeld + 5
   Gleiche3 = Gleiche3 + 1
END IF
IF z = 4 THEN
   SpielerGeld = SpielerGeld + 50
   Gleiche4 = Gleiche4 + 1
END IF
IF z = 5 THEN
   SpielerGeld = SpielerGeld + 200
   Gleiche5 = Gleiche5 + 1
END IF

RETURN

w1:
END SUB

SUB Spielfeld

CLS
SCREEN 12
RANDOMIZE TIMER

COLOR 5: LOCATE 2, 26: PRINT "*** Geld - Test - Version ***"

LINE (190, 34)-(440, 34), 5, B

COLOR 15: LOCATE 4, 5: PRINT "Das aktive Spiel"
 
FOR z = 1 TO 5
    LINE (z * 37 + 272, 68)-(z * 37 + 278, 74), 8, B
NEXT z

LOCATE 4, 24: PRINT "Versuche =     0          Geld =      0 $"
LOCATE 5, 24: PRINT "Die 5 Ksten :"

LOCATE 7, 5: PRINT "Die Statistiken    Anzahl der Spiele         :      0 "
LOCATE 9, 24: PRINT "Gesamt - Versuche         :      0 "
LOCATE 10, 27: PRINT "Davon mit Verlust      :      0 (Verlust :       0 $)"
LOCATE 11, 27: PRINT "Davon ohne Verlust     :      0 (Gewinn  :       0 $)"
LOCATE 12, 24: PRINT "Durchschnitts Versuche    :      0 "
LOCATE 13, 24: PRINT "Die meisten Versuche      :      0 "
LOCATE 14, 24: PRINT "Die wenigsten Versuche    :      0 "
LOCATE 15, 24: PRINT "Versuche im letzten Spiel :      -"

LOCATE 17, 24: PRINT "ษออออออออออหออออออออออหออออออออออหออออออออออหออออออออออป"
LOCATE 18, 24: PRINT "บ   2 Gl.  บ   3 Gl.  บ   4 Gl.  บ   5 Gl.  บ  5 Ungl. บ"
LOCATE 19, 24: PRINT "ฬออออออออออฮออออออออออฮออออออออออฮออออออออออฮออออออออออน"
LOCATE 20, 24: PRINT "บ       0  บ       0  บ       0  บ       0  บ       0  บ"
LOCATE 21, 24: PRINT "ศออออออออออสออออออออออสออออออออออสออออออออออสออออออออออผ"

LOCATE 23, 5: PRINT "Die Gewinnne       2 Gleiche   =   0 $"
LOCATE 24, 24: PRINT "3 Gleiche   =   5 $"
LOCATE 25, 24: PRINT "4 Gleiche   =  10 $"
LOCATE 26, 24: PRINT "5 Gleiche   = 200 $"
LOCATE 27, 24: PRINT "5 Ungleiche =  10 $"

COLOR 7: LOCATE 28, 47: PRINT "Pause = 'Pause'   Beenden = 'Esc'"

LINE (171, 50)-(171, 430), 8, B
LINE (30, 86)-(640, 86), 8, B
LINE (171, 246)-(640, 246), 8, B
LINE (30, 339)-(640, 339), 8, B

END SUB

