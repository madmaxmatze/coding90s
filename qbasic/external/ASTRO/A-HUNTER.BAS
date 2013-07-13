REM Pawel -----------------------------------------------------------------
REM Variablen vereinbaren -------------------------------------------------
DIM met(1 TO 100, 1 TO 40)
DIM ship(1 TO 580, 1 TO 5)
DIM disp(1 TO 280, 1 TO 9)
DIM anz(1 TO 350, 1 TO 2)
DIM mf(1 TO 80, 1 TO 4)
DIM SHARED ax(1 TO 15) AS INTEGER
DIM SHARED ay(1 TO 15) AS INTEGER
DIM SHARED ayc(1 TO 15) AS INTEGER
DIM te(15) AS STRING

REM Grafikmodus, Grafik in Bildschirmspeicher -----------------------------
DEF SEG = &HA000
SCREEN 13
SHELL "c:\qbasic\astro\bmp.exe c:\qbasic\astro\30s-spx.bmp"

REM 3 Reihen mit 10 Meteoriten und 10 Explosionsphasen ausschneiden -------
FOR T = 89 TO 275 STEP 20
en = en + 1
GET (T, 9)-STEP(17, 16), met(1, en)
GET (T, 26)-STEP(17, 15), met(1, en + 10)
GET (T, 46)-STEP(17, 16), met(1, en + 20)
GET (T, 125)-STEP(18, 17), met(1, en + 30)
NEXT

REM 3 mal Schiff ausschneiden --------------------------------------
GET (0 + 85, 74)-STEP(48, 44), ship(1, 1)
GET (51 + 85, 74)-STEP(48, 44), ship(1, 2)
GET (100 + 85, 74)-STEP(46, 44), ship(1, 3)
REM Wrack und Kapsel------------------------------------------------
GET (232, 91)-STEP(24, 28), ship(1, 4)
GET (262, 91)-STEP(34, 28), ship(1, 5)

REM Menue- Bildschirm ----------------------------------------------
GET (110, 151)-STEP(7, 21), disp(1, 1)
GET (123, 149)-STEP(7, 12), disp(1, 2)
GET (123, 160)-STEP(7, 13), disp(1, 3)
GET (167, 149)-STEP(7, 12), disp(1, 4)
GET (167, 160)-STEP(7, 13), disp(1, 5)
GET (130, 149)-STEP(37, 7), disp(1, 6)
GET (130, 165)-STEP(37, 8), disp(1, 7)
GET (75, 78)-STEP(6, 7), disp(1, 8)
GET (73, 70)-STEP(6, 7), disp(1, 9)

REM MÅndungsfeuer --------------------------------------------------
GET (238, 76)-STEP(8, 9), mf(1, 4)
GET (251, 76)-STEP(8, 9), mf(1, 3)
GET (264, 76)-STEP(8, 9), mf(1, 2)
GET (277, 76)-STEP(8, 9), mf(1, 1)

REM Anzeige ---------------------------------------------------------------
GET (178, 149)-STEP(18, 24), anz(1, 1)
GET (200, 151)-STEP(64, 19), anz(1, 2)

REM Bildschirm - Setup ----------------------------------------------------
SCREEN 13
nl = 3
LINE (85, 0)-(319, 199), 0, BF                      'rechter Bildschirm sauber
nr = 8: GOSUB mlinks1
GOSUB anleitung

anfang:
nr = 9: GOSUB mlinks1
COLOR 35: LOCATE 13, 3: PRINT "PUNKTE:"
COLOR 255: LOCATE 23, 2: PRINT na$
IF nl > 0 THEN PUT (9, 135), anz(1, 1)
IF nl > 1 THEN PUT (30, 135), anz(1, 1)
IF nl > 2 THEN PUT (51, 135), anz(1, 1)
IF nl = 0 THEN GOTO ende
LINE (85, 0)-(319, 199), 0, BF                      'rechter Bildschirm sauber
sy% = 150: sx% = 150: e% = 800: dv% = 5: lw% = 1  'Anfangsvariablen
GOSUB init                                          'Anfangswerte Sterne
GOSUB metinit
DEF SEG = &H40                                      'BIOS Datensegment einstellen
tastaturstatus% = PEEK(&H17)                        'Tastaturstatus einlesen
LINE (10, 18)-(74, 23), 34, BF                      'Energie-Kasten

