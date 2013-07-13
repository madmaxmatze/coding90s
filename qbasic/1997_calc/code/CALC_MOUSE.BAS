REM Vereinbarungen --------------------------------
DIM SHARED InterFeld(0 TO 34) AS INTEGER
DIM SHARED outregbx AS INTEGER
DIM SHARED outregcx AS INTEGER
DIM SHARED outregdx AS INTEGER
DECLARE SUB InitInterrupt ()
DECLARE SUB INTERRUPT (Nr%, iax%, ibx%, icx%, idx%)
CALL InitInterrupt

REM Hauptprogramm ---------------------------------
SCREEN 0
CLS
COLOR 7
FOR b = 1 TO 23
    FOR A = 1 TO 80
        LOCATE b, A: PRINT "Û"
    NEXT A
NEXT b

LOCATE 1, 1: COLOR 15, 13: PRINT "                        Super-Hex von Mathias Nitzsche                           "
LOCATE 2, 1: COLOR 15, 1: PRINT "Umrechnung         Option              Hilfe               Ende                 "
CALL INTERRUPT(&H33, &H7, 0, 0, 640)    'wagerecht
CALL INTERRUPT(&H33, &H8, 0, 0, 350)     'horizontal
CALL INTERRUPT(&H33, &H1, 0, 0, 0)
WHILE INKEY$ = "" 'CHR$(27)
      CALL INTERRUPT(&H33, &H3, 0, 0, 0)
           LOCATE 21, 1: PRINT "x:"; outregcx
           LOCATE 22, 1: PRINT "y:"; outregdx
           LOCATE 23, 1: PRINT "Taste:"; outregbx
      IF outregcx >= 0 AND outregcx <= 88 AND outregdx >= 8 AND outregdx <= 16 AND outregbx <> 0 THEN
         COLOR 15, 11
         LOCATE 3, 1: PRINT " Dezimal zu Hexadezimal "
         LOCATE 4, 1: PRINT " Hexadezimal zu Dezimal "
         COLOR 15, 0
      END IF
      IF outregcx >= 0 AND outregcx <= 184 AND outregdx >= 16 AND outregdx < 24 AND outregbx <> 0 THEN
         COLOR 7, 7: LOCATE 4, 1: PRINT "ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ": COLOR 15, 11:
         LOCATE 8, 10: PRINT "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
         LOCATE 9, 10: PRINT "บ                                                            บ"
         LOCATE 10, 10: PRINT "บ                                                            บ"
         LOCATE 11, 10: PRINT "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ"
         LOCATE 9, 14: INPUT "Geben sie die Dezimale Zahl ein: ", g
         A$ = HEX$(g)
         COLOR 14: LOCATE 10, 14: PRINT "Die Hexadezimale Zahl von"; g; "= "; A$
         COLOR 15, 0
      END IF
      IF outregcx >= 0 AND outregcx <= 184 AND outregdx >= 24 AND outregdx < 32 AND outregbx <> 0 THEN
         COLOR 7, 7: LOCATE 3, 1: PRINT "ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ": COLOR 15, 11:
         LOCATE 8, 10: PRINT "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
         LOCATE 9, 10: PRINT "บ                                                            บ"
         LOCATE 10, 10: PRINT "บ                                                            บ"
         LOCATE 11, 10: PRINT "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ"
         LOCATE 9, 14: INPUT "Geben sie die Hexadezimale Zahl ein: ", f$
         g$ = UCASE$(f$)
         FOR A = 1 TO 1000000
            A$ = HEX$(A)
            IF g$ = A$ THEN
               COLOR 14: LOCATE 10, 14: PRINT "Die Dezimale Zahl von "; g$; " =", A: COLOR 15: END
            END IF
         NEXT A
      END IF
      IF outregcx >= 472 AND outregcx <= 640 AND outregdx >= 8 AND outregdx <= 16 AND outregbx <> 0 THEN
         END
      END IF
WEND
CALL INTERRUPT(&H33, &H2, 0, 0, 0)
END

