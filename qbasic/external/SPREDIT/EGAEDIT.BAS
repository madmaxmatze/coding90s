DIM SHARED Matrix(0 TO 39, 0 TO 39) AS INTEGER
DIM SHARED tempo(1 TO 402) AS INTEGER
DIM SHARED Farbe AS INTEGER
DIM SHARED PX AS INTEGER
DIM SHARED PY AS INTEGER
DIM SHARED name$
DECLARE SUB Einrichten ()
DECLARE SUB Malen ()
DECLARE SUB MatrixSchreiben ()
DECLARE SUB Verschieben (x AS INTEGER, y AS INTEGER)
DECLARE SUB Drehen ()
DECLARE SUB Vertauschen ()
DECLARE SUB Hilfe ()
DECLARE FUNCTION Taste$ ()
DECLARE SUB Highlight (y%, x%, position%, laenge%, a$)
DECLARE SUB Laden ()
DECLARE SUB Speichern ()
DECLARE SUB Spiegeln ()
DECLARE SUB Ende ()
CALL Einrichten
CALL Malen

SUB Drehen
GET (550, 100)-(589, 139), tempo
SCREEN 9, , 1, 1
AnfangDrehen:
CLS
PUT (0, 0), tempo, PSET
COLOR 15
LOCATE 10, 1: PRINT "Diese Funktion ermîglicht es Ihnen, das Sprite um seinen Mittelpunkt"
PRINT "zu drehen. Erlaubt sind beliebige Winkel mit bis zu zwei Nachkommastellen."
PRINT "Drehungen im Uhrzeigersinn werden durch positive, Drehungen gegen den"
PRINT "Uhrzeigersinn durch negative Werte erreicht."
PRINT
PRINT "Beispiel:"
PRINT "Die Eingabe   48    dreht das Sprite um 48 Grad im Uhrzeigersinn."
PRINT "Die Eingabe  -12.78 dreht das Sprite um 12,78 Grad gegen den Uhrzeigersinn."
PRINT "                ^"
PRINT "Bitte verwenden Sie einen Dezimalpunkt an Stelle eines Kommas."
PRINT "Zum Abschluss der Eingabe mu· die Enter-Taste gedrÅckt werden."
PRINT "Ein Druck auf die Enter-Taste - ohne Angabe eines Winkels - fÅhrt zurÅck"
PRINT "zum HauptmenÅ."
LOCATE 8, 10: INPUT "Um wieviel Grad drehen"; winkel
IF winkel = 0 THEN
    SCREEN 9, , 0, 0
    EXIT SUB
    END IF
zwopi# = 8 * ATN(1)
wi# = (winkel / 360) * zwopi#
sinus# = SIN(wi#)
cosinus# = COS(wi#)
FOR x% = 0 TO 39
   FOR y% = 0 TO 39
    xx = x% - 20
    yy = y% - 20
    xd = xx * cosinus# - yy * sinus#
    yd = xx * sinus# + yy * cosinus#
    xd = xd + 80
    yd = yd + 20
    PSET (xd, yd), Matrix(x%, y%)
   NEXT
NEXT
LINE (0, 70)-(639, 349), 0, BF


LOCATE 10, 1: PRINT "Im oberen Teil des Bildschirms sehen Sie ganz links das UrsprÅngliche"
PRINT "und unmittelbar rechts daneben das gedrehte Sprite."
PRINT "Sollten Sie mit dem Ergebnis der Drehung zufrieden sein, dann drÅcken Sie"
PRINT "die  j  Taste."
PRINT "Wollen Sie hingegen das alte Sprite erhalten, betÑtigen Sie die  n  Taste."
LOCATE 8, 10: PRINT "Zufrieden ? (J/N)"
i$ = Taste$
IF i$ = "j" OR i$ = "J" THEN
        FOR x% = 60 TO 99
         FOR y% = 0 TO 39
            Matrix(x% - 60, y%) = POINT(x%, y%)
         NEXT
        NEXT
SCREEN 9, , 0, 0
CALL MatrixSchreiben
EXIT SUB
ELSE
GOTO AnfangDrehen
END IF
END SUB

SUB Einrichten
SCREEN 9
CLS
COLOR 15
FOR x% = 0 TO 320 STEP 8
 LINE (x%, 0)-(x%, 320), 2
 LINE (0, x%)-(320, x%), 2
