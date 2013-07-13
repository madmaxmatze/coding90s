REM Mausroutinen Åber Interrupt in QBasic *****************************
REM Deklarationsteil fÅr Unterprogramme -------------------------------
DECLARE SUB maus (OnOff%)
DECLARE SUB MausInit ()
DECLARE SUB GetMaus ()
DECLARE SUB WarteBewegung ()
DECLARE SUB ReadData ()
DECLARE FUNCTION Interr% (Num%, AX%, BX%, CX%, DX%)
DIM SHARED MS%(45)                      'Feld fÅr Maschinenprogramm
ReadData                                'Maschinenprogramm einlesen
DIM SHARED Mausx%, Mausy%, Mausk%       'Mausparameter X/Y/Knopf
MausInit                                'Maustreiber initialisieren
REM -------------------------------------------------------------------

SCREEN 12
CLS
GOSUB farben
GOSUB menue
GOSUB leiste
 maus 1                                 '** Mauszeiger zeigen

bereich1:
LOCATE 1, 50
PRINT "Bereich1"
DO
  IF Mausk% = 2 THEN PSET (Mausx%, Mausy% - 1), a%
  WarteBewegung                         '** Warten auf Mausbewegung/Tastendruck
  IF Mausx% < 80 THEN GOTO bereich2
  IF Mausy% > 430 THEN GOTO bereich2
  mausf% = POINT(Mausx%, Mausy%)
  COLOR 15
  'GOSUB script

 LOOP
maus 0                                 '** Mauszeiger ausblenden

END


script:
LOCATE 28, 12: PRINT "MausX="; Mausx%
LOCATE 28, 23: PRINT "MausY="; Mausy%
RETURN

farben:
FOR a = 0 TO 300 STEP 20
LINE (80 + a, 396)-(100 + a, 430), a / 20, BF
NEXT
LINE (80, 395)-(401, 431), , B     'Farbkasten
RETURN

menue:
LINE (401, 395)-(639, 395)
LINE (80, 18)-(80, 445)
LINE (1, 18)-(639, 18)
RETURN

leiste:
COLOR 15
LOCATE 1, 5: PRINT "Datei"
LOCATE 1, 15: PRINT "Bearbeiten"
LOCATE 1, 30: PRINT "Optionen"
RETURN

bereich2:
LOCATE 1, 50: PRINT "Bereich2"
DO
WarteBewegung                         '** Warten auf Mausbewegung/Tastendruck
  IF Mausx% > 80 THEN GOTO bereich1
  IF Mausy% < 430 THEN GOTO bereich1
  mausf% = POINT(Mausx%, Mausy%)
  IF Mausk = 1 AND mausf% = 0 THEN a% = 0
  LINE (81, 396)-(100, 430), 0, BF    'schwartz
  IF Mausk = 1 AND mausf% = 1 THEN a% = 1
  LINE (101, 396)-(120, 430), 1, BF   'blau
  IF Mausk = 1 AND mausf% = 2 THEN a% = 2
  LINE (121, 396)-(140, 430), 2, BF   'grÅn
  IF Mausk = 1 AND mausf% = 3 THEN a% = 3
  LINE (141, 396)-(160, 430), 3, BF
  IF Mausk = 1 AND mausf% = 4 THEN a% = 4
  LINE (161, 396)-(180, 430), 4, BF   'rot
  IF Mausk = 1 AND mausf% = 5 THEN a% = 5
  LINE (181, 396)-(200, 430), 5, BF   'lila
  IF Mausk = 1 AND mausf% = 6 THEN a% = 6
  LINE (201, 396)-(220, 430), 6, BF   'braun
  IF Mausk = 1 AND mausf% = 7 THEN a% = 7
  LINE (221, 396)-(240, 430), 7, BF   'hellgrau
  IF Mausk = 1 AND mausf% = 8 THEN a% = 8
  LINE (241, 396)-(260, 430), 8, BF   'dunckelgrau
  IF Mausk = 1 AND mausf% = 9 THEN a% = 9
  LINE (261, 396)-(280, 430), 9, BF   'hellblau
  IF Mausk = 1 AND mausf% = 10 THEN a% = 10
  LINE (281, 396)-(300, 430), 10, BF  'hellgrÅn
  IF Mausk = 1 AND mausf% = 11 THEN a% = 11
  LINE (301, 396)-(320, 430), 11, BF  '
  IF Mausk = 1 AND mausf% = 12 THEN a% = 12
  LINE (321, 396)-(340, 430), 12, BF  'hellrot
  IF Mausk = 1 AND mausf% = 13 THEN a% = 13
  LINE (341, 396)-(360, 430), 13, BF  'helllila
  IF Mausk = 1 AND mausf% = 14 THEN a% = 14
  LINE (361, 396)-(380, 430), 14, BF  'gelb
  IF Mausk = 1 AND mausf% = 15 THEN a% = 15
  LINE (381, 396)-(400, 430), 15, BF  'wei·
  mausf% = POINT(Mausx%, Mausy%)
  COLOR 15
  GOSUB script
