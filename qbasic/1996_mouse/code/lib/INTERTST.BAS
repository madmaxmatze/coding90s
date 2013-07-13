'*** Interupte aufrufen ganz "EASY" *********************************


'*** Aufruf : Interr%(Num%, AX%, BX%, CX%, DX%)
'*** Num%   = Interuptnummer (immer im Hex (z.B.: &H33)) ************
'*** AX%    = AX Register (im AX Register steht immer die Funktion)
'***          (z.B.: &H00) ******************************************
'*** BX%    = BX Register *******************************************
'*** CX%    = CX Register *******************************************                                          
'*** DX%    = DX Register *******************************************


'*** Sub's **********************************************************
DECLARE FUNCTION Interr% (Num%, AX%, BX%, CX%, DX%)
DECLARE SUB ReadData ()

'*** Variablen ******************************************************
DIM SHARED MS%(30)

ReadData                                            '*** Data's einlesen

CLS
R% = Interr%(&H33, &H1, 0, 0, 0)

Datas:          '***** DATAs des Maschinenprogrammes fr Interr%()
                          
 DATA 55,8b,ec,56,57                       '*** Register retten
 DATA 8b,76,06,8b,14                       '*** DX holen
 DATA 8b,76,08,8b,0c                       '*** CX holen
 DATA 8b,76,0a,8b,1c                       '*** BX holen
 DATA 8b,76,0c,8b,04                       '*** AX holen
 DATA cd,21                                '*** INT 21 (Nummer wird ver„ndert!)
 DATA 8b,76,0c,89,04                       '*** AX zurckschreiben
 DATA 5f,5e,5d                             '*** Register holen
 DATA ca,08,00                             '*** RETF 8  =>  Ende
 DATA #

FUNCTION Interr% (Num%, AX%, BX%, CX%, DX%)
 IF MS%(0) = 0 THEN
  PRINT "ERROR: Maschinenprogramm nicht eingelesen! Abbruch!"
  END
 END IF

 DEF SEG = VARSEG(MS%(0))
 POKE VARPTR(MS%(0)) + 26, Num%                     '*** Interrupt-Nummer
 CALL ABSOLUTE(AX%, BX%, CX%, DX%, VARPTR(MS%(0)))

 Interr% = AX%

END FUNCTION

SUB ReadData

 RESTORE Datas
 DEF SEG = VARSEG(MS%(0))

 FOR i% = 0 TO 99
  READ Byte$
  IF Byte$ = "#" THEN EXIT FOR
  POKE VARPTR(MS%(0)) + i%, VAL("&H" + Byte$)
 NEXT i%

END SUB

