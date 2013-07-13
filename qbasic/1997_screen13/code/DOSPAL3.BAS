SCREEN 0
CLS

FOR bal = 1 TO 31
    COLOR bal
    LOCATE 2, bal: PRINT "²"
NEXT bal

start:

FOR nr = 1 TO 16 * 5
 RANDOMIZE TIMER
 zufi = INT(RND * 255)
 zufi2 = INT(RND * 255)
 zufi3 = INT(RND * 255)
    FOR s = 1 TO 200: NEXT s
    r = zufi: g = zufi2: b = zufi3
    COLOR 1
    LOCATE 1, 1: PRINT "Paletten manipulation Farbwert:"; nr
    GOSUB pal
NEXT nr

END


REM Palettenwerte -----------------------------------------
pal:
 OUT &H3C8, nr
 OUT &H3C9, r
 OUT &H3C9, g
 OUT &H3C9, b
RETURN

