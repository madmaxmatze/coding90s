 REM Mathias-------------------------------------------------
DIM SHARED sprites(1 TO 606, 1 TO 11) AS INTEGER
DEF SEG = VARSEG(sprites(1, 1))
BLOAD "c:\qbasic\Lutscher\f1.spr", VARPTR(sprites(1, 1))        'Figur1
DEF SEG = VARSEG(sprites(1, 2))
BLOAD "c:\qbasic\Lutscher\f2.spr", VARPTR(sprites(1, 2))        'Figur2
DEF SEG = VARSEG(sprites(1, 3))
BLOAD "c:\qbasic\Lutscher\f1s.spr", VARPTR(sprites(1, 3))        'Figur1 gespiegelt
DEF SEG = VARSEG(sprites(1, 4))
BLOAD "c:\qbasic\Lutscher\f2s.spr", VARPTR(sprites(1, 4))        'Figur2 gespiegelt
DEF SEG = VARSEG(sprites(1, 6))
BLOAD "c:\qbasic\Lutscher\lecker.spr", VARPTR(sprites(1, 6))        'gut 1
DEF SEG = VARSEG(sprites(1, 7))
BLOAD "c:\qbasic\Lutscher\bîse.spr", VARPTR(sprites(1, 7))        'bîse
DEF SEG = VARSEG(sprites(1, 8))
BLOAD "c:\qbasic\Lutscher\ff1.spr", VARPTR(sprites(1, 8))        'F1
DEF SEG = VARSEG(sprites(1, 9))
BLOAD "c:\qbasic\Lutscher\esc.spr", VARPTR(sprites(1, 9))        'esc

DEF SEG

SCREEN 7

REM Sterne--------------------------------------------------
DIM SHARED ax(1 TO 18) AS INTEGER
DIM SHARED ay(1 TO 18) AS INTEGER
DIM SHARED ayc(1 TO 18) AS INTEGER
DIM SHARED f(1 TO 18) AS INTEGER

REM Bildschirm----------------------------------------------
SCREEN 13
GOSUB rand
GOSUB init

REM Start---------------------------------------------------
ss:
GOSUB qq
GOSUB rand
GOSUB dummy
IF INKEY$ <> "" THEN GOSUB anleit
GOTO ss

qq:
FOR g% = 1 TO 18
 IF g% < 16 THEN PSET (ax(g%), ay(g%)), 0
  ay(g%) = ay(g%) + ayc(g%)
  IF ay(g%) > 198 THEN GOSUB neu
 IF g% < 16 THEN PSET (ax(g%), ay(g%)), f(g%)
NEXT
RETURN

init:
FOR g% = 1 TO 18
 GOSUB neu
NEXT
RETURN

neu:
 ax(g%) = 1 + INT(RND * 339)
 ay(g%) = 2
 ayc(g%) = 1 + INT(RND * 4)
 IF ayc(g%) = 4 THEN f(g%) = 14
 IF ayc(g%) > 3 AND ayc(g%) > 4 THEN f(g%) = 1
 IF ayc(g%) > 4 THEN f(g%) = 15

 RETURN
dummy:
FOR t = 1 TO 13: NEXT
RETURN

rand:
LOCATE 12, 8
COLOR 9: PRINT "Der kleine Lutscher-fresser"
RETURN
anleit:
SCREEN 7
PUT (230, 135), sprites(1, 3), PSET      'gut
PUT (6, 155), sprites(1, 7), PSET        'bîse
PUT (117, 148), sprites(1, 8), PSET     'ff1
LINE (40, 186)-(290, 173), 14, B
LOCATE 23, 7: PRINT "DrÅcken Sie"
LOCATE 23, 21: PRINT "um fortzufahren!"
LINE (295, 5)-(5, 195), 13, B
PUT (255, 10), sprites(1, 6), PSET        'lecker
COLOR 13
LOCATE 3, 11
PRINT "---- Anleitung ----"