NEXT
FOR x% = 0 TO 320 STEP 80
 LINE (x%, 0)-(x%, 320), 10
 LINE (0, x%)-(320, x%), 10
NEXT
LINE (549, 99)-(590, 140), 15, B
COLOR 7
LOCATE 1, 45: PRINT "Bewegen Sie den Cursor mit"
LOCATE 2, 45: PRINT "den Pfeiltasten auf die"
LOCATE 3, 45: PRINT "gewÅnschte Position und drÅcken"
LOCATE 4, 45: PRINT "Sie ENTER um einen Punkt zu setzen."
LOCATE 5, 45: PRINT "DrÅcken Sie die Taste mit dem"
LOCATE 6, 45: PRINT "hervorgehobenen Buchstaben um einen"
LOCATE 7, 45: PRINT "MenÅpunkt zu aktivieren."
CALL Highlight(8, 50, 2, 1, "SPiegeln")
CALL Highlight(9, 50, 1, 1, "Hilfe")
CALL Highlight(10, 50, 1, 1, "Laden")
CALL Highlight(11, 50, 1, 1, "Speichern")
CALL Highlight(12, 50, 1, 1, "Oben")
CALL Highlight(13, 50, 1, 1, "Unten")
CALL Highlight(14, 50, 1, 1, "Rechts")
CALL Highlight(15, 50, 4, 1, "linKs")
CALL Highlight(16, 50, 1, 1, "Drehen")
CALL Highlight(17, 50, 1, 1, "Farben vertauschen")
CALL Highlight(18, 50, 11, 3, "Malfarbe  + -")
LOCATE 19, 49: PRINT "⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø"
LOCATE 20, 49: PRINT "≥                  ≥"
LOCATE 21, 49: PRINT "≥                  ≥"
LOCATE 22, 49: PRINT "¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ"
CALL Highlight(23, 50, 1, 1, "Ende")
FOR Farbe = 0 TO 15
COLOR Farbe
 LOCATE 21, 51 + Farbe: PRINT "€"
NEXT
COLOR 15
Farbe = 15
LOCATE 20, 50 + Farbe: PRINT " " + CHR$(25) + " ";
PositionX = 0
PositionY = 0
END SUB

SUB Ende
SCREEN 9, , 1, 1
CLS
LOCATE 4, 1: PRINT "Diese Funktion Beendet das Programm OHNE das aktuelle"
PRINT "Sprite zu speichern."
PRINT
PRINT "Wollen Sie wirklich beenden ? ( J/N )"
PRINT
PRINT "Ein Druck auf die  j Taste beendet das Programm und fÅhrt zu DOS."
PRINT "Nach einem Druck auf die  n Taste bleibt das aktuelle Sprite"
PRINT "erhalten und das Programm wird fortgesetzt."
 i$ = Taste$
    IF UCASE$(i$) = "J" THEN END
    SCREEN 9, , 0, 0
END SUB

SUB Highlight (y%, x%, position%, laenge%, a$)
COLOR 7
LOCATE y%, x%: PRINT a$
COLOR 15
LOCATE y%, x% + position% - 1: PRINT MID$(a$, position%, laenge%)
END SUB

SUB Hilfe
SCREEN 9, , 1, 1
CLS
LOCATE 1, 1: PRINT "p, P    ==>   Spiegelt das Sprite"
             PRINT "l, L    ==>   Laden eines Sprites"
             PRINT "s, S    ==>   Speichern eines Sprites"
             PRINT "o, O    ==>   Verschiebt das Sprite um ein Pixel nach oben"
             PRINT "u, U    ==>        '      '     '    '  '    '     '  unten"
             PRINT "r, R    ==>        '      '     '    '  '    '     '  rechts"
             PRINT "k, K    ==>        '      '     '    '  '    '     '  linKs"
             PRINT "d, D    ==>    Dreht das Sprite beliebig um den Mittelpunkt"
             PRINT "f, F    ==>    Vertauscht zwei Farben miteinander"
             PRINT "+       ==>    Farbauswahl nach rechts"
             PRINT "-       ==>    Farbauswahl nach links"
             PRINT "e, E    ==>    Beendet das Programm"
             PRINT CHR$(17); CHR$(16); CHR$(18); "     ==>    Bewegen den Cursor"
             PRINT "Enter   ==>    Setzt einen Punkt in der aktuelle Malfarbe"
             
     PRINT "            (Beliebige Taste fÅhrt zurÅck zum Programm)"
