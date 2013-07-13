'*** Beispielprogramm fÅr Index-sequentielle Datenbank ***
'*** aus DATA BECKERs gro·em QBASIC-Buch
'*** Autor: Stefan A. Dittrich

DECLARE SUB EinfuegeDS ()
DECLARE SUB EingabeDS ()
DECLARE SUB LeseIndex ()
DECLARE SUB LoeschDS ()
DECLARE SUB QSort (Von%, Bis%)
DECLARE SUB SchreibeIndex ()
DECLARE SUB SpeichernDS ()
DECLARE SUB SucheDS (Such$, Von%)
DECLARE SUB WarteAufTaste (Key$)
DECLARE SUB ZeigeBild ()
DECLARE SUB ZeigeDS ()
DECLARE SUB ZeigeListe ()
DECLARE SUB ZeigeStatus (Text$)

TYPE AdressTyp                          '** Datensatz-Struktur
 Vorname        AS STRING * 20
 Nachname       AS STRING * 20
 Strasse        AS STRING * 20
 PLZ            AS INTEGER
 Ort            AS STRING * 20
 Telefon        AS STRING * 15
END TYPE

TYPE IndexTyp                           '** Index-Struktur
 Schluessel     AS STRING * 3           '** 3-Byte-SchlÅssel
 Index          AS INTEGER              '** physikalische Nummer des DS
END TYPE

DIM SHARED Adresse AS AdressTyp, LeerAdresse AS AdressTyp
DIM SHARED Index(1000) AS IndexTyp
DIM SHARED Anz%, Gesamt%, Aktuell%

DIM SHARED Geloescht$                   '** "Gelîscht"-Markierung
Geloescht$ = STRING$(LEN(Index(1).Schluessel), CHR$(255))

OPEN "ADRESSEN.DBK" FOR RANDOM AS #1 LEN = LEN(Adresse)

LeseIndex                               '** Index-Datei einlesen

ZeigeBild                               '** Anzeige Status

IF Anz% = 0 THEN                        '** noch kein Eintrag vorhanden!
 EingabeDS                              '** Datensatz eingeben
 EinfuegeDS                             '** und in Datei einfÅgen
END IF


DO                                      '**** Hauptschleife ****

 ZeigeDS                                '** aktuellen Datensatz zeigen
 ZeigeStatus "Funktion wÑhlen"

 WarteAufTaste Key$                     '** auf Kommando warten


 SELECT CASE Key$                       '** Taste auswerten:
 
  CASE "+"                              '**** ein DS weiter
   IF Aktuell% < Anz% THEN Aktuell% = Aktuell% + 1


  CASE "-"                              '**** ein DS zurÅck
   IF Aktuell% > 1 THEN Aktuell% = Aktuell% - 1


  CASE "A"                              '**** DS Ñndern
    ZeigeStatus "Datensatz Ñndern"
    EingabeDS                           '** Datensatz eingeben
    SpeichernDS                         '** Datensatz speichern


  CASE "L"                              '**** DS lîschen
    ZeigeStatus "Datensatz lîschen (J) ?"
    WarteAufTaste Key$                  '** auf BestÑtigung warten
    IF Key$ = "J" THEN
     LoeschDS                           '** Datensatz lîschen
     QSort 1, Gesamt%                   '** Index sortieren
    END IF


  CASE "N"                              '**** Neueingabe
    ZeigeStatus "Datensatz Neueingabe"
    Adresse = LeerAdresse               '** Adresse lîschen
    EingabeDS                           '** Datensatz eingeben
    EinfuegeDS                          '** und in Datei einfÅgen
    QSort 1, Gesamt%                    '** Index sortieren


  CASE "S"                              '**** Suchen
    ZeigeStatus "Suche im Namen nach: "
    INPUT Such$                         '** Suchbegriff eingeben
    IF LEN(Such$) THEN SucheDS Such$, 1

  CASE "W"                              '**** Weitersuchen
    IF LEN(Such$) THEN SucheDS Such$, Aktuell% + 1


  CASE "U"                              '**** öbersicht zeigen
    ZeigeListe


  CASE CHR$(27)                         '**** Ende
    ZeigeStatus "Programm beenden (J) ?"
    WarteAufTaste Key$                  '** auf BestÑtigung warten
    IF Key$ = "J" THEN
     ZeigeStatus "Programm beendet..."
     EXIT DO
    END IF


  CASE ELSE: BEEP                       '**** ungÅltige Taste

 END SELECT

