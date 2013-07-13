DECLARE SUB AString.Schreiben (XPos, ypos, A$)
DECLARE SUB Ausschneiden (Speed)
DECLARE SUB Beenden ()
DECLARE SUB Hilfe ()
DECLARE SUB Laden ()
DECLARE SUB MenuFenster (FOn, Speed, FarbeOff)
DECLARE SUB MenuFensterInhalt (y)
DECLARE SUB Namen.Eingeben (Name1$, Name2$)
DECLARE SUB Options ()
DECLARE SUB Spielen (Speed)
DECLARE SUB VierWin.Umbewegen (Speed)
DECLARE SUB Uberprufen ()

DIM SHARED Stein(1 TO 100, 1 TO 200) AS INTEGER      ' Steine, Spielefeld
DIM SHARED Schrift(1 TO 100, 1 TO 200) AS INTEGER    ' Schrift, 3Dfx
DIM SHARED Feld(1 TO 7, 1 TO 6) AS INTEGER           ' SpielDatenfeld

Ausschneiden Speed

MenuFenster FOn, Speed, FarbeOff

y = 1: MenuFensterInhalt y

DO
  I$ = INKEY$
  SELECT CASE I$
         CASE CHR$(0) + "P": y = y + 1: MenuFensterInhalt y
         CASE CHR$(0) + "H": y = y - 1: MenuFensterInhalt y
         CASE CHR$(13)
              MenuFenster FOn, Speed, FarbeOff
              IF y = 1 THEN
                 FarbeOff = 1: MenuFenster FOn, Speed, FarbeOff
                 Namen.Eingeben Name1$, Name2$
                 MenuFenster FOn, Speed, FarbeOff
                 VierWin.Umbewegen Speed
                 Spielen Speed
              END IF
              IF y = 2 THEN Laden
              IF y = 3 THEN Hilfe
              IF y = 4 THEN Options
              IF y = 5 THEN Beenden
              MenuFenster FOn, Speed, FarbeOff
              MenuFensterInhalt y
  END SELECT
LOOP UNTIL I$ = CHR$(27)
Beenden

SUB AString.Schreiben (XPos, ypos, A$)
le = LEN(A$)
FOR t = 1 TO le
    I = ASC(MID$(A$, t, 1))
    IF I = 95 THEN I = 125
    IF I > 96 THEN I = I - 6
    IF I = 32 THEN I = 117
    IF I = 58 THEN I = 118
    IF I = 49 THEN I = 120
    IF I = 50 THEN I = 121
    PUT (XPos, ypos), Schrift(1, I - 30), PSET
    IF I <> 117 THEN
       FOR x = XPos TO XPos + 12
           FOR y = ypos TO ypos + 11
               IF POINT(x, y) <> 0 THEN Lastpos = x
           NEXT y
       NEXT x
    ELSE
       Lastpos = XPos + 6
    END IF
    XPos = Lastpos + 3
NEXT t
END SUB

SUB Ausschneiden (Speed)
DEF SEG = &HA000
SCREEN 13
RANDOMIZE TIMER

SHELL "bmp.exe vier21.bmp"

FOR A = 20 TO 180 STEP 20
    GET (A - 20, 0)-(A - 2, 23), Stein(1, A / 5)
    GET (A - 20, 26)-(A - 2, 50), Stein(1, 50 + A / 5)
NEXT A

FOR A = 0 TO 10
    GET (A * 29, 52)-STEP(25, 26), Stein(1, 100 + A * 4)
NEXT
                  
GET (234, 2)-(260, 13), Schrift(1, 1)               ' Vier
GET (183, 30)-(253, 42), Schrift(1, 4)              ' Gewinnt©¸
GET (240, 18)-(261, 26), Schrift(1, 10)             ' von
GET (183, 1)-(231, 12), Schrift(1, 12)              ' Mathias
GET (183, 15)-(238, 26), Schrift(1, 15)             ' Nitzsche
GET (263, 0)-(319, 43), Schrift(1, 19)              ' 3dfx

FOR A = 21 TO 105 STEP 21
    r = r + 10
    GET (147, A + 74)-(232, A + 94), Schrift(1, 90 + r)      ' Deaktiv
    GET (233, A + 74)-(318, A + 94), Schrift(1, 140 + r)     ' Aktiv
NEXT A

FOR A = 0 TO 130 STEP 13
    GET (A, 81)-(A + 12, 92), Schrift(1, 35 + A / 13)
    GET (A, 96)-(A + 12, 107), Schrift(1, 46 + A / 13)
    GET (A, 111)-(A + 12, 125), Schrift(1, 57 + A / 13)
    GET (A, 126)-(A + 12, 140), Schrift(1, 68 + A / 13)
    GET (A, 141)-(A + 12, 155), Schrift(1, 79 + A / 13)
    IF A < 14 THEN GET (A, 155)-(A + 12, 166), Schrift(1, 90 + A / 13)