i$ = Taste$
SCREEN 9, , 0, 0
END SUB

SUB Laden
SCREEN 9, , 1, 1
AnfangLaden:
CLS
COLOR 15
LOCATE 4, 1: PRINT "Das zu ladende Sprite mu· im aktuellen Verzeichnis stehen."
PRINT "Geben Sie den Namen des Sprites OHNE die Erweiterung >.spr< an"
PRINT "und schlie·en Sie die Eingabe mit der Enter-Taste ab."
PRINT ""
PRINT "Die Enter-Taste ohne vorherige Eingabe bringt Sie zurÅck zum Programm."
LOCATE 2, 10: INPUT "Bitte geben Sie den Namen ein:"; name$
CLS
name$ = UCASE$(name$)
IF name$ = "" THEN SCREEN 9, , 0, 0: EXIT SUB
SHELL "dir " + name$ + ".spr > tempo.$$$"
CLOSE
OPEN "tempo.$$$" FOR INPUT AS #1
gefunden% = 0
WHILE NOT EOF(1)
LINE INPUT #1, a$
 IF INSTR(a$, name$) > 0 THEN gefunden% = 1
WEND
CLOSE
KILL "tempo.$$$"
name$ = name$ + ".spr"
IF gefunden% = 0 THEN
    LOCATE 1, 1: PRINT "Das Sprite mit dem Namen"
    PRINT name$
    PRINT "konnte leider nicht gefunden werden."
    PRINT
    PRINT "DrÅcken Sie eine Taste und versuchen Sie es erneut."
    i$ = Taste$
    GOTO AnfangLaden
END IF
DEF SEG = VARSEG(tempo(1))
BLOAD name$, VARPTR(tempo(1))
SCREEN 9, , 0, 0
PUT (550, 100), tempo, PSET
FOR x% = 0 TO 39
FOR y% = 0 TO 39
Matrix(x%, y%) = POINT(550 + x%, 100 + y%)
NEXT
NEXT
CALL MatrixSchreiben
END SUB

SUB Malen
AnfangMalen:
i$ = Taste$
IF LEN(i$) = 2 THEN
        LINE (PX + 1, PY + 1)-(PX + 7, PY + 7), POINT(PX + 4, PY + 4), B
    i$ = RIGHT$(i$, 1)
    SELECT CASE ASC(i$)
    CASE 72
        PY = PY - 8
        IF PY < 0 THEN PY = 312
    CASE 75
        PX = PX - 8
        IF PX < 0 THEN PX = 312
    CASE 77
        PX = PX + 8
        IF PX > 312 THEN PX = 0
    CASE 80
        PY = PY + 8
        IF PY > 312 THEN PY = 0
    CASE ELSE
END SELECT
    IF POINT(PX + 4, PY + 4) = 15 THEN
        LINE (PX + 1, PY + 1)-(PX + 7, PY + 7), 0, B
    ELSE
        LINE (PX + 1, PY + 1)-(PX + 7, PY + 7), 15, B
    END IF

ELSE
SELECT CASE i$
    CASE "p", "P"
        CALL Spiegeln
    CASE "h", "H"
        CALL Hilfe
    CASE "+"
        IF Farbe < 15 THEN
            Farbe = Farbe + 1
            LOCATE 20, 50 + Farbe: PRINT " " + CHR$(25) + " ";
        END IF
    CASE "-"
        IF Farbe > 0 THEN
            Farbe = Farbe - 1
            LOCATE 20, 50 + Farbe: PRINT " " + CHR$(25) + " ";
        END IF
    CASE "e", "E"
        CALL Ende
    CASE "l", "L"
        CALL Laden
    CASE "s", "S"
        CALL Speichern
    CASE CHR$(13)
        Matrix(INT(PX / 8), INT(PY / 8)) = Farbe
        LINE (PX + 1, PY + 1)-(PX + 7, PY + 7), Farbe, BF
        IF Farbe <> 15 THEN
        LINE (PX + 1, PY + 1)-(PX + 7, PY + 7), 15, B
        ELSE
        LINE (PX + 1, PY + 1)-(PX + 7, PY + 7), 0, B
        END IF
        PSET (550 + INT(PX / 8), 100 + INT(PY / 8)), Farbe
    CASE "o", "O"
        CALL Verschieben(0, -1)
    CASE "r", "R"
        CALL Verschieben(1, 0)
    CASE "k", "K"
        CALL Verschieben(-1, 0)
    CASE "u", "U"
        CALL Verschieben(0, 1)
    CASE "d", "D"
        CALL Drehen
    CASE "f", "F"
        CALL Vertauschen
    CASE ELSE