COLOR 3
LOCATE 5, 6
PRINT "Der kleine Lutscherfresser"
LOCATE 7, 6
PRINT "darf die Monster nicht"
LOCATE 9, 6
PRINT "berÅhren, sonst verliert er"
LOCATE 11, 6
PRINT "eines seiner fÅnf Leben.Der"
LOCATE 13, 6
PRINT "gelbe Rand der SpielflÑche"
LOCATE 15, 6
PRINT "ist auch eine Gefahr fÅr ihn."
LOCATE 17, 6
PRINT "Die Lutscher jedoch sollte man"
LOCATE 19, 6
PRINT "fressen,indem man ihnen"
LOCATE 21, 7
PRINT "entgegen lÑuft."
SLEEP
COLOR 15
br = 2: bx = 2: nl = 5
CLS
REM Bildschirm----------------------------------------------
LINE (30, 0)-(40, 199), 9, BF
LINE (50, 0)-(40, 199), 1, BF
LINE (270, 0)-(280, 199), 1, BF
LINE (280, 0)-(290, 199), 9, BF
LINE (11, 11)-(308, 149), 0, BF
LINE (10, 10)-(309, 150), 14, B

GOSUB namefrage
COLOR 15
LOCATE 22, 10: PRINT "Punkte:"
LOCATE 22, 23: PRINT "Leben:"
LOCATE 21, 12: PRINT "Spieler: "; na$
IF na$ = "" THEN LOCATE 21, 21: PRINT "Unbekannt"
LOCATE 23, 8: PRINT "F7 = Ansicht der Funktionen"
LINE (270, 160)-(279, 199), 1, BF

REM Startposition-------------------------------------------
start:
s1 = 1: s2 = 1: s3 = 1: g1 = 18: g2 = 18: g3 = 18
x = 150: y = 50: j = 1: k = 0: L = 0: gl = 18: a$ = ""
GOSUB gegner1
nicht:
LINE (285, 103)-(20, 140), 0, BF
unbekannt:
anfang:
COLOR 15
REM  Bewegung ----------------------------------------------
ON KEY(1) GOSUB Hilfe
ON KEY(2) GOSUB speichern
ON KEY(3) GOSUB laden
ON KEY(4) GOSUB lichtaus
ON KEY(5) GOSUB lichtan
ON KEY(6) GOSUB Info
ON KEY(7) GOSUB funktion
KEY(1) ON: KEY(2) ON: KEY(3) ON: KEY(4) ON: KEY(5) ON: KEY(6) ON: KEY(7) ON
a$ = INKEY$
 IF a$ = "q" THEN GOSUB ende
 IF a$ = "p" THEN GOSUB pause
 IF a$ = (CHR$(0) + "M") THEN j = 1: k = 2: L = 0
 IF a$ = (CHR$(0) + "K") THEN j = 3: k = -2: L = 0
 IF a$ = (CHR$(0) + "H") THEN j = 1: k = 0: L = -2
 IF a$ = (CHR$(0) + "P") THEN j = 3: k = 0: L = 2
REM Grenzen ------------------------------------------------
 IF x < 15 THEN x = 15: GOSUB aus
 IF x > 263 THEN x = 263: GOSUB aus
 IF y < 15 THEN y = 15: GOSUB aus
 IF y > 105 THEN y = 105: GOSUB aus

REM START --------------------------------------------------
   x = x + k
   y = y + L
 GOSUB kolli
 PUT (x, y), sprites(1, j), PSET
 PUT (x + k, y + L), sprites(1, j + 1), PSET
 FOR eeee = 1 TO 500: NEXT eeee
 GOSUB weiter
 LOCATE 22, 17: PRINT pu
 LOCATE 22, 29: PRINT nl
GOTO anfang
                                              
REM Rausschmei·en-------------------------------------------
aus:
nl = nl - 1
FOR p = 1 TO 10
PUT (x, y), sprites(1, 1), PSET
FOR no = 1 TO 1: NEXT
PUT (x, y), sprites(1, 2), PSET
FOR no = 1 TO 1: NEXT
NEXT

REM VORHANG ------------------------------------------------
FOR v = 11 TO 80
LINE (11, v)-(308, v), 4
LINE (11, 160 - v)-(308, 160 - v), 4
FOR a = 1 TO 12: NEXT
SOUND (v * 2) * 50, .1
NEXT v
FOR v = 80 TO 11 STEP -1
LINE (11, v)-(308, v), 0
LINE (11, 160 - v)-(308, 160 - v), 0
FOR a = 1 TO 12: NEXT
SOUND (v * 2) * 60, .1
NEXT v
IF nl > 0 THEN GOTO start
IF nl = 0 THEN GOTO goodbye