NEXT A

CLS

starttime = TIMER
FOR I# = 1 TO 100000: NEXT I#
stoptime = TIMER
Speed = 10 / (stoptime - starttime)
                                           

Speed = 10
PUT (110, 3), Schrift(1, 1)            ' Vier
PUT (142, 2), Schrift(1, 4)            ' Gewinnt©¸
PUT (91, 20), Schrift(1, 10)           ' von
PUT (118, 17), Schrift(1, 12)          ' Mathias
PUT (173, 17), Schrift(1, 15)          ' Nitzsche
END SUB

SUB Beenden
    SYSTEM
END SUB

SUB Hilfe
END SUB

SUB Laden
END SUB

SUB MenuFenster (FOn, Speed, FarbeOff)
IF FOn = 0 THEN W = 0: V = 90: Q = 1: FOn = 1 ELSE W = 90: V = 0: Q = -1: FOn = 0
FOR x = W TO V STEP Q
    LINE (159 - x, 113 - .86666 * x)-(162 + x, 115 + .86666 * x), 0, B
    LINE (160 - x, 114 - .86666 * x)-(161 + x, 114 + .86666 * x), 249, B
    LINE (161 - x, 115 - .86666 * x)-(160 + x, 113 + .86666 * x), 249, B
    LINE (162 - x, 116 - .86666 * x)-(159 + x, 112 + .86666 * x), 187, B
    LINE (163 - x, 117 - .86666 * x)-(158 + x, 111 + .86666 * x), 187, B
    IF FarbeOff = 1 THEN LINE (164 - x, 118 - .86666 * x)-(157 + x, 110 + .86666 * x), 0, B
    SOUND 100 + x * 10, .1
    FOR K = 1 TO 20 * Speed: NEXT K
NEXT x
END SUB

SUB MenuFensterInhalt (y)
SOUND 500, .1
IF y = 6 THEN y = 1
IF y = 0 THEN y = 5
FOR A = 1 TO 5
    IF A = y THEN B = 140 + A * 10 ELSE B = 90 + A * 10
    PUT (117, 20 + A * 28), Schrift(1, B), PSET
NEXT A
END SUB

SUB Namen.Eingeben (Name1$, Name2$)
A$ = "Namen eingeben": XPos = 94: ypos = 46: AString.Schreiben XPos, ypos, A$
LINE (73, 63)-(248, 68), 187, BF
LINE (72, 65)-(249, 66), 249, BF

A$ = "Spieler 1:": XPos = 84: ypos = 76: AString.Schreiben XPos, ypos, A$
LINE (73, 124)-(248, 130), 187, BF
LINE (72, 126)-(249, 128), 249, BF

A$ = "Spieler 2:": XPos = 84: ypos = 138: AString.Schreiben XPos, ypos, A$

ypos = 100
Again:

XPos = 84:
A$ = "_": AString.Schreiben XPos, ypos, A$
XPos = 84

DO
  A$ = INKEY$
  IF A$ <> "" AND A$ > CHR$(64) AND A$ < CHR$(91) OR A$ > CHR$(96) AND A$ < CHR$(123) OR A$ = CHR$(32) THEN
     name$ = name$ + A$:
     A$ = A$ + "_"
     AString.Schreiben XPos, ypos, A$
     XPos = XPos - 10
  END IF
  IF A$ = CHR$(8) AND LEN(name$) > 0 THEN
     name$ = ""
     LINE (83, ypos - 2)-(245, ypos + 16), 0, BF
     XPos = 84
     A$ = "_"
     AString.Schreiben XPos, ypos, A$
     XPos = 84
  END IF
LOOP UNTIL XPos > 227 OR A$ = CHR$(13)

IF test = 0 THEN
   Name1$ = name$: name$ = "": test = 1: LINE (XPos, ypos)-(XPos + 12, ypos + 14), 0, BF: ypos = 162: GOTO Again
ELSE
   Name2$ = name$
END IF
                
END SUB

SUB Options
END SUB

SUB Spielen (Speed)
Aktiv = INT(RND * 2) + 1

IF Aktiv = 1 THEN PUT (73, 5), Stein(1, 4), PSET
IF Aktiv = 2 THEN PUT (73, 5), Stein(1, 54), PSET


FOR A = 100 TO 124 STEP 4
    FOR B = 1 TO 156 STEP 26
        FOR C = 1 TO 182 STEP 26
            PUT (C + 69, B + 35), Stein(1, A), PSET
        NEXT C
    NEXT B
    SOUND 800 - W * 10, .2
    FOR V = 1 TO Speed * 1000: NEXT V