END SELECT
END IF
GOTO AnfangMalen
END SUB

SUB MatrixSchreiben
FOR x% = 0 TO 39
FOR y% = 0 TO 39
LINE (x% * 8 + 1, y% * 8 + 1)-(x% * 8 + 7, y% * 8 + 7), Matrix(x%, y%), BF
PSET (550 + x%, 100 + y%), Matrix(x%, y%)
NEXT
NEXT
END SUB

SUB Speichern
SCREEN 9, , 1, 1
AnfangSpeichern:
CLS
IF name$ <> "" THEN
    LOCATE 2, 10: PRINT "Aktueller Name: "; name$
    LOCATE 4, 1: PRINT "Wenn Sie das aktuelle Sprite unter diesem Namen"
    PRINT "speichern wollen, mÅssen Sie die Enter-Taste drÅcken."
    PRINT "Da diese Datei schon vorhanden ist, wird nicht explizit"
    PRINT "vor dem öberschreiben gewarnt."
    PRINT
    PRINT "Wenn Sie einen anderen Namen verwenden mîchten, drÅcken Sie"
    PRINT "eine andere Taste."
    PRINT
    PRINT "Mit (ESC) gelangen Sie ohne zu Speichern zurÅck in das"
    PRINT "Hauptprogramm."
    i$ = Taste$
    IF i$ = CHR$(13) THEN GOTO DateiSchreiben
    IF i$ = CHR$(27) THEN SCREEN 9, , 0, 0: EXIT SUB
END IF
NamenEingeben:
CLS
LOCATE 4, 1: PRINT "Bitte geben Sie den Namen ohne Pfadangaben und"
PRINT "ohne Erweiterung ein. (Abschlu· mit der Enter-Taste)"
PRINT
PRINT "Sollte ein Sprite mit diesem Namen bereits existieren, so werden Sie"
PRINT "darauf aufmerksam gemacht."
PRINT
PRINT "Der Druck auf die Enter-Taste ohne vorherige Eingabe bricht das"
PRINT "Speichern ab und fÅhrt zurÅck zum Hauptprogramm."
LOCATE 2, 10: INPUT "Name des zu speichernden Sprites:"; name$
IF LEN(name$) > 8 THEN
    CLS
    PRINT "Der Name darf nicht lÑnger als 8 Stellen sein!"
    i$ = Taste$
    GOTO NamenEingeben
END IF
IF LEN(name$) = 0 THEN SCREEN 9, , 0, 0: EXIT SUB

name$ = UCASE$(name$)
SHELL "dir " + name$ + ".spr > tempo.$$$"
CLOSE
OPEN "tempo.$$$" FOR INPUT AS #1
gefunden% = 0
WHILE NOT EOF(1)
LINE INPUT #1, a$
 IF INSTR(a$, name$) > 0 THEN gefunden% = 1
WEND
CLOSE
KILL "tempo.$$$"
IF gefunden% = 1 THEN
    CLS
    BEEP
    LOCATE 4, 1: PRINT "WARNUNG !!!"
    PRINT
    PRINT "Eine Datei mit dem Namen "; name$; " existiert bereits !"
    PRINT
    PRINT "Soll die Datei Åberschrieben werden?  ( J/N )"
    PRINT
    PRINT "Wenn Sie sicher sind, da· die schon existierende Datei"
    PRINT "Åberschrieben werden kann, so drÅcken Sie die  j Taste."
    PRINT "Die n Taste ermîglicht es Ihnen einen anderen Namen zu"
    PRINT "vergeben."
    i$ = Taste$
    IF UCASE$(i$) <> "J" THEN GOTO NamenEingeben
END IF
name$ = name$ + ".spr"
DateiSchreiben:
SCREEN 9, , 0, 1
GET (550, 100)-(589, 139), tempo
DEF SEG = VARSEG(tempo(1))
BSAVE name$, VARPTR(tempo(1)), 804
SCREEN 9, , 0, 0
END SUB

