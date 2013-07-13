'อออออออออออออออออออออออออออออออ Vier gewinnt ออออออออออออออออออออออออออออออออออ
RANDOMIZE TIMER
SCREEN 12
DIM feld(6, 5)
CLS
anf:
'อออออออออออออออออออออออออออออออ Spielfeld อออออออออออออออออออออออออออออออออออ
LINE (25, 80)-STEP(430, 370), 15, B
FOR zeile = 20 TO 70 STEP 10
FOR spalte = 10 TO 70 STEP 10
CIRCLE (spalte * 6, zeile * 6), 22, 15
NEXT spalte
NEXT zeile
PAINT (30, 85), 8, 15

'อออออออออออออออออออออออออออออออ Stein bewegen อออออออออออออออออออออออออออออออออออ
mensch:
ru = 120: neu = 40: po1 = 60: r = 0: v = 0: h = 0
wechsel = 1: sfarb = 4
nochm1:
GOSUB setzen

DO
  keyb$ = INKEY$
          SELECT CASE keyb$
                 CASE CHR$(0) + "M"
                      GOSUB weg
                         IF po1 >= 60 AND po1 <> 420 THEN po1 = po1 + 60: h = h + 1
                            GOSUB setzen
                 CASE CHR$(0) + "K"
                      GOSUB weg
                         IF po1 <= 420 AND po1 <> 60 THEN po1 = po1 - 60: h = h - 1
                            GOSUB setzen
                 CASE CHR$(13)
                      GOSUB weg
                            COLOR 15
                            GOSUB kontrolle
                            IF r < 0 THEN GOTO nochm1
                            GOSUB runter
                 CASE CHR$(27)
                            END
          END SELECT
LOOP UNTIL keyb$ = CHR$(13)

'อออออออออออออออออออออออออออออออ Computerzug อออออออออออออออออออออออออออออออออออ
nochm:
sfarb = 2: wechsel = -1: neu = 40: q = 0
h = INT(RND * 7)
DO
LOCATE 1, 1: PRINT h
po1 = q * 60 + 60
q = q + 1
GOSUB setzen
FOR a = 1 TO 150: NEXT
GOSUB weg
LOOP UNTIL q > h

GOSUB kontrolle
IF r < 0 THEN GOTO nochm
GOSUB runter
GOTO mensch
'อออออออออออออออออออออออออออออ Stein einsetzen อออออออออออออออออออออออออออออออออออ
setzen:
IF neu = 40 THEN CIRCLE (po1, neu), 22, 15
PAINT (po1, neu), sfarb, 15
RETURN

'อออออออออออออออออออออออออออออ Stein l”schen อออออออออออออออออออออออออออออออออออ
weg:
PAINT (po1, neu), 0, 15
IF neu = 40 THEN CIRCLE (po1, neu), 22, 0
RETURN

'อออออออออออออออออออออออออออออ Stein fllt อออออออออออออออออออออออออออออออออออ
runter:
  FOR fall = 0 TO r - 1
      PAINT (po1, 120 + 60 * fall), sfarb, 15
      FOR dummy = 1 TO 200: NEXT
'      SOUND 1000 - 100 * fall, 1
      PAINT (po1, 120 + 60 * fall), 0, 15
  NEXT fall
  GOSUB matrix
IF r < 0 THEN wechsel = wechsel * -1: RETURN
PAINT (po1, 120 + 60 * r), sfarb, 15
GOSUB pruefen
RETURN

'อออออออออออออออออออออออออออออ Kontrolle อออออออออออออออออออออออออออออออออออออ
kontrolle:
r = 0
DO
IF feld(h, r) = 0 THEN frei = 1:  ELSE frei = 0: r = r - 1
IF r = 5 THEN frei = 0
IF frei = 1 THEN r = r + 1
LOOP WHILE frei <> 0
IF r < 0 THEN RETURN
feld(h, r) = sfarb
COLOR 15
RETURN


'อออออออออออออออออออออออออออออ P R  F E N อออออออออออออออออออออออออออออออออออ
pruefen:
' --------------------------senkrecht------------------------------
unterbr = 0: Stein = 0: y = r
DO
 y = y + 1
 IF y <= 5 THEN
    SELECT CASE feld(h, y)
           CASE IS = sfarb
                unterbr = 0
                Stein = Stein + 1
           CASE IS <> sfarb
                unterbr = 1
    END SELECT
 ELSE
    unterbr = 1
 END IF
 IF Stein = 3 THEN GOSUB gewonnen
LOOP WHILE unterbr = 0
' -------------------------waagerecht------------------------------
Stein = 0: unterbr = 0: x = h
DO
 x = x + 1
 IF x <= 6 THEN
    SELECT CASE feld(x, r)
           CASE IS = sfarb
                unterbr = 0
                Stein = Stein + 1
           CASE IS <> sfarb
                unterbr = 1
    END SELECT
 ELSE
    unterbr = 1
 END IF
 IF Stein = 3 THEN GOSUB gewonnen
