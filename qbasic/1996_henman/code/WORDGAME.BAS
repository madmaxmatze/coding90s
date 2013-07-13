REM Wordgame-------------------------------------------------
DECLARE SUB Mensch (Fehler%, Punkte%, Nr)
DECLARE SUB BildschirmSetup ()
DECLARE SUB PunktePlus (Punkte%)
DECLARE SUB Ende (Punkte%)
SCREEN 12
CLS

REM Start -------------------------------------------------
CALL BildschirmSetup

Fehler% = 0
Punkte% = 0
LOCATE 1, 35: PRINT "Mal"
LOCATE 1, 1: INPUT "Wie oft m”chten Sie Spielen "; Ant%
LOCATE 1, 1: PRINT "                                                          "
LOCATE 15, 1: PRINT "Punkte :"; Punkte%
LOCATE 6, 1: PRINT "ษอออออออออออออออออป"
LOCATE 7, 1: PRINT "บ                 บ"
LOCATE 8, 1: PRINT "ศอออออออออออออออออผ"
 
COLOR 14: LOCATE 28, 17: PRINT "Drcken Sie q wenn Sie beenden wollen !!!"
COLOR 15

OPEN "WOERTER.DAT" FOR INPUT AS #1    'Datei ”ffnen

FOR Spiele = 1 TO Ant%
LOCATE 16, 1: PRINT "Durchlauf"; Spiele
SEEK #1, 1                              'Stelle 1 in Datei
RANDOMIZE TIMER
Nr = INT(RND * 216 + 1)
FOR a = 1 TO Nr - 1
   INPUT #1, a2$, a3$                  'Daten lesen
NEXT a

   INPUT #1, Wort1$, Wort2$            'Ausgesuchten Datensatz einlesen
  LOCATE 3, 5: PRINT "Englisches Wort: "; Wort1$           'und auf Bildschirmausgeben
  LOCATE 5, 2.5: PRINT "Bitte Deutsches Wort eingeben !!!"
  LOCATE 7, 2.5: LINE INPUT Deutsch$
 IF Deutsch$ = "q" THEN CALL Ende(Punkte%)
 IF Deutsch$ = Wort2$ THEN LOCATE 2, 53: PRINT "Richtig !!!": CALL PunktePlus(Punkte%)
 IF NOT Deutsch$ = Wort2$ THEN LOCATE 1, 19: PRINT "Das richtige Wort whre "; Wort2$; " gewesen !!!": Fehler% = Fehler% + 1: CALL Mensch(Fehler%, Punkte%, Nr)
NEXT Spiele

CALL Ende(Punkte%)

CLOSE
END

SUB BildschirmSetup
LINE (304, 54)-(614, 414), 8, BF       'Hintergrund
LINE (296, 46)-(604, 404), 14, B       'Rahmen
LINE (300, 50)-(600, 400), 11, BF      'Himmel
LINE (300, 350)-(600, 400), 2, BF      'Rasen
REM Sonne malen -------------------------------------------
CIRCLE (575, 75), 10, 14               'Sonne zeichnen
PAINT (575, 75), 14, 14                'Sonne ausmalen
FOR Strahlen = 0 TO 6.28 STEP .628     'Strahlen zeichnen
 LINE (575, 75)-STEP(20 * SIN(Strahlen), 20 * COS(Strahlen)), 14
NEXT Strahlen
END SUB

SUB Ende (Punkte%)
LOCATE 27, 27: PRINT "Sie haben "; Punkte%; " erreicht !!!"
LOCATE 28, 7: INPUT "         M”chten Sie noch einmal Spielen ja/nein ?"; jn$
IF jn$ = "j" THEN RUN
IF jn$ = "n" THEN END
IF NOT jn$ = "j" OR n THEN END
SLEEP
CLOSE
SYSTEM
END
END SUB

SUB Mensch (Fehler%, Punkte%, Nr)
IF Fehler% = 1 THEN GOTO galgen
IF Fehler% = 2 THEN GOTO galgen1
IF Fehler% = 3 THEN GOTO Seil
IF Fehler% = 4 THEN GOTO strick
IF Fehler% = 5 THEN GOTO koerper
IF Fehler% = 0 THEN EXIT SUB

REM Galgen ------------------------------------------------
galgen:
LINE (350, 100)-STEP(25, 270), 6, BF
LINE (340, 100)-STEP(180, 25), 6, BF
SLEEP 3
LOCATE 1, 19: PRINT "                                                "
LOCATE 15, 1: PRINT "Punkte :"; Punkte%
LOCATE 3, 5: PRINT "                                 "
LOCATE 7, 2.5: PRINT "                                   "
LOCATE 6, 1: PRINT "ษอออออออออออออออออป"
LOCATE 7, 1: PRINT "บ                 บ"
LOCATE 8, 1: PRINT "ศอออออออออออออออออผ"
EXIT SUB