REM Gegner--------------------------------------------------
gegner1:
RANDOMIZE TIMER
w1 = 6 + INT(RND * 2)
y1 = 11 + INT(RND * 85)
RETURN

gegner2:
RANDOMIZE TIMER
w2 = 7
y2 = 11 + INT(RND * 85)
RETURN

gegner3:
RANDOMIZE TIMER
w3 = 6 + INT(RND * 2)
y3 = 11 + INT(RND * 85)
RETURN

REM Weiter--------------------------------------------------
weiter:
gl = gl + 1
IF gl > 18 THEN g1 = g1 + 1
IF g1 > 265 THEN GOSUB gegweg: GOSUB gegner1
IF gl = 98 THEN GOSUB gegner2

IF gl > 108 THEN g2 = g2 + 1
IF g2 > 265 THEN GOSUB gegweg: GOSUB gegner2
IF gl = 178 THEN GOSUB gegner3

IF gl > 188 THEN g3 = g3 + 1
IF g3 > 265 THEN GOSUB gegweg: GOSUB gegner3
GOSUB spr
RETURN

REM Gegner weg ---------------------------------------------
gegweg:
pu = pu + 1
IF g1 > 263 THEN LINE (g1, y1)-(g1 + 40, y1 + 40), 0, BF: g1 = 18: s1 = 1
IF g2 > 263 THEN LINE (g2, y2)-(g2 + 40, y2 + 40), 0, BF: g2 = 18: s2 = 1
IF g3 > 263 THEN LINE (g3, y3)-(g3 + 40, y3 + 40), 0, BF: g3 = 18: s3 = 1
RETURN

REM Sprite--------------------------------------------------
spr:
IF s1 = 1 AND g1 > 20 THEN PUT (g1, y1), sprites(1, w1), PSET
IF s2 = 1 AND g2 > 20 THEN PUT (g2, y2), sprites(1, w2), PSET
IF s3 = 1 AND g3 > 20 THEN PUT (g3, y3), sprites(1, w3), PSET
RETURN

REM Kollison------------------------------------------------
kolli:
FOR ko = 10 TO 30 STEP 5
IF POINT(x + 40, y + ko + L) <> 0 THEN GOSUB wer
IF POINT(x - 1, y + ko + L) <> 0 THEN GOSUB wer
NEXT ko
RETURN

REM welcher sprite ?----------------------------------------
wer:
g = 0
IF g1 > x - 40 AND g1 < x + 40 THEN g = w1: wo = 1
IF g2 > x - 40 AND g2 < x + 40 THEN g = w2: wo = 2
IF g3 > x - 40 AND g3 < x + 40 THEN g = w3: wo = 3
IF g = 7 THEN GOSUB aus
IF g = 6 THEN GOSUB zpunkt
RETURN

REM zusatzpunkt---------------------------------------------
zpunkt:
pu = pu + 40
IF wo = 1 THEN GOSUB fressen: s1 = 0
IF wo = 2 THEN GOSUB fressen: s2 = 0
IF wo = 3 THEN GOSUB fressen: s3 = 0
wo = 0
RETURN

REM fressen-------------------------------------------------
fressen:
IF wo = 1 THEN wf = g1: wy = y1
IF wo = 2 THEN wf = g2: wy = y2
IF wo = 3 THEN wf = g3: wy = y3
LINE (wf, wy)-(wf + 40, wy + 40), 0, BF
wf = 0: wy = 2
0
RETURN

REM Aufwiedersehen------------------------------------------
goodbye:
CLS
DO
COLOR 9
LOCATE 12, 16
PRINT "Game Over"
LINE (115, 80)-(200, 102), 1, B
FOR a = 1 TO 12: NEXT
LINE (115, 80)-(200, 102), 13, B
FOR a = 1 TO 12: NEXT
LOOP UNTIL INKEY$ <> ""
CLS
SCREEN 7
LINE (30, 0)-(40, 199), 9, BF
LINE (50, 0)-(40, 199), 1, BF
LINE (270, 0)-(280, 199), 1, BF
LINE (280, 0)-(290, 199), 9, BF
LINE (11, 11)-(308, 149), 0, BF
LINE (10, 10)-(309, 150), 14, B
PUT (195, 37), sprites(1, 3), PSET
PUT (35, 100), sprites(1, 6), PSET
PUT (189, 100), sprites(1, 7), PSET
LOCATE 3, 5: PRINT "Das waren"; pu; "Punkte."

