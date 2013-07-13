REM -------- VIER gewinnt -------------------------------------- Pawel
SHELL "C:\Qbasic\Vier\Version2\Flyplay C:\Qbasic\Vier\Version2\BRETT3.fli"
DIM feld(6, 5): DIM stein(3)                    'Felder dimensionieren
los:
SCREEN 12: CLS : COLOR 15
Mpunkte = 0: Cpunkte = 0: anf = 1: begin = 0    'Variablen vereinbaren
anfang:
wechsel = anf: anzahl = 0: COLOR 15
FOR y = 0 TO 5
    FOR x = 0 TO 6
        feld(x, y) = 0
    NEXT x
NEXT y
IF begin > 0 THEN CLS
IF begin = 0 THEN begin = 1

REM ...........................Spielfeld.............................
LINE (25, 55)-STEP(430, 370), 15, B: LINE (29, 63)-STEP(422, 362), 15, B
      FOR zeile = 20 TO 70 STEP 10
          FOR spalte = 10 TO 70 STEP 10
              CIRCLE (spalte * 6, zeile * 6 - 25), 22, 15
              CIRCLE (spalte * 6, zeile * 6 - 25), 25, 15
          NEXT spalte
      NEXT zeile
PAINT (28, 58), 7, 15: PAINT (36, 66), 8, 15
LINE (15, 425)-STEP(450, 10), 7, BF: LINE (5, 435)-STEP(470, 20), 8, BF
LINE (15, 425)-STEP(450, 10), 15, B: LINE (5, 435)-STEP(470, 20), 7, B
IF Mpunkte = 0 AND Cpunkte = 0 THEN GOSUB Frage
LOCATE 5, 61: PRINT name$: LOCATE 9, 61: PRINT "COMPUTER"
LOCATE 7, 61: COLOR 12: PRINT "Spiele gesiegt:"; Mpunkte
LOCATE 11, 61: COLOR 10: PRINT "Spiele gesiegt:"; Cpunkte

REM .........................Stein bewegen...........................
anfg:
RESTORE anfg
h = 0: po = 60
mensch:
neu = 25: r = 0: v = 0: COLOR 15
IF wechsel = 1 THEN sfarb = 4
IF wechsel = -1 THEN sfarb = 2
LINE (470, 118)-STEP(160, 64 * wechsel), 15, B
LINE (470, 118)-STEP(160, 64 * -wechsel), sfarb, B
IF Rechner = wechsel THEN GOSUB COMPUTER
GOSUB setzen

DO
LOCATE 6, 61: COLOR VAL(RIGHT$(TIME$, 1)) + 2: PRINT ".........berlegt"
  keyb$ = INKEY$
          SELECT CASE keyb$
                 CASE CHR$(0) + "M"
                      GOSUB weg
                            po = po + 60: h = h + 1
                         IF po > 420 THEN
                            po = po - 60: h = h - 1
                         END IF
                            GOSUB setzen
                 CASE CHR$(0) + "K"
                      GOSUB weg
                            po = po - 60: h = h - 1
                         IF po < 60 THEN
                            po = po + 60: h = h + 1
                         END IF
                            GOSUB setzen
                 CASE CHR$(13)
                      GOSUB weg
                            COLOR 15
                            GOSUB kontrolle
                            GOSUB runter
                            LOCATE 6, 61: COLOR 15: PRINT "......hat gesetzt"
                 CASE CHR$(27)
                      GOSUB weiter
          END SELECT
LOOP UNTIL keyb$ = CHR$(13)
wechsel = wechsel * -1
GOTO mensch
GOSUB weiter

REM +++++++++++++++++++++++++Computerzug+++++++++++++++++++++++++++++
COMPUTER:
GOSUB compzug
GOSUB weg
sfarb = 2: h = -1: po = 0
LOCATE 10, 61: COLOR VAL(RIGHT$(TIME$, 1)) + 2: PRINT ".........berlegt"
  FOR i = 0 TO zufall
       FOR dummy = 1 TO 1700: NEXT dummy
       GOSUB weg
       po = po + 60: h = h + 1
       GOSUB setzen
   NEXT i
compruef = 0
GOSUB kontrolle: GOSUB runter
wechsel = -wechsel
LOCATE 10, 61: COLOR 15: PRINT "......hat gesetzt"
GOSUB anfg

REM -----------------------Stein einsetzen---------------------------
setzen:
IF neu = 25 THEN CIRCLE (po, neu), 22, 15
PAINT (po, neu), sfarb, 15
RETURN

REM ------------------------Stein l”schen----------------------------
weg:
IF neu = 25 THEN LINE (35, 3)-STEP(410, 45), 0, BF
RETURN

REM .........................Stein f„llt.............................
runter:
IF r < 0 THEN wechsel = wechsel * -1: RETURN
anzahl = anzahl + 1
GOSUB weg
FOR fallen = 0 TO r
    PAINT (po, 95 + 60 * fallen), sfarb, 15
    PAINT (po, 95 + 60 * (fallen - 1)), 0, 15
    FOR dummy = 1 TO 800: NEXT dummy
NEXT fallen
GOSUB Pruefen
IF anzahl = 42 THEN GOSUB gewonnen
GOSUB weg
RETURN

REM ..........................Kontrolle..............................
kontrolle:
r = 0
DO
IF feld(h, r) = 0 THEN frei = 1:  ELSE frei = 0: r = r - 1
IF r = 5 THEN frei = 0
IF frei = 1 THEN r = r + 1
LOOP WHILE frei <> 0
IF r < 0 THEN RETURN
IF compruef = 0 THEN feld(h, r) = sfarb
COLOR 15
RETURN