SUB Spiegeln
GET (550, 100)-(589, 139), tempo
SCREEN 9, , 1, 1
AnfangSpiegeln:
CLS
PUT (0, 0), tempo, PSET
COLOR 15
LOCATE 10, 1: PRINT "Diese Funktion ermîglicht es Ihnen, das Sprite an seiner Mittelachse"
PRINT "zu spiegeln."
PRINT "Erlaubt sind Spiegelungen an der Hochachse (Rechts wird Links und umgekehrt)"
PRINT "und an der Querachse (Oben wird Unten)."
PRINT
PRINT "Beispiel:"
PRINT "Die Eingabe   1  spiegelt das Sprite an der Hochachse."
PRINT "Die Eingabe   2  spiegelt das Sprite an der Querachse."
PRINT
PRINT "Zum Abschluss der Eingabe mu· die Enter-Taste gedrÅckt werden."
PRINT "Ein Druck auf die Enter-Taste - ohne Eingabe - fÅhrt zurÅck"
PRINT "zum HauptmenÅ."
LOCATE 8, 10: INPUT "In welcher Weise spiegeln"; mirror%
IF mirror% = 0 THEN
    SCREEN 9, , 0, 0
    EXIT SUB
END IF
SELECT CASE mirror%
   CASE 1
      FOR x% = 0 TO 39
         FOR y% = 0 TO 39
            PSET (90 - x%, y%), POINT(x%, y%)
         NEXT
      NEXT
   CASE 2
      FOR x% = 0 TO 39
         FOR y% = 0 TO 39
            PSET (x% + 51, 39 - y%), POINT(x%, y%)
         NEXT
      NEXT
   CASE ELSE
      SCREEN 9, , 0, 0
      EXIT SUB
END SELECT

LINE (0, 70)-(639, 349), 0, BF

LOCATE 10, 1: PRINT "Im oberen Teil des Bildschirms sehen Sie ganz links das UrsprÅngliche"
PRINT "und unmittelbar rechts daneben das gespiegelte Sprite."
PRINT "Sollten Sie mit dem Ergebnis der Spiegelung zufrieden sein, dann drÅcken Sie"
PRINT "die  j  Taste."
PRINT "Wollen Sie hingegen das alte Sprite erhalten, betÑtigen Sie die  n  Taste."
LOCATE 8, 10: PRINT "Zufrieden ? (J/N)"
i$ = Taste$
IF i$ = "j" OR i$ = "J" THEN
        FOR x% = 51 TO 90
         FOR y% = 0 TO 39
            Matrix(x% - 51, y%) = POINT(x%, y%)
         NEXT
        NEXT
SCREEN 9, , 0, 0
CALL MatrixSchreiben
EXIT SUB
ELSE
GOTO AnfangSpiegeln
END IF

END SUB

FUNCTION Taste$
AnfangTaste:
i$ = INKEY$
IF i$ = "" THEN GOTO AnfangTaste
Taste$ = i$
END FUNCTION

SUB Verschieben (x AS INTEGER, y AS INTEGER)
IF x = -1 THEN
    FOR my% = 0 TO 39
       buffer% = Matrix(0, my%)
       FOR mx% = 0 TO 38
          Matrix(mx%, my%) = Matrix(mx% + 1, my%)
       NEXT
       Matrix(39, my%) = buffer%
    NEXT
    CALL MatrixSchreiben
END IF
IF y = -1 THEN
    FOR mx% = 0 TO 39
       buffer% = Matrix(mx%, 0)
       FOR my% = 0 TO 38
          Matrix(mx%, my%) = Matrix(mx%, my% + 1)
       NEXT
       Matrix(mx%, 39) = buffer%
    NEXT
    CALL MatrixSchreiben
END IF
IF x = 1 THEN
    FOR my% = 0 TO 39
       buffer% = Matrix(39, my%)
       FOR mx% = 39 TO 1 STEP -1
          Matrix(mx%, my%) = Matrix(mx% - 1, my%)
       NEXT
       Matrix(0, my%) = buffer%
    NEXT
    CALL MatrixSchreiben
END IF
IF y = 1 THEN
    FOR mx% = 0 TO 39
       buffer% = Matrix(mx%, 39)
       FOR my% = 39 TO 1 STEP -1
          Matrix(mx%, my%) = Matrix(mx%, my% - 1)
       NEXT
       Matrix(mx%, 0) = buffer%
    NEXT
    CALL MatrixSchreiben
END IF
END SUB