FOR d = 10 TO 150                                   'Schiff einfÅhren
 PUT (sx%, d), ship(1, 2), PSET
NEXT d


start:
GOSUB akku
LINE (e% / 11 + 2, 18)-(e% / 11 + 2, 23), 0   'Energie-Balken
FOR dummy = 1 TO dv%: NEXT                    'Verzîgerung
s = s + 1
ms% = ms% + 1                                 'Globaler ZÑhler
GOSUB weiter
IF s = 10 THEN s = 1
IF ms% = 10 THEN m1% = 1
IF ms% = 26 THEN m2% = 1
IF ms% = 30 THEN m3% = 1
IF ms% = 40 THEN ms% = 1
IF m1% = 1 THEN m% = 1: GOSUB metput
IF m2% = 1 THEN m% = 2: GOSUB metput
IF m3% = 1 THEN m% = 3: GOSUB metput
GOSUB script
tv% = PEEK(&H17)
e% = e% + 1                                   'Energie auffÅllen
SELECT CASE tv%
    CASE IS = tastaturstatus% + 1             'rechte Shift - Taste
       IF sx% < 265 THEN
           sx% = sx% + 2: lp% = 13
           PUT (sx%, sy%), ship(1, 3), PSET
        END IF

       CASE IS = tastaturstatus% + 2           'linke Shift - Taste
        IF sx% > 85 THEN
           sx% = sx% - 2: lp% = 11
           PUT (sx%, sy%), ship(1, 1), PSET
        END IF

       CASE IS = tastaturstatus%               'nix (geradeaus)
        IF sx% > 84 AND sx% < 266 THEN
           sx% = sx%: lp% = 7
           PUT (sx%, sy%), ship(1, 2), PSET
        END IF

       CASE IS = tastaturstatus% + 8           'nix & Alt (Laser)
            IF e% > 100 THEN
                 GOSUB laser
            END IF

       CASE IS = tastaturstatus% + 10          'links und Laser
        IF sx% > 85 THEN
           sx% = sx% - 2: lp% = 11: GOSUB laser
           PUT (sx%, sy%), ship(1, 1), PSET
        END IF

       CASE IS = tastaturstatus% + 9           'rechts & Laser
        IF sx% < 265 THEN
           sx% = sx% + 2: lp% = 13: GOSUB laser
           PUT (sx%, sy%), ship(1, 3), PSET
        END IF
      
       CASE IS = tastaturstatus% + 4             'Test
            GOSUB geschafft
      
END SELECT

IF e% > 799 THEN e% = 800                      'Energie- Maximum
GOTO start

REM Abflug ------------------------------------------------
ende:
nr = 8: GOSUB mlinks1
GOSUB mf1
GOSUB auswertung
WHILE INKEY$ <> CHR$(27)
WEND
GOSUB mf2

LOCATE 5, 15: PRINT "Nocheinmal spielen (j/n)"
LOCATE 6, 20: INPUT jn$
IF jn$ = "j" THEN nl = 3: pu% = 0: GOTO anfang
GOSUB mfzu
SLEEP 1
CLS
END

geschafft:
FOR makt% = 1 TO 3
GOSUB weg
NEXT
FOR d = 150 TO -45 STEP -1
IF d > 0 THEN PUT (sx%, d), ship(1, 2), PSET:  ELSE LINE (sx%, d)-STEP(50, 50), 0, BF
mfz% = INT(RND * 6) + 1
IF d < 130 THEN PUT (sx% + 14, d + 45), met(1, 31 + mfz%), PSET
GOSUB weiter
FOR tem = 1 TO d * 2: NEXT
NEXT d
LINE (sx% + 14, d + 45)-STEP(20, 20), 0, BF
RETURN