REM ---------------------------pruefen-------------------------------
Pruefen:
FOR i = 0 TO 3: stein(i) = 0: NEXT i
raus = 0: x = h - 2: y = r - 2: pruef = 0: richtx = 1: richty = 1
DO
x = x + richtx
DO
  y = y + richty: a = y: B = x:
      DO
          IF x <= 6 AND y <= 5 AND x >= 0 AND y >= 0 THEN
                SELECT CASE feld(x, y)
                       CASE IS = sfarb
                SELECT CASE pruef
                       CASE IS = 0: x = x - richtx: y = y - richty
                       CASE IS = 1: x = x - richtx
                       CASE IS = 2: x = x - richtx: y = y + richty
                       CASE IS = 3: y = y + richty
                END SELECT
                unterbr = 0: stein(pruef) = stein(pruef) + 1
           CASE IS <> sfarb
                unterbr = 1
           END SELECT
  ELSE
    unterbr = 1
  END IF
  IF compruef = 0 THEN IF stein(pruef) = 3 THEN GOSUB gewonnen
 LOOP WHILE unterbr = 0
y = a: x = B
IF pruef = 3 THEN pruef = 5
pruef = pruef + 1
LOOP WHILE pruef < 3
x = h + 2: y = r + 2: pruef = 0: richtx = -richtx: richty = -richty
IF richtx = 0 THEN raus = 1
IF richtx = 1 THEN x = h: y = r: richtx = 0: pruef = 3
LOOP WHILE raus = 0
RETURN

Frage:
LOCATE 5, 61: PRINT "Dein Name bitte:"
LOCATE 6, 62: LINE INPUT ""; name$
name$ = LEFT$(name$, 15): Rechner = -1
IF LEN(name$) = 0 THEN name$ = "Mensch"
LOCATE 5, 61: PRINT "                ": LOCATE 6, 62: PRINT "                "
RETURN

gewonnen:
IF anzahl = 42 THEN text$ = "Unentschieden":  ELSE text$ = "...hat gewonnen !"
IF wechsel = 1 THEN
   LOCATE 6, 61: COLOR 14: PRINT text$: COLOR 15
   IF text$ <> "Unentschieden" THEN Mpunkte = Mpunkte + 1
ELSE
   LOCATE 10, 61: COLOR 12: PRINT text$: COLOR 15
   IF text$ <> "Unentschieden" THEN Cpunkte = Cpunkte + 1
END IF

weiter:
COLOR 12
anf = -anf
IF wechsel = 1 THEN
   LOCATE 13, 62: INPUT "Weiter (J/N)"; Wahl$
ELSE
   LOCATE 13, 62: INPUT "Weiter (J/N)"; Wahl$
END IF

IF keyb$ = CHR$(27) THEN
   IF LCASE$(Wahl$) = "j" OR Wahl$ = "" THEN GOSUB los
ELSE
   IF LCASE$(Wahl$) = "j" OR Wahl$ = "" THEN GOSUB anfang
END IF
END

REM -------------------------- Computer gewinnt -------------------------
compzug:
h = 0: sfarb = 2: compruef = 1: zugnicht = 0
FOR sfarb = 1 TO 4 STEP 3
    FOR h = 0 TO 6
        GOSUB kontrolle: compruef = 1
        IF r >= 0 THEN
         GOSUB Pruefen
          FOR n = 0 TO 3
              SELECT CASE stein(n)
                     CASE IS = 3: zufall = h: RETURN
              END SELECT
          NEXT n
        END IF
    NEXT h
NEXT sfarb

REM -------------------- Menschensieg erkennen und verhindern ---------------
FOR sfarb = 4 TO 1 STEP -3
    FOR h = 0 TO 6
        IF sfarb = 4 AND zugnicht(h) = 0 THEN
           GOSUB kontrolle
            r = r - 1: GOSUB Pruefen
             FOR n = 0 TO 2
                 SELECT CASE stein(n)
                        CASE IS = 3: zugnicht(h) = 1: GOSUB weiter1
                 END SELECT
             NEXT n
              GOSUB Pruefen
             FOR n = 0 TO 2 STEP 2
                 SELECT CASE stein(n)
                        CASE IS = 2: zufall = h: RETURN
                 END SELECT
             NEXT n
             IF stein(3) = 2 THEN zufall = h: RETURN
            r = r - 1: GOSUB Pruefen
          
             FOR n = 0 TO 2
                 SELECT CASE stein(n)
                        CASE IS = 3: zufall = h: RETURN
                 END SELECT
             NEXT n
           IF r >= 0 THEN
           r = r + 2: GOSUB Pruefen
             SELECT CASE stein(3)
                    CASE IS = 2: zufall = h: RETURN
             END SELECT
           END IF
        ELSEIF sfarb = 2 AND zugnicht(h) = 0 THEN
           GOSUB kontrolle: r = r - 1: GOSUB Pruefen
             FOR n = 0 TO 2
                 SELECT CASE stein(n)
                        CASE IS = 3: zufall = h: RETURN
                 END SELECT
             NEXT n
           r = r + 1
             SELECT CASE stein(3)
                    CASE IS = 2: zufall = h: RETURN
             END SELECT
        END IF
weiter1:
   NEXT h
NEXT sfarb

weiter2:
 RANDOMIZE TIMER
 zufall = INT(RND * 6)
IF zugnicht(zufall) = 1 THEN GOSUB weiter2
RETURN