LOOP WHILE unterbr = 0
x = h
DO
 x = x - 1
  IF x >= 0 THEN
    SELECT CASE feld(x, r)
            CASE IS = sfarb
                 unterbr = 0
                 Stein = Stein + 1
            CASE IS <> sfarb
                 unterbr = 1
     END SELECT
  ELSE
     unterbr = 1
  END IF
 IF Stein = 3 THEN GOSUB gewonnen
LOOP WHILE unterbr = 0
' -----------------links oben nach rechts unten--------------------
Stein = 0: unterbr = 0: x = h: y = r
DO
 x = x + 1: y = y + 1
 IF x <= 6 AND y <= 5 THEN
    SELECT CASE feld(x, y)
           CASE IS = sfarb
                unterbr = 0
                Stein = Stein + 1
           CASE IS <> sfarb
                unterbr = 1
    END SELECT
 ELSE
    unterbr = 1
 END IF
 IF Stein = 3 THEN GOSUB gewonnen
LOOP WHILE unterbr = 0
x = h: y = r
DO
 x = x - 1: y = y - 1
  IF x >= 0 AND y >= 0 THEN
    SELECT CASE feld(x, y)
            CASE IS = sfarb
                 unterbr = 0
                 Stein = Stein + 1
            CASE IS <> sfarb
                 unterbr = 1
     END SELECT
  ELSE
     unterbr = 1
  END IF
 IF Stein = 3 THEN GOSUB gewonnen
LOOP WHILE unterbr = 0
' -----------------links unten nach rechts oben--------------------
Stein = 0: unterbr = 0: x = h: y = r
DO
 x = x - 1: y = y + 1
 IF x >= 0 AND y <= 5 THEN
    SELECT CASE feld(x, y)
           CASE IS = sfarb
                unterbr = 0
                Stein = Stein + 1
           CASE IS <> sfarb
                unterbr = 1
    END SELECT
 ELSE
    unterbr = 1
 END IF
 IF Stein = 3 THEN GOSUB gewonnen
LOOP WHILE unterbr = 0
x = h: y = r
DO
 x = x + 1: y = y - 1
  IF x <= 6 AND y >= 0 THEN
    SELECT CASE feld(x, y)
            CASE IS = sfarb
                 unterbr = 0
                 Stein = Stein + 1
            CASE IS <> sfarb
                 unterbr = 1
     END SELECT
  ELSE
     unterbr = 1
  END IF
 IF Stein = 3 THEN GOSUB gewonnen
z = z + 1
LOOP WHILE unterbr = 0
IF z = 42 THEN
   LOCATE 2, 30: COLOR 15: PRINT "ษอออออออออออออออออออป"
   LOCATE 3, 30: COLOR 15: PRINT "บ                   บ"
   LOCATE 4, 30: COLOR 15: PRINT "ศอออออออออออออออออออผ"
   LOCATE 3, 31: COLOR 14: PRINT "   Unentschieden   "
   LOCATE 5, 20: COLOR 15: PRINT "Drcken Sie die Leertaste zum fortfahren"
   'PLAY "bagfedc"
   SLEEP
   GOTO anf
END IF
RETURN

'อออออออออออออออออออออออออออออออออ Matrix ออออออออออออออออออออออออออออออออออออ
matrix:
FOR ver = 0 TO 5
    FOR hor = 0 TO 6
        LOCATE 6 + ver, hor * 2 + 60: PRINT feld(hor, ver)
    NEXT hor
NEXT ver
RETURN


'อออออออออออออออออออออออออออออ GEWONNEN !!! อออออออออออออออออออออออออออออออออออ
gewonnen:
   LOCATE 2, 30: COLOR 15: PRINT "ษอออออออออออออออออออป"
   LOCATE 3, 30: COLOR 15: PRINT "บ                   บ"
   LOCATE 4, 30: COLOR 15: PRINT "ศอออออออออออออออออออผ"
IF wechsel = 1 THEN
   LOCATE 3, 32: COLOR sfarb: PRINT "ROT hat gewonnen "
ELSE
   LOCATE 3, 32: COLOR sfarb: PRINT "GRN hat gewonnen"
END IF
'PLAY "cdefgabco2"
LOCATE 5, 20: COLOR 15: PRINT "Drcken Sie die Leertaste zum fortfahren"
SLEEP
FOR ver = 0 TO 5
    FOR hor = 0 TO 6
         feld(hor, ver) = 0
    NEXT hor
NEXT ver
CLS
z = 0
GOTO anf