weiter:
FOR g% = 1 TO 15
 IF POINT(ax(g%), ay(g%) + 1) = 0 OR POINT(ax(g%), ay(g%) + 1) = 227 THEN PSET (ax(g%), ay(g%)), 0
   ay(g%) = ay(g%) + ayc(g%)
  IF ay(g%) > 198 THEN GOSUB neu
 IF POINT(ax(g%), ay(g%) + 1) = 0 THEN PSET (ax(g%), ay(g%)), 227
NEXT
RETURN

init:
 FOR g% = 1 TO 15
  GOSUB neu
 NEXT
RETURN

metinit:
 FOR makt% = 1 TO 3
  GOSUB metneu
 NEXT
RETURN

neu:
   ax(g%) = 88 + INT(RND * 209)
   ay(g%) = 0
   ayc(g%) = 2 + INT(RND * 4)
RETURN

metneu:
   RANDOMIZE TIMER
   mx%(makt%) = 90 + INT(RND * 200)
   my%(makt%) = 0
   mzu%(makt%) = INT(RND * 3)
   mno%(makt%) = 1 + 10 * mzu%(makt%)
RETURN

REM Meteoriten setzen _________________________________________

metput:
my%(m%) = my%(m%) + 1
IF POINT(mx%(m%) + 7, my%(m%) + 16) = 0 AND my%(m%) < 181 THEN
      IF m% = 1 THEN PUT (mx%(1), my%(1)), met(1, mno%(1) + s), PSET: lasty1 = my%(1)
      IF m% = 2 THEN PUT (mx%(2), my%(2)), met(1, mno%(2) + s), PSET: lasty2 = my%(2)
      IF m% = 3 THEN PUT (mx%(3), my%(3)), met(1, mno%(3) + s), PSET: lasty3 = my%(3)
    ELSE makt% = m%: GOSUB weg
END IF
GOSUB test
RETURN


REM Laser -------------------------------------------------
laser:
        e% = e% - 5
       IF e% < 100 THEN e% = 100: RETURN
       IF lp% = 7 THEN lr% = 34
       IF lp% = 11 OR lp% = 13 THEN lr% = 23
        FOR ls1% = sy% + 3 TO 10 STEP -1
        lal% = POINT(sx% + lp%, ls1% - 1)
        PSET (sx% + lp%, ls1%), 34
        IF lal% <> 0 THEN GOSUB linkstreffer
        NEXT
        mfz% = INT(RND * 4) + 1
        IF e% > 100 THEN PUT (sx% + lp% - 4, 159), mf(1, mfz%), PSET
        FOR ls2% = sy% + 3 TO 10 STEP -1
        lar% = POINT(sx% + lp% + lr%, ls2% - 1)
        PSET (sx% + lp% + lr%, ls2%), 255
        IF lar% <> 0 THEN GOSUB rechtstreffer
        NEXT
        IF e% > 100 THEN PUT (sx% + lp% - 4 + lr%, 159), mf(1, mfz%), PSET
        LINE (sx% + lp% + lr%, 3)-(sx% + lp% + lr%, sy% + 8), 0
        LINE (sx% + lp%, 3)-(sx% + lp%, sy% + 8), 0
RETURN

akku:
IF e% < 800 THEN LINE (e% / 11 + 1, 18)-(e% / 11 + 1, 23), 34
RETURN

linkstreffer:
IF lal% = 227 THEN RETURN
gz% = 0
GOSUB ident
ls1% = 3
RETURN

rechtstreffer:
IF lar% = 227 THEN RETURN
gz% = lr%
GOSUB ident
ls2% = 3
RETURN

ident:
mmax% = 15
FOR iv% = 0 TO -mmax% STEP -1
IF sx% + lp% + gz% + iv% = mx%(1) THEN mmax% = 14: makt% = 1: GOSUB explo
IF sx% + lp% + gz% + iv% = mx%(2) THEN mmax% = 14: makt% = 2: GOSUB explo
IF sx% + lp% + gz% + iv% = mx%(3) THEN mmax% = 14: makt% = 3: GOSUB explo
NEXT
RETURN

