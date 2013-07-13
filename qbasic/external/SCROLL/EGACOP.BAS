DECLARE SUB AbsEgaCopyLow (x1%, y1%, x2%, y2%, br%, ho%)
DECLARE SUB scroll (y AS INTEGER)
DIM SHARED e1(0 TO 67) AS INTEGER

Verz% = 1000
GOSUB AssemblerDatenLesen
SCREEN 7
CLS

LINE (0, 0)-(319, 199), 2, BF
LINE (20, 0)-(120, 199), 8
LINE (120, 0)-(220, 199), 8
PAINT (30, 0), 8
CALL AbsEgaCopyLow(0, 0, 0, 200, 40, 200)

LINE (0, 0)-(319, 199), 2, BF
LINE (120, 0)-(20, 199), 8
LINE (220, 0)-(120, 199), 8
PAINT (130, 0), 8
CALL AbsEgaCopyLow(0, 0, 0, 400, 40, 200)

LINE (0, 0)-(319, 199), 2, BF
LINE (20, 0)-(120, 199), 8, BF
CALL AbsEgaCopyLow(0, 0, 0, 600, 40, 200)

i$ = INKEY$
WHILE i$ <> CHR$(27)
      FOR y% = 0 TO 600
          CALL scroll(y%)
          FOR v% = 0 TO Verz%: NEXT v%
      NEXT y%
      IF i$ = "+" THEN Verz% = Verz% - 100
      IF i$ = "-" THEN Verz% = Verz% + 100
WEND
END

AssemblerDatenLesen:
RESTORE AssemblerDaten
DEF SEG = VARSEG(e1(0))
    poi% = VARPTR(e1(0))
    FOR i% = 0 TO 135
        READ a$
        IF VAL(a$) = 999 THEN EXIT FOR
        POKE poi% + i%, VAL(a$)
    NEXT
DEF SEG

DEF SEG = VARSEG(e1(0))
    poi% = VARPTR(e1(0))
    POKE poi% + 10, 5
    POKE poi% + 14, 3
    POKE poi% + 36, 5
    POKE poi% + 40, 3
    POKE poi% + 71, 40
DEF SEG
RETURN

AssemblerDaten:
DATA 030
DATA 006
DATA 087
DATA 086
DATA 187,000,000
DATA 139,195
DATA 177,006
DATA 211,227
DATA 177,004
DATA 211,224
DATA 003,195
DATA 186,000,000
DATA 177,003
DATA 211,234
DATA 003,194
DATA 139,240
DATA 187,000,000
DATA 139,195
DATA 177,006
DATA 211,227
DATA 177,004
DATA 211,224
DATA 003,195
DATA 186,000,000
DATA 177,003
DATA 211,234
DATA 003,194
DATA 139,248
DATA 184,000,160
DATA 142,192
DATA 185,000,000
DATA 186,206,003
DATA 187,000,000
DATA 184,080,000
DATA 043,195
DATA 142,216
DATA 184,005,001
DATA 239
DATA 050,237
DATA 050,255
DATA 051,192
DATA 038,138,060
DATA 038,136,061
DATA 071
DATA 070
DATA 254,197
DATA 058,235
DATA 117,242
DATA 064
DATA 058,193
DATA 116,012
DATA 050,237
DATA 080
DATA 140,216
DATA 003,248
DATA 003,240
DATA 088
DATA 235,225
DATA 094
DATA 095
DATA 007
DATA 031
DATA 203
DATA 999
DATA 139,195
DATA 139,195
DATA 139,195

SUB AbsEgaCopyLow (x1%, y1%, x2%, y2%, br%, ho%)
x1h% = INT(x1% / 256)
x2h% = INT(x2% / 256)
y1h% = INT(y1% / 256)
y2h% = INT(y2% / 256)
brh% = INT(br% / 256)
hoh% = INT(ho% / 256)

x1l% = INT(x1% MOD 256)
x2l% = INT(x2% MOD 256)
y1l% = INT(y1% MOD 256)
y2l% = INT(y2% MOD 256)
brl% = INT(br% MOD 256)
hol% = INT(ho% MOD 256)

DEF SEG = VARSEG(e1(0))
    poi% = VARPTR(e1(0))
    POKE poi% + 5, y1l%
    POKE poi% + 6, y1h%
    POKE poi% + 20, x1l%
    POKE poi% + 21, x1h%
    POKE poi% + 31, y2l%
    POKE poi% + 32, y2h%
    POKE poi% + 46, x2l%
    POKE poi% + 47, x2h%
    POKE poi% + 62, hol%
    POKE poi% + 63, hoh%
    POKE poi% + 68, brl%
    POKE poi% + 69, brh%
    CALL absolute(poi%)
DEF SEG
END SUB

SUB scroll (y AS INTEGER)
Adresse% = y * 40
Highbyte% = INT(Adresse% / 256)
Lowbyte% = INT(Adresse% MOD 256)
OUT &H3D4, &HD
OUT &H3D5, Lowbyte%
OUT &H3D4, &HC
OUT &H3D5, Highbyte%
END SUB

