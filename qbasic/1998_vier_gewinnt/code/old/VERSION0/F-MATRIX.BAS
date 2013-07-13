REM Pawel
REM Vier gewinnt.....................................................
DIM SHARED feld(5, 6)
SCREEN 12
CLS
wechsel = 1

REM Spielfeld........................................................
LINE (25, 80)-STEP(430, 380), 15, B
FOR zeile = 20 TO 70 STEP 10
FOR spalte = 10 TO 70 STEP 10
CIRCLE (spalte * 6, zeile * 6), 22, 15
NEXT spalte
NEXT zeile
PAINT (30, 85), 8, 15
LOCATE 2, 64: PRINT "FELDMATRIX"
GOSUB matrix


REM Stein bewegen....................................................
po1 = 60
mensch:                               
ru = 120: neu = 40: r = 0: v = 0
IF wechsel = 1 THEN sfarb = 4
IF wechsel = -1 THEN sfarb = 2

GOSUB setzen
DO
  COLOR sfarb: LOCATE 4, 62 + h * 2: PRINT h
  keyb$ = INKEY$
          SELECT CASE keyb$
                 CASE CHR$(0) + "M"
                      GOSUB weg
                         IF po1 >= 60 AND po1 <> 420 THEN po1 = po1 + 60: h = h + 1
                            COLOR 0: LOCATE 4, 60 + h * 2: PRINT h
                            GOSUB setzen
                            
                 CASE CHR$(0) + "K"
                      GOSUB weg
                         IF po1 <= 420 AND po1 <> 60 THEN po1 = po1 - 60: h = h - 1
                            COLOR 0: LOCATE 4, 64 + h * 2: PRINT h
                            GOSUB setzen
                 
                 CASE CHR$(13)
                      GOSUB weg
                            COLOR 15
                            GOSUB kontrolle
                            GOSUB runter
                            GOSUB matrix
                 CASE CHR$(27)
                      END
          END SELECT
LOOP UNTIL keyb$ = CHR$(13)

REM Computerzug +++++++++++++++++++++++++++++++++++++++++++++++++++++
wechsel = wechsel * -1
COLOR 0: LOCATE 4, 62 + h * 2: PRINT h
GOTO mensch
END

REM Stein einsetzen--------------------------------------------------
setzen:
IF neu = 40 THEN CIRCLE (po1, neu), 22, 15
PAINT (po1, neu), sfarb, 15
RETURN

REM Stein l”schen----------------------------------------------------
weg:
PAINT (po1, neu), 0, 15
IF neu = 40 THEN CIRCLE (po1, neu), 22, 0
RETURN

REM stein fllt .....................................................
runter:
IF r < 0 THEN wechsel = wechsel * -1: RETURN
FOR fallen = 0 TO r
    PAINT (po1, 120 + 60 * fallen), sfarb, 15
    PAINT (po1, 120 + 60 * (fallen - 1)), 0, 15
    FOR dummy = 1 TO 100: NEXT dummy
NEXT fallen
RETURN

REM Matrix anzeigen..................................................
matrix:
FOR ve = 0 TO 5
FOR ho = 0 TO 6
LOCATE ve + 6, 62 + ho * 2: PRINT feld(ve, ho)
NEXT ho
NEXT ve
RETURN

REM Kontrolle .......................................................
kontrolle:
r = 0
DO
  IF feld(r, h) = 0 THEN frei = 1:  ELSE frei = 0: r = r - 1
  IF r = 5 THEN frei = 0
  IF frei = 1 THEN r = r + 1
LOOP WHILE frei <> 0
IF r < 0 THEN RETURN
feld(r, h) = sfarb

'ออออออออออออออออออออออออออ Vier-in-einer-Reihe อออออออออออออออออออออออออออออออออออ
COLOR 15
GOSUB matrix
RETURN