explo:
pu% = pu% + 1
IF makt% = 1 AND my%(1) > 1 THEN mno%(1) = 31
IF makt% = 2 AND my%(2) > 1 THEN mno%(2) = 31
IF makt% = 3 AND my%(3) > 1 THEN mno%(3) = 31
GOSUB weiter
GOSUB metput
RETURN

script:
LOCATE 14, 2: PRINT pu%
RETURN

weg:
LINE (mx%(makt%), my%(makt%))-STEP(18, 17), 0, BF: GOSUB metneu
RETURN

test:
IF POINT(sx% + 2, 175) <> 0 AND POINT(sx% + 2, 175) <> 227 THEN GOTO schrott
IF POINT(sx% + 11, 157) <> 0 AND POINT(sx% + 11, 157) <> 227 THEN GOTO schrott
IF POINT(sx% + 23, 150) <> 0 AND POINT(sx% + 23, 150) <> 227 THEN GOTO schrott
IF POINT(sx% + 36, 157) <> 0 AND POINT(sx% + 36, 157) <> 227 THEN GOTO schrott
IF POINT(sx% + 45, 175) <> 0 AND POINT(sx% + 45, 175) <> 227 THEN GOTO schrott
RETURN

anleitung:
GOSUB mf1
te$(1) = "      ANLEITUNG       "
te$(2) = "      ---------       "
te$(3) = " Du hast die Aufgabe, "
te$(4) = " diesen Raumsektor von"
te$(5) = " Gefahren (Meteoriten)"
te$(6) = "         zu befreien !"
te$(7) = "______________________"
te$(8) = "                      "
te$(9) = "      STEUERUNG       "
te$(10) = "                      "
te$(11) = "L-SHIFT      => links "
te$(12) = "R-SHIFT      => rechts"
te$(13) = "ALT          => Laser "
te$(14) = "                      "
te$(15) = "               <ENTER>"
FOR zeile = 1 TO 15
FOR spalte = 1 TO 22
COLOR 34
LOCATE 8 + zeile, 15: PRINT LEFT$(te$(zeile), spalte)
IF spalte < 22 THEN COLOR 255: LOCATE 8 + zeile, spalte + 14: PRINT "˛"
FOR du = 1 TO 150: NEXT
NEXT spalte
NEXT zeile

WHILE INKEY$ = ""
WEND
GOSUB mf2

LOCATE 5, 15: PRINT "Name (max. 7 Zeichen):"
COLOR 255: LOCATE 6, 20: INPUT na$
IF LEN(na$) > 8 THEN na$ = LEFT$(na$, 7) + "."
IF LEN(na$) < 1 THEN na$ = " - ?? -"
GOSUB mfzu
RETURN

REM MenÅfenster 1 -----------------------------------------
mf1:
FOR ka = 0 TO 11
PUT (146, ka), disp(1, 1), PSET
PUT (251, ka), disp(1, 1), PSET
PUT (90, ka + 22), disp(1, 2), PSET
FOR br = 96 TO 280 STEP 35
PUT (br, ka + 22), disp(1, 6), PSET
NEXT br
PUT (309, ka + 22), disp(1, 4), PSET
PUT (90, ka + 37), disp(1, 3), PSET
FOR br = 96 TO 280 STEP 35
PUT (br, ka + 42), disp(1, 7), PSET
NEXT br
PUT (309, ka + 37), disp(1, 5), PSET
NEXT ka
FOR auf = 1 TO 137
PUT (90, ka + 37 + auf), disp(1, 3), PSET
FOR br = 96 TO 280 STEP 35
PUT (br, ka + 42 + auf), disp(1, 7), PSET
NEXT br
PUT (309, ka + 37 + auf), disp(1, 5), PSET
NEXT auf
RETURN