NEXT A

x = 1: fx = 1

DO
  'IF Aktiv = 1 THEN x = INT(RND * 7) + 1: I$ = CHR$(13)
  'IF Aktiv = 2 THEN
  I$ = INKEY$
  SELECT CASE I$
         CASE CHR$(32): IF fx = 1 THEN PUT (263, 0), Schrift(1, 19), PSET: fx = 2 ELSE LINE (263, 1)-(319, 43), 1, BF: fx = 1
         CASE CHR$(0) + "K": IF x > 1 THEN LINE (73, 7)-(247, 28), 0, BF: x = x - 1
         CASE CHR$(0) + "M": IF x < 7 THEN LINE (73, 7)-(247, 28), 0, BF: x = x + 1
         CASE CHR$(13)
              FOR y = 1 TO 6
                  IF Feld(x, y) = 0 THEN maxY = y
              NEXT y
              IF maxY > 0 THEN
                 Feld(x, maxY) = Aktiv
                 LINE (73, 7)-(247, 28), 0, BF
                 IF Aktiv = 1 THEN A = 128: Aktiv = 2 ELSE A = 132: Aktiv = 1
                 FOR y = 1 TO maxY
                     PUT (x * 26 + 44, y * 26 + 10), Stein(1, A), PSET
                     FOR B = 1 TO Speed * 700: NEXT
                     IF y < maxY THEN PUT (x * 26 + 44, y * 26 + 10), Stein(1, 124), PSET
                 NEXT y
                 SOUND 800 - maxY * 100, .5
                 ' ********** Gewinn "\\\", "///"**********************************************
                 FOR Y1 = 1 TO 3
                     FOR X1 = 1 TO 4
                         FOR Z = 0 TO 3
                             IF Feld(X1 + Z, Y1 + Z) = 1 THEN rot1 = rot1 + 1
                             IF Feld(X1 + Z, Y1 + Z) = 2 THEN gelb1 = gelb1 + 1
                             IF Feld(3 + X1 - Z, Y1 + Z) = 1 THEN rot2 = rot2 + 1
                             IF Feld(3 + X1 - Z, Y1 + Z) = 2 THEN gelb2 = gelb2 + 1
                             IF rot1 > 3 OR gelb1 > 3 OR gelb2 > 3 OR rot2 > 3 THEN GOSUB Flackern
                         NEXT Z
                         rot1 = 0: gelb1 = 0: rot2 = 0: gelb2 = 0
                     NEXT X1
                 NEXT Y1
                 '********** Gewinn "---" ****************************************************
                 FOR Y1 = 1 TO 6
                     FOR X1 = 1 TO 4
                         FOR Z = 0 TO 3
                             IF Feld(X1 + Z, Y1) = 1 THEN rot3 = rot3 + 1
                             IF Feld(X1 + Z, Y1) = 2 THEN gelb3 = gelb3 + 1
                             IF rot3 > 3 OR gelb3 > 3 THEN GOSUB Flackern
                         NEXT Z
                         rot3 = 0: gelb3 = 0
                     NEXT X1
                 NEXT Y1
                 '********** Gewinn "³³³" ****************************************************
                 FOR Y1 = 1 TO 3
                     FOR X1 = 1 TO 7
                         FOR Z = 0 TO 3
                             IF Feld(X1, Y1 + Z) = 1 THEN rot4 = rot4 + 1
                             IF Feld(X1, Y1 + Z) = 2 THEN gelb4 = gelb4 + 1
                             IF rot4 > 3 OR gelb4 > 3 THEN GOSUB Flackern
                         NEXT Z
                         rot4 = 0: gelb4 = 0
                     NEXT X1
                 NEXT Y1
                 '********** Unentschieden ***************************************************
                 unent = 0
                 FOR X1 = 1 TO 7
                     IF Feld(X1, 1) <> 0 THEN unent = unent + 1
                 NEXT
                 IF unent = 7 THEN
                    dx = 1: dy = 1: Y1 = 1: X1 = 1
                    DO
                      IF Feld(X1, Y1) = 1 THEN A = 136 ELSE A = 140
                      PUT (X1 * 26 + 44, Y1 * 26 + 10), Stein(1, A), PSET
                      SOUND Y1 + X1 * 100, .2
                      FOR Z = 1 TO Speed * 2000: NEXT Z
                      PUT (X1 * 26 + 44, Y1 * 26 + 10), Stein(1, A - 8), PSET
                      X1 = X1 + dx: Y1 = Y1 + dy
                      IF X1 < 2 OR X1 > 6 THEN dx = -dx
                      IF Y1 < 2 OR Y1 > 5 THEN dy = -dy
                    LOOP UNTIL INKEY$ <> ""
                    RUN
                 END IF
                 maxY = 0
              END IF
         CASE ELSE
              IF dre = 36 THEN dre = 0
              dre = dre + 4
              PUT (x * 26 + 47, 5), Stein(1, dre + Aktiv * 50 - 50), PSET
              FOR A = 1 TO Speed * 300: NEXT
  END SELECT