LOCATE 5, 5
IF pu < 50 THEN COLOR 4: PRINT " Du bist 'ne absolute Null!": PLAY " bagfedc"
IF pu > 49 AND pu < 100 THEN COLOR 10: PRINT " Spiel lieber was andres!": PLAY "bfdecfg"
IF pu > 99 AND pu < 160 THEN COLOR 2: PRINT " Nicht schlecht fÅr'n Anfang! ": PLAY "geabcfgfd"
IF pu > 159 AND pu < 220 THEN COLOR 12: PRINT " Kannst du's noch besser? ": PLAY "gfeacbfdc"
IF pu > 219 AND pu < 300 THEN COLOR 2: PRINT " War ja ganz gut! ": PLAY "bdfgcd"
IF pu > 299 AND pu < 500 THEN COLOR 14: PRINT " Du bist ziemlich gut!! ": PLAY "gadcefgc"
IF pu > 499 AND pu < 800 THEN COLOR 14: PRINT " Mensch; das war super! ": PLAY "dfgcaec"
IF pu > 799 AND pu < 1300 THEN COLOR 14: PRINT "Du bist einfach spitze!! ": PLAY " cdff  fabb  aggfe  ddfedc "
IF pu > 1299 AND pu < 1500 THEN COLOR 14: PRINT "Das war meisterhaft!!! ": PLAY " ccddeec  eeffggc  bdfeac bdfeac "
IF pu > 1499 AND pu < 2300 THEN COLOR 14: PRINT "Du bist der absolute Champion!!! ": PLAY " ccddeec  ddeeffc ggdbd ddeedc "
IF pu > 2299 THEN COLOR 14: PRINT "Du wirst weltranglisten bester!!! ": PLAY " ccddeec  ddeeffc ggdd   bbd   aac  deff  deff  gabb  agf fedc  "

COLOR 14
LOCATE 11, 13: PRINT "GOODBYE"
LOCATE 12, 4:  PRINT " Wollen Sie noch einmal?"
LOCATE 13, 15:  PRINT "j/n"
LOCATE 13, 19: INPUT jn$
IF jn$ = "j" THEN CLS : RUN
IF jn$ = "n" THEN GOSUB bitte
namefrage:

REM Name----------------------------------------------------
LOCATE 5, 5: PRINT "Geben Sie bitte Ihren Namen ein !"
LOCATE 6, 5: INPUT na$

LOCATE 10, 10
IF na$ = "mathias" OR na$ = "Mathias" OR na$ = "" OR na$ = "stefan" OR na$ = "Stefan" THEN
   IF na$ = "" THEN PRINT "Hallo Analphabet!"
   IF na$ = "Mathias" THEN PRINT "     Hallo Chef!   "
   IF na$ = "mathias" THEN PRINT "     Hallo Chef!   "
   IF na$ = "Stefan" THEN PRINT "Raus aus dem Pogramm!"
   IF na$ = "stefan" THEN PRINT "Raus aus dem Pogramm!"
ELSE
   LOCATE 10, 17: PRINT "Hallo "; na$
END IF

SLEEP
LINE (11, 11)-(308, 149), 0, BF

RETURN

REM Ende----------------------------------------------------
ende:
LINE (281, 96)-(1, 136), 0, BF
COLOR 10: LOCATE 13, 12: PRINT " Wollen sie wirklich beenden j/n ?"
LINE (280, 97)-(0, 137), 14, B
LOCATE 16, 16: INPUT jn$
IF jn$ = "n" THEN RUN
IF jn$ = "j" THEN GOSUB bitte

REM Pause---------------------------------------------------
pause:
LINE (287, 97)-(24, 125), 0, BF
DO
LINE (288, 96)-(23, 126), 13, B
FOR a = 1 TO 2: NEXT
LINE (288, 96)-(23, 126), 1, B
FOR a = 1 TO 2: NEXT
COLOR 10: LOCATE 14, 7: PRINT "DrÅcken Sie eine beliebige"
COLOR 10: LOCATE 15, 7: PRINT "Taste um fortzufahren! "
LOOP UNTIL INKEY$ <> ""
LINE (288, 96)-(23, 126), 0, BF
GOTO unbekannt