LOOP


SchreibeIndex                           '** Index-Datei abspeichern

CLOSE                                   '** Dateien schlie·en

SUB EinfuegeDS
'** Datensatz in Datenbank einfÅgen

 Anz% = Anz% + 1                 '** ein Eintrag mehr

 IF Anz% > Gesamt% THEN          '** Eintrag neu hinzufÅgen!
  Gesamt% = Anz%
  Index(Anz%).Index = Anz%
 END IF

 Aktuell% = Anz%                 '** Eintrag aktuell
 SpeichernDS                     '** DS speichern

END SUB

SUB EingabeDS
'** Datensatz eingeben, Leereingabe Åbernimmt alten Eintrag

 LOCATE 9, 40: INPUT X$: IF LEN(X$) THEN Adresse.Vorname = X$
 LOCATE 11, 40: INPUT X$: IF LEN(X$) THEN Adresse.Nachname = X$
 LOCATE 13, 40: INPUT X$: IF LEN(X$) THEN Adresse.Strasse = X$
 LOCATE 15, 40: INPUT X$: IF LEN(X$) THEN Adresse.PLZ = VAL(X$)
 LOCATE 17, 40: INPUT X$: IF LEN(X$) THEN Adresse.Ort = X$
 LOCATE 19, 40: INPUT X$: IF LEN(X$) THEN Adresse.Telefon = X$

 ZeigeBild

END SUB

SUB LeseIndex
'** Index-Datei in Feld Index() einlesen

 OPEN "ADRESSEN.IDX" FOR RANDOM AS #2 LEN = LEN(Index(1))

 Gesamt% = LOF(2) / 5           '** Anzahl EintrÑge in Gesamt%

 FOR i% = 1 TO Gesamt%
  GET #2, i%, Index(i%)         '** Index-Liste einlesen
  IF Index(i%).Schluessel <> Geloescht$ THEN Anz% = i%
 NEXT i%

 CLOSE #2

 Aktuell% = 1                   '** aktueller Datensatz = 1
END SUB

SUB LoeschDS
'** Aktuellen Datensatz lîschen

 Index(Aktuell%).Schluessel = Geloescht$ '** als Gelîscht markieren

 Anz% = Anz% - 1                         '** ein Eintrag weniger

 QSort 1, Gesamt%                        '** Index sortieren
 Aktuell% = 1                            '** erster Eintrag aktuell

END SUB

SUB QSort (Von%, Bis%)
'** QuickSort: Index aufsteigend nach SchlÅssel sortieren

 i% = Von%: j% = Bis%
 X$ = Index(i% \ 2 + j% \ 2).Schluessel

 DO
  WHILE Index(i%).Schluessel < X$: i% = i% + 1: WEND
  WHILE Index(j%).Schluessel > X$: j% = j% - 1: WEND
  IF i% <= j% THEN
   SWAP Index(i%), Index(j%)
   i% = i% + 1
   j% = j% - 1
  END IF
 LOOP UNTIL i% > j%

 IF j% > Von% THEN QSort Von%, j%          '** linken Teil sortieren
 IF i% < Bis% THEN QSort i%, Bis%          '** rechten Teil sortieren

END SUB

SUB SchreibeIndex
'** Indexdatei abspeichern

 KILL "ADRESSEN.IDX"            '** alte Indexdatei lîschen

 OPEN "ADRESSEN.IDX" FOR RANDOM AS #2 LEN = LEN(Index(1))

 FOR i% = 1 TO Gesamt%
  PUT #2, i%, Index(i%)         '** Index-Liste abspeichern
 NEXT i%

 CLOSE #2

END SUB

SUB SpeichernDS
'** Datensatz speichern

 Index(Aktuell%).Schluessel = Adresse.Nachname '** SchlÅssel setzen
 PUT #1, Index(Aktuell%).Index, Adresse        '** Datensatz speichern

END SUB

