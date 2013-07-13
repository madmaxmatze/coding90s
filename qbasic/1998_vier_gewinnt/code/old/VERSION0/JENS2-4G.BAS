REM -----------------------------Vier gewinnt---------------------------------
DIM Zeile(7) AS INTEGER
SCREEN 12
Anfang:
CLS

INPUT "Name Spieler 1"; Name1$
INPUT "Name Spieler 2"; Name2$

FOR n = 1 TO 7
    Zeile(n) = 6
NEXT n

CLS

LINE (5, 0)-STEP(630, 49), 6, BF
LOCATE 1, 5: PRINT Name1$
LOCATE 1, 45: PRINT Name2$
LINE (5, 60)-STEP(630, 59), 7, B
LINE (5, 120)-STEP(630, 360), 2, BF

FOR y = 0 TO 6
    FOR x = 0 TO 6
        IF y > 0 THEN
           CIRCLE (50 + 90 * x, 90 + 60 * y), 25, 0
           PAINT (50 + 90 * x, 90 + 60 * y), 0
        ELSE
           CIRCLE (50 + 90 * x, 90 + 60 * y), 25, 7
        END IF
    NEXT x
NEXT y

spieler = -1

position = 50


setzen:

tast$ = ""

DO
 LINE (320, 0)-STEP(315 * (spieler * -1), 49), 0, B
 LINE (320, 0)-STEP(315 * spieler, 49), 15, B

 IF spieler = -1 THEN
    Farbe = 4
 ELSEIF spieler = 1 THEN
    Farbe = 1
 END IF

 CIRCLE (position, 90), 24, Farbe
 PAINT (position, 90), Farbe

 tast$ = ""
 WHILE tast$ = "": tast$ = INKEY$: WEND

 IF tast$ = CHR$(0) + "K" THEN
    hor = -1: setz = 0
 ELSEIF tast$ = CHR$(0) + "M" THEN
    hor = 1: setz = 0
 ELSEIF tast$ = " " THEN
    setz = 1: hor = 0
 ELSE
    hor = 0: setz = 0
 END IF

 PAINT (position, 90), 0
 CIRCLE (position, 90), 25, 7

 position = position + (90 * hor)
 IF position < 50 THEN position = 590
 IF position > 590 THEN position = 50
 
 CIRCLE (position, 90), 24, Farbe
 PAINT (position, 90), Farbe

IF setz = 1 THEN
   Reihe = INT((position - 50) / 90) + 1
   IF Zeile(Reihe) = 0 THEN BEEP: GOSUB setzen
   CIRCLE (50 + 90 * (Reihe - 1), 90 + 60 * Zeile(Reihe)), 23, Farbe
   PAINT (50 + 90 * (Reihe - 1), 90 + 60 * Zeile(Reihe)), Farbe
   GOSUB Pruefen
   Zeile(Reihe) = Zeile(Reihe) - 1
   spieler = spieler * -1
END IF

LOOP UNTIL tast$ = "q"
GOSUB Weiter

Pruefen:

 stein = 0
   FOR n = 1 TO 3
       IF POINT(position, 90 + 60 * (Zeile(Reihe) + n)) = Farbe THEN stein = stein + 1
   NEXT n
  IF stein >= 3 THEN GOSUB Gewonnen
unterbr = 0
 stein = 0
   FOR n = -1 TO -3 STEP -1
       SELECT CASE POINT(position + 90 * n, 90 + 60 * Zeile(Reihe))
              CASE IS = Farbe
                   stein = stein + 1: unterbr = 0
              CASE IS <> Farbe
                 unterbr = 1
       END SELECT
       IF unterbr = 1 THEN n = -3
   NEXT n
  IF stein >= 3 THEN GOSUB Gewonnen
   FOR n = 1 TO 3
       SELECT CASE POINT(position + 90 * n, 90 + 60 * Zeile(Reihe))
              CASE IS = Farbe
                   stein = stein + 1: unterbr = 0
              CASE IS <> Farbe
                 unterbr = 1
       END SELECT
       IF unterbr = 1 THEN n = 3
   NEXT n
  IF stein >= 3 THEN GOSUB Gewonnen

unterbr = 0
 stein = 0
   FOR n = -1 TO -3 STEP -1
       SELECT CASE POINT(position + 90 * n, 90 + 60 * (Zeile(Reihe) + n))
              CASE IS = Farbe
                   stein = stein + 1: unterbr = 0
              CASE IS <> Farbe
                 unterbr = 1
       END SELECT
       IF unterbr = 1 THEN n = -3
   NEXT n
  IF stein >= 3 THEN GOSUB Gewonnen
   FOR n = 1 TO 3
       SELECT CASE POINT(position + 90 * n, 90 + 60 * (Zeile(Reihe) + n))
              CASE IS = Farbe
                   stein = stein + 1: unterbr = 0
              CASE IS <> Farbe
                 unterbr = 1
       END SELECT
       IF unterbr = 1 THEN n = 3
   NEXT n
  IF stein >= 3 THEN GOSUB Gewonnen

unterbr = 0
 stein = 0
   FOR n = -1 TO -3 STEP -1
       SELECT CASE POINT(position - 90 * n, 90 + 60 * (Zeile(Reihe) - n))
              CASE IS = Farbe
                   stein = stein + 1: unterbr = 0
              CASE IS <> Farbe
                 unterbr = 1
       END SELECT
       IF unterbr = 1 THEN n = -3
   NEXT n
  IF stein >= 3 THEN GOSUB Gewonnen
   FOR n = 1 TO 3
       SELECT CASE POINT(position - 90 * n, 90 + 60 * (Zeile(Reihe) - n))
              CASE IS = Farbe
                   stein = stein + 1: unterbr = 0
              CASE IS <> Farbe
                 unterbr = 1
       END SELECT
       IF unterbr = 1 THEN n = 3
   NEXT n
  IF stein >= 3 THEN GOSUB Gewonnen
RETURN

Gewonnen:
 IF spieler = -1 THEN
    LOCATE 2, 5: PRINT "Du hast gewonnen"
    LOCATE 3, 5: INPUT "Nochmal spielen(j/n)?"; Wahl$
 ELSEIF spieler = 1 THEN
    LOCATE 2, 45: PRINT "Du hast gewonnen"
    LOCATE 3, 45: INPUT "Nochmal spielen "; Wahl$
 END IF

 IF Wahl$ = "" OR UCASE$(Wahl$) = "j" THEN GOSUB Anfang
Weiter:
 LOCATE 3, 5: INPUT "Spiel wirklich verlassen(j/n)?", Wahl2$
 IF UCASE$(Wahl2$) = "j" OR Wahl2$ = "" THEN END
GOSUB Anfang