REM Speichern----------------------------------------------
speichern:
LINE (251, 103)-(20, 133), 14, B
LINE (250, 104)-(21, 132), 0, BF
LOCATE 15, 6
PRINT "Wollen Sie"; pu
LOCATE 15, 20
PRINT "Punkte und"
LOCATE 16, 5
PRINT nl; "Leben speichern j\n"
LOCATE 16, 28: INPUT jn$
IF jn$ = "n" THEN GOSUB nicht
IF jn$ = "j" THEN GOSUB du
du:
LINE (251, 103)-(20, 133), 0, BF
OPEN "c:\qbasic\lutscher\save.gam" FOR OUTPUT AS #1
PRINT #1, pu
PRINT #1, nl
CLOSE #1
RETURN

REM Laden---------------------------------------------------
laden:
LINE (285, 103)-(20, 140), 14, B
LINE (284, 104)-(21, 139), 0, BF
LOCATE 15, 6
PRINT "Wollen Sie den zuletzt"
LOCATE 16, 6
PRINT "Gespeicherten Spielstend Laden"
LOCATE 17, 15: INPUT jn$
IF jn$ = "n" THEN GOSUB nicht
IF jn$ = "j" THEN GOSUB ich
ich:
LINE (285, 103)-(20, 140), 0, BF
OPEN "c:\qbasic\lutscher\save.gam" FOR INPUT AS #1
INPUT #1, pu
INPUT #1, nl
LOCATE 22, 17
PRINT pu
LOCATE 22, 29
PRINT nl
CLOSE #1
RETURN


REM Licht aus-----------------------------------------------
lichtaus:
CLS
LOCATE 22, 10: PRINT "Punkte:"
LOCATE 22, 23: PRINT "Leben:"
LOCATE 21, 12: PRINT "Spieler: "; na$
IF na$ = "" THEN LOCATE 21, 21: PRINT "Unbekannt"
LOCATE 23, 8: PRINT "F7 = Ansicht der Funktionen"
RETURN

REM Licht an------------------------------------------------
lichtan:
LINE (30, 0)-(40, 199), 9, BF
LINE (50, 0)-(40, 199), 1, BF
LINE (270, 0)-(280, 199), 1, BF
LINE (280, 0)-(290, 199), 9, BF
LINE (11, 11)-(308, 149), 0, BF
LINE (10, 10)-(309, 150), 14, B
RETURN

REM Funktionen----------------------------------------------
funktion:
CLS
PUT (205, 105), sprites(1, 3), PSET
PUT (20, 95), sprites(1, 7), PSET        'bîse
PUT (113, 148), sprites(1, 9), PSET      'esc
PUT (225, 40), sprites(1, 6), PSET        'lecker
LINE (295, 10)-(20, 155), 13, B

LOCATE 4, 12: PRINT " P = Pause"
LOCATE 6, 12: PRINT " Q = Ende"
LOCATE 8, 12: PRINT "F1 = Hilfe"
LOCATE 10, 12: PRINT "F2 = Speichern"
LOCATE 12, 12: PRINT "F3 = Laden"
LOCATE 14, 12: PRINT "F4 = Licht an "
LOCATE 16, 12: PRINT "F5 = Licht aus"
LOCATE 18, 12: PRINT "F6 = Schareware-Info"
LINE (31, 190)-(282, 169), 13, B

COLOR 15
LOCATE 23, 6: PRINT "DrÅcken Sie"
LOCATE 23, 20: PRINT "um fortzufahren!"
SLEEP

CLS
LOCATE 22, 10: PRINT "Punkte:"
LOCATE 22, 23: PRINT "Leben:"
LOCATE 21, 12: PRINT "Spieler: "; na$
IF na$ = "" THEN LOCATE 21, 21: PRINT "Unbekannt"
LOCATE 23, 8: PRINT "F7 = Ansicht der Funktionen"

LINE (30, 0)-(40, 199), 9, BF
LINE (50, 0)-(40, 199), 1, BF
LINE (270, 0)-(280, 199), 1, BF
LINE (280, 0)-(290, 199), 9, BF
LINE (11, 11)-(308, 149), 0, BF
LINE (10, 10)-(309, 150), 14, B
RETURN

REM Hilfe-------------------------------------------------------
Hilfe:
CLS
SCREEN 7
PUT (230, 135), sprites(1, 3), PSET
PUT (6, 155), sprites(1, 7), PSET        'bîse
PUT (120, 148), sprites(1, 9), PSET      'esc
PUT (255, 10), sprites(1, 6), PSET        'lecker
LINE (295, 5)-(5, 195), 13, B