LOOP


MS.Data:        '***** DATAs des Maschinenprogrammes fÅr Interr%()
 DATA 55,8b,ec,56,57            'Register retten
 DATA 8b,76,0c,8b,04            'AX bis DX holen
 DATA 8b,76,0a,8b,1c
 DATA 8b,76,08,8b,0c
 DATA 8b,76,06,8b,14
 DATA cd,21                     'INT 21 (Nummer wird verÑndert!)
 DATA 8b,76,0c,89,04            'AX bis DX zurÅckschreiben
 DATA 8b,76,0a,89,1c
 DATA 8b,76,08,89,0c
 DATA 8b,76,06,89,14
 DATA 5f,5e,5d                  'Register holen
 DATA ca,08,00                  'RETF 8  =>  Ende
 DATA #

SUB farben
SCREEN 12

END SUB

SUB GetMaus
'** Mausposition und -knopfstatus in MausX%, MausY% und MausK% holen

  R% = Interr%(&H33, 3, BX%, CX%, DX%)
 
  Mausk% = BX%                  '** Maustaste (1=links, 2=rechts)
  Mausx% = CX%                  '** X-Position
  Mausy% = DX%                  '** Y-Position

END SUB

FUNCTION Interr% (Num%, AX%, BX%, CX%, DX%)
'** Interrupt Nummer Num% auslîsen mit Registerinhalten AX% bix DX%

 IF MS%(0) = 0 THEN                     '** Ist MS%() initialisiert?
  PRINT "FEHLER: Maschinenprogramm nicht eingelesen! Abbruch!"
  END
 END IF

 DEF SEG = VARSEG(MS%(0))               '** Segment bestimmen
 POKE VARPTR(MS%(0)) + 26, Num%         '** Interrupt-Nummer einsetzen

 CALL ABSOLUTE(AX%, BX%, CX%, DX%, VARPTR(MS%(0))) '** Aufruf

 Interr% = AX%                          '** RÅckgabewert aus AX% Åbernehmen

END FUNCTION

SUB maus (OnOff%)
'** Mauszeiger an/ausschalten (0=aus, 1=an)

 IF OnOff% = 0 THEN OnOff% = 2 ELSE OnOff% = 1
 R% = Interr%(&H33, OnOff%, BX%, CX%, DX%)

END SUB

SUB MausInit
'** Maustreiber initialisieren

 R% = Interr%(&H33, 0, BX%, CX%, DX%)           '** Maustreiber initialisieren

 R% = Interr%(&H33, 10, 0, &HFFFF, &HFF00)      '** Maushintergrund: blinken

END SUB

SUB MausSet (X%, Y%)
'** Position des Mauszeigers setzen ***
'** X% und Y% sind Zeichenkoordinaten

 R% = Interr%(&H33, 4, BX%, X%, Y%)

END SUB

SUB MausTempo (Speed%)
'** Mausgeschwindigkeit einstellen (0=Schnell, 100=extrem langsam)

 R% = Interr%(&H33, 15, BX%, Speed%, Speed% * 2)

END SUB

SUB MausXBereich (X1%, X2%)
'** Mausbewegungsbereich horizontal setzen von X1% bis X2%
'** X1% und X2% sind Zeichenkoordinaten

 R% = Interr%(&H33, 7, 0, X1%, X2%)

END SUB

SUB MausYBereich (Y1%, Y2%)
'** Mausbewegungsbereich vertikal setzen von Y1% bis Y2%
'** Y1% und Y2% sind Zeichenkoordinaten

 R% = Interr%(&H33, 8, BX%, Y1%, Y2%)

END SUB

SUB ReadData
'** DATAs fÅr Maschinenprogramm in MS%() einlesen

 RESTORE MS.Data
 DEF SEG = VARSEG(MS%(0))

 FOR i% = 0 TO 99
  READ Byte$
  IF Byte$ = "#" THEN EXIT FOR
  POKE VARPTR(MS%(0)) + i%, VAL("&H" + Byte$)
 NEXT i%

END SUB

SUB WarteBewegung
'** Warten, bis Maus bewegt oder Maustaste gedrÅckt/losgelassen

 GetMaus
 X% = Mausx%: Y% = Mausy%: k% = Mausk%

 DO
  GetMaus
 LOOP UNTIL X% <> Mausx% OR Y% <> Mausy% OR k% <> Mausk%

END SUB

SUB WarteKnopfLos
'** Warten, bis Maustaste losgelassen

 WHILE Mausk%
  GetMaus
 WEND

END SUB