REM MenÅfenster klein -------------------------------------
mf2:
FOR zu = 186 TO 45 STEP -1
PUT (90, zu), disp(1, 3), PSET
FOR br = 96 TO 280 STEP 35
PUT (br, zu + 5), disp(1, 7), PSET
NEXT br
PUT (309, zu), disp(1, 5), PSET
NEXT zu
FOR ka = 11 TO 0 STEP -1
PUT (146, ka), disp(1, 1), PSET
PUT (251, ka), disp(1, 1), PSET
PUT (90, ka + 22), disp(1, 2), PSET
FOR br = 96 TO 280 STEP 35
PUT (br, ka + 22), disp(1, 6), PSET
NEXT br
PUT (309, ka + 22), disp(1, 4), PSET
NEXT
RETURN

REM MenÅfenster 2 zu --------------------------------------
mfzu:
FOR ka = 21 TO 0 STEP -1
PUT (90, ka), disp(1, 2), PSET
FOR br = 96 TO 280 STEP 35
PUT (br, ka), disp(1, 6), PSET
NEXT br
PUT (309, ka), disp(1, 4), PSET
NEXT
FOR ka = 45 TO 0 STEP -1
PUT (90, ka), disp(1, 3), PSET
FOR br = 96 TO 280 STEP 35
PUT (br, ka + 5), disp(1, 7), PSET
NEXT br
PUT (309, ka), disp(1, 5), PSET
NEXT ka
LINE (85, 0)-(319, 12), 0, BF
RETURN

REM MenÅklappen links -------------------------------------
mlinks1:
zu = 17
FOR br = 7 TO 71
PUT (br, zu), disp(1, nr), PSET
NEXT br

FOR zu = 94 TO 107
FOR br = 7 TO 66
PUT (br, zu), disp(1, nr), PSET
NEXT br
NEXT zu

FOR zu = 133 TO 154
FOR br = 7 TO 66
PUT (br, zu), disp(1, nr), PSET
NEXT br
NEXT zu

FOR zu = 174 TO 178
FOR br = 7 TO 66
PUT (br, zu), disp(1, nr), PSET
NEXT br
NEXT zu
RETURN

REM Schrott und Rettungskapsel ------------------------------------
schrott:
nl = nl - 1
PUT (7, 94), anz(1, 2), PSET
FOR makt% = 1 TO 3
GOSUB weg
NEXT
FOR d = 150 TO -25 STEP -1
IF d > 0 THEN PUT (sx% + 8, 165), ship(1, 5), PSET
IF d > 0 THEN PUT (sx% + 12, d), ship(1, 4), PSET:   ELSE LINE (sx%, d)-STEP(50, 50), 0, BF
mfz% = INT(RND * 4) + 1
IF d < 140 THEN PUT (sx% + 10, d + 26), mf(1, mfz%), PSET
IF d < 140 THEN PUT (sx% + 30, d + 26), mf(1, mfz%), PSET
GOSUB weiter
FOR tem = 1 TO d * 2: NEXT
NEXT d
LINE (sx% + 4, 0)-STEP(40, 10), 0, BF
GOTO anfang

auswertung:
COLOR 34: LOCATE 10, 15: PRINT "Captain "; na$; " !"
COLOR 255: LOCATE 12, 15: PRINT "Du hast "; pu%;
LOCATE 13, 15: PRINT "Punkte erreicht !"
IF pu% < 100 THEN COLOR 34: LOCATE 18, 15: PRINT "Das ist sehr schlecht !"
IF pu% > 99 AND pu% < 300 THEN COLOR 34: LOCATE 18, 15: PRINT "Das ist schlecht !"
IF pu% > 299 AND pu% < 500 THEN COLOR 34: LOCATE 18, 15: PRINT "Das ist schon besser !"
IF pu% > 499 AND pu% < 800 THEN COLOR 34: LOCATE 18, 15: PRINT "Das ist gut !"
IF pu% > 799 AND pu% < 1300 THEN COLOR 34: LOCATE 18, 15: PRINT "Das ist sehr gut !"
IF pu% > 1299 THEN COLOR 34: LOCATE 18, 15: PRINT "Das ist Spitzenklasse !"
COLOR 255: LOCATE 22, 20: PRINT "Bitte >ESC< drÅcken"

RETURN