COLOR 13
LOCATE 3, 11
PRINT "---- Anleitung ----"

COLOR 3
LOCATE 5, 6
PRINT "Der kleine Lutscherfresser"
LOCATE 7, 6
PRINT "darf die Monster nicht"
LOCATE 9, 6
PRINT "berÅhren, sonst verliert er"
LOCATE 11, 6
PRINT "eines seiner fÅnf Leben.Der"
LOCATE 13, 6
PRINT "gelbe Rand der SpielflÑche"
LOCATE 15, 6
PRINT "ist auch eine Gefahr fÅr ihn."
LOCATE 17, 6
PRINT "Die Lutscher jedoch sollte man"
LOCATE 19, 6
PRINT "fressen,indem man ihnen"
LOCATE 21, 7
PRINT "entgegen lÑuft."
LINE (40, 186)-(290, 173), 14, B
COLOR 15
LOCATE 23, 7: PRINT "DrÅcken Sie"
LOCATE 23, 21: PRINT "um fortzufahren!"
SLEEP
CLS
LOCATE 22, 10: PRINT "Punkte:"
LOCATE 22, 23: PRINT "Leben:"
LOCATE 21, 12: PRINT "Spieler:"; na$
IF na$ = "" THEN LOCATE 21, 21: PRINT "Unbekannt"
LOCATE 23, 8: PRINT "F7 = Ansicht der Funktionen"

LINE (30, 0)-(40, 199), 9, BF
LINE (280, 0)-(290, 199), 9, BF
LINE (50, 0)-(40, 199), 1, BF
LINE (270, 0)-(280, 199), 1, BF
LINE (11, 11)-(308, 149), 0, BF
LINE (10, 10)-(309, 150), 14, B


RETURN

bitte:
CLS
SCREEN 12
END
Info:
CLS
SCREEN 7
COLOR 1
LOCATE 5, 13
PRINT "Entwickelt von "
LINE (40, 60)-(40, 127), 5
FOR a = 1 TO 150: NEXT
LINE (40, 127)-(60, 127), 5
FOR a = 1 TO 150: NEXT
LINE (40, 60)-(70, 60), 5
FOR a = 1 TO 150: NEXT
LINE (60, 80)-(60, 127), 5
FOR a = 1 TO 150: NEXT
LINE (60, 80)-(90, 110), 5
FOR a = 1 TO 150: NEXT
LINE (70, 60)-(90, 80), 5
FOR a = 1 TO 150: NEXT
LINE (90, 80)-(110, 60), 5
FOR a = 1 TO 150: NEXT
LINE (120, 80)-(90, 110), 5
FOR a = 1 TO 150: NEXT
LINE (120, 80)-(120, 127), 5
FOR a = 1 TO 150: NEXT
LINE (110, 60)-(140, 60), 5
FOR a = 1 TO 150: NEXT
LINE (140, 127)-(140, 60), 5
FOR a = 1 TO 150: NEXT
LINE (120, 127)-(140, 127), 5
PAINT (41, 81), 1, 5

COLOR 13
LOCATE 16, 19
PRINT "athias Nitzsche & Co."
PUT (113, 149), sprites(1, 9), PSET      'esc
COLOR 1
LOCATE 19, 3
PRINT "Dieses Spiel ist eine Shareware Version"

LINE (31, 190)-(282, 169), 13, B
COLOR 15
LOCATE 23, 6: PRINT "DrÅcken Sie"
LOCATE 23, 20: PRINT "um fortzufahren!"

SLEEP
CLS
LOCATE 22, 10: PRINT "Punkte:"
LOCATE 22, 23: PRINT "Leben:"
LOCATE 21, 12: PRINT "Spieler: "; na$
IF na$ = "" THEN LOCATE 21, 21: PRINT "Unbekannt"
LOCATE 23, 8: PRINT "F7 = Ansicht der Funktionen"

LINE (30, 0)-(40, 199), 9, BF
LINE (50, 0)-(40, 199), 1, BF
LINE (270, 0)-(280, 199), 1, BF
LINE (280, 0)-(290, 199), 9, BF
LINE (11, 11)-(308, 149), 0, BF
LINE (10, 10)-(309, 150), 14, B
RETURN