LOOP UNTIL I$ = CHR$(27)
END

Flackern:
  t = 1
  DO
    IF t = 1 THEN W = 0: V = 78: Q = 26: t = 2 ELSE W = 52: V = 26: Q = -26: t = 1
    FOR Z = W TO V STEP Q
        IF rot1 > 3 THEN PUT (X1 * 26 + Z + 44, Y1 * 26 + Z + 10), Stein(1, 136), PSET
           IF gelb1 > 3 THEN PUT (X1 * 26 + Z + 44, Y1 * 26 + Z + 10), Stein(1, 140), PSET
        IF rot2 > 3 THEN PUT (122 + X1 * 26 - Z, Y1 * 26 + Z + 10), Stein(1, 136), PSET
           IF gelb2 > 3 THEN PUT (122 + X1 * 26 - Z, Y1 * 26 + Z + 10), Stein(1, 140), PSET
        IF rot3 > 3 THEN PUT (X1 * 26 + Z + 44, Y1 * 26 + 10), Stein(1, 136), PSET
           IF gelb3 > 3 THEN PUT (X1 * 26 + Z + 44, Y1 * 26 + 10), Stein(1, 140), PSET
        IF rot4 > 3 THEN PUT (X1 * 26 + 44, Y1 * 26 + Z + 10), Stein(1, 136), PSET
           IF gelb4 > 3 THEN PUT (X1 * 26 + 44, Y1 * 26 + Z + 10), Stein(1, 140), PSET
      SOUND 200 + Z, .1
      FOR B = 1 TO Speed * 1400: NEXT B
          IF rot1 > 3 THEN PUT (X1 * 26 + Z + 44, Y1 * 26 + Z + 10), Stein(1, 128), PSET
             IF gelb1 > 3 THEN PUT (X1 * 26 + Z + 44, Y1 * 26 + Z + 10), Stein(1, 132), PSET
          IF rot2 > 3 THEN PUT (122 + X1 * 26 - Z, Y1 * 26 + Z + 10), Stein(1, 128), PSET
             IF gelb2 > 3 THEN PUT (122 + X1 * 26 - Z, Y1 * 26 + Z + 10), Stein(1, 132), PSET
          IF rot3 > 3 THEN PUT (X1 * 26 + Z + 44, Y1 * 26 + 10), Stein(1, 128), PSET
             IF gelb3 > 3 THEN PUT (X1 * 26 + Z + 44, Y1 * 26 + 10), Stein(1, 132), PSET
          IF rot4 > 3 THEN PUT (X1 * 26 + 44, Y1 * 26 + Z + 10), Stein(1, 128), PSET
             IF gelb4 > 3 THEN PUT (X1 * 26 + 44, Y1 * 26 + Z + 10), Stein(1, 132), PSET
    NEXT Z
  LOOP UNTIL INKEY$ <> ""
  RUN
RETURN

END SUB

SUB VierWin.Umbewegen (Speed)
FOR A = 142 TO 1 STEP -1
    PUT (A, 16 - A / 10.9), Schrift(1, 4), PSET   ' Gewinnt©¸
    IF A < 110 THEN PUT (A, 1 + A / 50), Schrift(1, 1), PSET      ' Vier
    FOR B = 1 TO Speed * 20: NEXT B
NEXT A
FOR A = 1 TO 207
    PUT (91 + A, 20 + A / 104), Schrift(1, 10), PSET   ' von
    IF A < 155 THEN PUT (117 + A, 17 + A / 8.15), Schrift(1, 12), PSET  ' Mathias
    IF A < 91 THEN PUT (172 + A, 17 + A / 2.5), Schrift(1, 15), PSET   ' Nitzsche
    FOR B = 1 TO Speed * 20: NEXT B
NEXT A
FOR A = 1 TO 134
    PUT (298, 21 + A), Schrift(1, 10), PSET      ' von
    PUT (271, 36 + A), Schrift(1, 12), PSET      ' Mathias
    PUT (263, 53 + A), Schrift(1, 15), PSET      ' Nitzsche
    FOR B = 1 TO Speed * 20: NEXT B
NEXT A
END SUB