SUB InitInterrupt
PoiSeg% = VARSEG(outregbx)
PoiPos% = VARPTR(outregbx)
bxSLow% = (PoiSeg% MOD 256)
bxSHigh% = INT(PoiSeg% / 256)
bxPLow% = (PoiPos% MOD 256)
bxPHigh% = INT(PoiPos% / 256)
PoiSeg% = VARSEG(outregcx)
PoiPos% = VARPTR(outregcx)
cxSLow% = (PoiSeg% MOD 256)
cxSHigh% = INT(PoiSeg% / 256)
cxPLow% = (PoiPos% MOD 256)
cxPHigh% = INT(PoiPos% / 256)
PoiSeg% = VARSEG(outregdx)
PoiPos% = VARPTR(outregdx)
dxSLow% = (PoiSeg% MOD 256)
dxSHigh% = INT(PoiSeg% / 256)
dxPLow% = (PoiPos% MOD 256)
dxPHigh% = INT(PoiPos% / 256)
DEF SEG = VARSEG(InterFeld(0))
    Poi% = VARPTR(InterFeld(0))

REM entsprechender Assemblercode ----------------
POKE Poi%, &HB8
POKE Poi% + 1, &H0
POKE Poi% + 2, &H0
POKE Poi% + 3, &HBB
POKE Poi% + 4, &H0
POKE Poi% + 5, &H0
POKE Poi% + 6, &HB9
POKE Poi% + 7, &H0
POKE Poi% + 8, &H0
POKE Poi% + 9, &HBA
POKE Poi% + 10, &H0
POKE Poi% + 11, &H0
POKE Poi% + 12, &HCD
POKE Poi% + 13, &H0
POKE Poi% + 14, &H6
POKE Poi% + 15, &H56
POKE Poi% + 16, &HB8
POKE Poi% + 17, cxSLow%
POKE Poi% + 18, cxSHigh%
POKE Poi% + 19, &H8E
POKE Poi% + 20, &HC0
POKE Poi% + 21, &HB8
POKE Poi% + 22, cxPLow%
POKE Poi% + 23, cxPHigh%
POKE Poi% + 24, &H8B
POKE Poi% + 25, &HF0
POKE Poi% + 26, &H26
POKE Poi% + 27, &H88
POKE Poi% + 28, &HC
POKE Poi% + 29, &H26
POKE Poi% + 30, &H88
POKE Poi% + 31, &H6C
POKE Poi% + 32, &H1
POKE Poi% + 33, &HB8
POKE Poi% + 34, dxSLow%
POKE Poi% + 35, dxSHigh%
POKE Poi% + 36, &H8E
POKE Poi% + 37, &HC0
POKE Poi% + 38, &HB8
POKE Poi% + 39, dxPLow%
POKE Poi% + 40, dxPHigh%
POKE Poi% + 41, &H8B
POKE Poi% + 42, &HF0
POKE Poi% + 43, &H26
POKE Poi% + 44, &H88
POKE Poi% + 45, &H14
POKE Poi% + 46, &H26
POKE Poi% + 47, &H88
POKE Poi% + 48, &H74
POKE Poi% + 49, &H1
POKE Poi% + 50, &HB8
POKE Poi% + 51, bxSLow%
POKE Poi% + 52, bxSHigh%
POKE Poi% + 53, &H8E
POKE Poi% + 54, &HC0
POKE Poi% + 55, &HB8
POKE Poi% + 56, bxPLow%
POKE Poi% + 57, bxPHigh%
POKE Poi% + 58, &H8B
POKE Poi% + 59, &HF0
POKE Poi% + 60, &H26
POKE Poi% + 61, &H88
POKE Poi% + 62, &H1C
POKE Poi% + 63, &H26
POKE Poi% + 64, &H88
POKE Poi% + 65, &H7C
POKE Poi% + 66, &H1
POKE Poi% + 67, &H5E
POKE Poi% + 68, &H7
POKE Poi% + 69, &HCB
DEF SEG
END SUB

SUB INTERRUPT (Nr%, iax%, ibx%, icx%, idx%)
ah% = INT(iax% / 256)
bh% = INT(ibx% / 256)
ch% = INT(icx% / 256)
dh% = INT(idx% / 256)
a1% = (iax% MOD 256)
b1% = (ibx% MOD 256)
c1% = (icx% MOD 256)
d1% = (idx% MOD 256)
DEF SEG = VARSEG(InterFeld(0))
    Poi% = VARPTR(InterFeld(0))
    POKE Poi% + 1, a1%
    POKE Poi% + 2, ah%
    POKE Poi% + 4, b1%
    POKE Poi% + 5, bh%
    POKE Poi% + 7, c1%
    POKE Poi% + 8, ch%
    POKE Poi% + 10, d1%
    POKE Poi% + 11, dh%
    POKE Poi% + 13, Nr%
    CALL absolute(Poi%)
DEF SEG

END SUB