SUB Vertauschen
AnfangVertauschen:
SCREEN 9, , 0, 1
GET (550, 100)-(589, 139), tempo
SCREEN 9, , 1, 1
CLS
PUT (0, 0), tempo, PSET
LOCATE 10, 1: PRINT "WÑhlen Sie die zu vertauschende Farbe mit " + CHR$(17) + CHR$(16) + " (Enter).";
LOCATE 11, 1: PRINT "(ESC) = Abbrechen."
FOR f% = 0 TO 15
COLOR f%
LOCATE 13, f% + 2: PRINT "€";
NEXT
Farbe1% = 0
LOCATE 12, Farbe1% + 1: PRINT " " + CHR$(25) + " ";
AnfangFarbe1:
i$ = Taste$
IF LEN(i$) = 2 THEN i$ = RIGHT$(i$, 1)
SELECT CASE ASC(i$)
    CASE 75
        IF Farbe1% > 0 THEN Farbe1% = Farbe1% - 1
    CASE 77
        IF Farbe1% < 15 THEN Farbe1% = Farbe1% + 1
    CASE 27
        SCREEN 9, , 0, 0
        EXIT SUB
    CASE 13
        FOR x% = 0 TO 39
           FOR y% = 0 TO 39
             IF Matrix(x%, y%) = Farbe1% THEN GOTO Farbe2Aussuchen
           NEXT
        NEXT
        BEEP
        LOCATE 15, 1: PRINT "Diese Farbe ist in dem Sprite nicht vorhanden !";
        LOCATE 16, 1: PRINT "Weiter mit beliebiger Taste.";
        WHILE INKEY$ = "": WEND
        GOTO AnfangVertauschen
    CASE ELSE
END SELECT
LOCATE 12, Farbe1% + 1: PRINT " " + CHR$(25) + " ";
GOTO AnfangFarbe1

Farbe2Aussuchen:
LOCATE 15, 1: PRINT "WÑhlen Sie die neue Farbe mit " + CHR$(17) + CHR$(16) + " (Enter).";
LOCATE 16, 1: PRINT "(ESC) = Abbrechen."
FOR f% = 0 TO 15
COLOR f%
LOCATE 18, f% + 2: PRINT "€";
NEXT
Farbe2% = 0
LOCATE 17, Farbe2% + 1: PRINT " " + CHR$(25) + " ";
AnfangFarbe2:
i$ = Taste$
IF LEN(i$) = 2 THEN i$ = RIGHT$(i$, 1)
SELECT CASE ASC(i$)
    CASE 75
        IF Farbe2% > 0 THEN Farbe2% = Farbe2% - 1
    CASE 77
        IF Farbe2% < 15 THEN Farbe2% = Farbe2% + 1
    CASE 27
        SCREEN 9, , 0, 0
        EXIT SUB
    CASE 13
        GOTO FarbenAusgesucht
    CASE ELSE
END SELECT
LOCATE 17, Farbe2% + 1: PRINT " " + CHR$(25) + " ";
GOTO AnfangFarbe2

FarbenAusgesucht:
LINE (0, 40)-(639, 349), 0, BF
FOR x% = 0 TO 39
   FOR y% = 0 TO 39
    f% = POINT(x%, y%)
    IF f% = Farbe1% THEN
        PSET (x% + 50, y%), Farbe2%
    ELSE
        PSET (x% + 50, y%), f%
    END IF
   NEXT
NEXT
LOCATE 10, 1: PRINT "Im oberen Teil des Bildschirms sehen Sie ganz links das UrsprÅngliche"
PRINT "und unmittelbar rechts daneben das Sprite mit der neuen Farbgebung."
PRINT "Sollten Sie mit dem Ergebnis zufrieden sein, dann drÅcken Sie"
PRINT "die  j  Taste."
PRINT "Wollen Sie hingegen das alte Sprite erhalten, betÑtigen Sie die  n  Taste."
LOCATE 8, 10: PRINT "Zufrieden ? ( J/N )"
i$ = Taste$
IF i$ = "j" OR i$ = "J" THEN
    FOR x% = 0 TO 39
     FOR y% = 0 TO 39
        IF Matrix(x%, y%) = Farbe1% THEN Matrix(x%, y%) = Farbe2%
     NEXT
    NEXT
    SCREEN 9, , 0, 0
    CALL MatrixSchreiben
    EXIT SUB
ELSE
    GOTO AnfangVertauschen
END IF
END SUB