SUB SucheDS (Such$, Von%)
'** DS suchen: Index-SchlÅssel nach Such$ ab Von% durchsuchen
 
 '** Suchbegriff in Gro·buchstaben und max. so lang wie SchlÅssel wandeln
 Such$ = UCASE$(Such$)
 IF LEN(Such$) > LEN(Index(1).Schluessel) THEN Such$ = LEFT$(Such$, LEN(Index(1).Schluessel))

 FOR i% = Von% TO Gesamt%           '** Indexfeld durchsuchen
  IF UCASE$(LEFT$(Index(i%).Schluessel, LEN(Such$))) = Such$ THEN
   Aktuell% = i%                    '** gefunden: Aktuell% setzen
   EXIT FOR
  END IF
 NEXT i%

 IF i% = Gesamt% + 1 THEN BEEP      '** nicht gefunden!

END SUB

SUB WarteAufTaste (Key$)
'** auf Taste warten, Taste gro· in Key zurÅckgeben

 DO
  Key$ = UCASE$(INKEY$)                 '** Taste in Key$
 LOOP UNTIL LEN(Key$)

END SUB

SUB ZeigeBild
'** Hauptbildschirm aufbauen

 CLS
 PRINT , "**********  Adre·-Verwaltung mit Index  **********"
 LOCATE 5, 1
 PRINT STRING$(80, CHR$(196))
 PRINT                                  '** Platz fÅr Status
 PRINT STRING$(80, CHR$(196))

 PRINT : PRINT "Vorname...:"
 PRINT : PRINT "Nachname..:"
 PRINT : PRINT "Stra·e....:"
 PRINT : PRINT "PLZ.......:"
 PRINT : PRINT "Ort.......:"
 PRINT : PRINT "Telefon...:"

 LOCATE 22, 1                           '** Tastenbelegung zeigen
 COLOR 0, 7
 PRINT STRING$(80, CHR$(205))
 PRINT "   <N>=Neueingabe,  <A>=éndern,  <->=DS-,  <+>=DS+,  <L>=Lîschen,  <Esc>=Ende   ";
 PRINT "   <U> = öbersicht, <S> = Suche nach Namen, <W> = Weitersuchen                  ";
 COLOR 7, 0

END SUB

SUB ZeigeDS
'** Datensatz anzeigen

 LOCATE 3, 1
 PRINT Anz%; "DatensÑtze vorhanden,"; Gesamt% - Anz%; "gelîschte, aktueller Datensatz"; Aktuell%

 GET #1, Index(Aktuell%).Index, Adresse

 LOCATE 9, 13: PRINT Adresse.Vorname
 LOCATE 11, 13: PRINT Adresse.Nachname
 LOCATE 13, 13: PRINT Adresse.Strasse
 LOCATE 15, 12: PRINT Adresse.PLZ; "  "
 LOCATE 17, 13: PRINT Adresse.Ort
 LOCATE 19, 13: PRINT Adresse.Telefon

END SUB

SUB ZeigeListe
'** Gesamtliste zeigen

 CLS
 COLOR 7 + 8
 PRINT "*** öbersicht Åber alle Adressen ***"
 PRINT
 PRINT "Nummer        Nachname            Vorname             Ort"
 COLOR 7

 FOR i% = 1 TO Anz%
   GET #1, Index(i%).Index, Adresse             '** Datensatz holen und zeigen
   PRINT i%; ")", Adresse.Nachname; Adresse.Vorname; Adresse.Ort
 NEXT i%

 PRINT : PRINT "*** Bitte Taste drÅcken ***"

 DO: LOOP UNTIL LEN(INKEY$)                     '** auf Tastendruck warten
 ZeigeBild                                      '** Hauptbild zeigen

END SUB

SUB ZeigeStatus (Text$)
'** Anzeige zentriert in Statuszeile

 LOCATE 6, 1
 PRINT SPACE$(80);              '** Zeile lîschen

 LOCATE 6, 39 - LEN(Text$) / 2  '** Position setzen
 COLOR 7 + 8                    '** Attribut: hell
 PRINT Text$;                   '** Text ausgeben
 COLOR 7                        '** Attribut: normal

END SUB