galgen1:
FOR z = 1 TO 20
LINE (355 + z, 170)-STEP(50, -50), 6
NEXT z
FOR z = 1 TO 20
LINE (310 + z, 380)-STEP(40, -40), 6
NEXT z
FOR z = 1 TO 20
LINE (355 + z, 340)-STEP(40, 40), 6
NEXT z
SLEEP 3
LOCATE 1, 19: PRINT "                                                "
LOCATE 15, 1: PRINT "Punkte :"; Punkte%
LOCATE 3, 5: PRINT "                                 "
LOCATE 7, 2.5: PRINT "                                   "
LOCATE 6, 1: PRINT "ษอออออออออออออออออป"
LOCATE 7, 1: PRINT "บ                 บ"
LOCATE 8, 1: PRINT "ศอออออออออออออออออผ"
EXIT SUB

REM Seil --------------------------------------------------
Seil:
FOR z = 1 TO 50 STEP 2
CIRCLE (505, 128 + z), 4, 7
NEXT z
SLEEP 3
LOCATE 1, 19: PRINT "                                                "
LOCATE 15, 1: PRINT "Punkte :"; Punkte%
LOCATE 3, 5: PRINT "                           "
LOCATE 7, 2.5: PRINT "                "
LOCATE 6, 1: PRINT "ษอออออออออออออออออป"
LOCATE 7, 1: PRINT "บ                 บ"
LOCATE 8, 1: PRINT "ศอออออออออออออออออผ"
EXIT SUB

strick:
CIRCLE (505, 195 + z), 15, 7
SLEEP 3
LOCATE 1, 19: PRINT "                                                           "
LOCATE 15, 1: PRINT "Punkte :"; Punkte%
LOCATE 3, 5: PRINT "                             "
LOCATE 7, 2.5: PRINT "                                   "
LOCATE 6, 1: PRINT "ษอออออออออออออออออป"
LOCATE 7, 1: PRINT "บ                 บ"
LOCATE 8, 1: PRINT "ศอออออออออออออออออผ"
EXIT SUB

REM K”rper ------------------------------------------------
koerper:
CIRCLE (502, 187 + z), 13, 12
PAINT (502, 187), 12, 12
FOR z = 1 TO 8
LINE (502 + z, 198)-STEP(2, 10), 12
NEXT z
CIRCLE (498, 185), 2, 2
PAINT (498, 185), 2, 2
CIRCLE (504, 185), 2, 2
PAINT (504, 185), 2, 2
CIRCLE (501, 190), 2, 0
PAINT (501, 190), 0, 0
FOR z = 1 TO 40
CIRCLE (511, 227 + z), 20, 12
NEXT z

FOR z = 1 TO 8                     ' linker Arm
LINE (470 + z, 249)-STEP(20, -30), 12
NEXT z

FOR z = 1 TO 8                    ' rechter Arm
LINE (520 + z, 218)-STEP(20, 30), 12
NEXT z

FOR z = 1 TO 8                      ' linkes Bein
LINE (470 + z, 307)-STEP(20, -30), 12
NEXT z

FOR z = 1 TO 8                      ' rechtes Bein
LINE (520 + z, 280)-STEP(20, 30), 12
NEXT z
LOCATE 6, 1: PRINT "ษอออออออออออออออออป"
LOCATE 7, 1: PRINT "บ                 บ"
LOCATE 8, 1: PRINT "ศอออออออออออออออออผ"

PLAY "mb o2 l5 f. f. l7 f l5f. a- g g f f e f."

CALL Ende(Punkte%)

END SUB

SUB PunktePlus (Punkte%)
Punkte% = Punkte% + 20
LOCATE 15, 1: PRINT "Punkte :"; Punkte%
LOCATE 3, 5: PRINT "      ^                     "
LOCATE 7, 2.5: PRINT "               "
LOCATE 6, 1: PRINT "ษอออออออออออออออออป"
LOCATE 7, 1: PRINT "บ                 บ"
LOCATE 8, 1: PRINT "ศอออออออออออออออออผ"

 Musik$ = "MBT180o2P2P8L8GGGL2E-P24P8L8FFFL2D"
 PLAY Musik$
 WHILE PLAY(0) > 5: WEND
LOCATE 2, 53: PRINT "           "
END SUB

