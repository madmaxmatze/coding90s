REM Mathias--------------------------------------------------------------------------------
SCREEN 13
CLS
startTime# = TIMER

DO
zx = INT(320 * RND)
zy = INT(200 * RND)
PSET (zx, zy), zy - zx
a = a + 1: LOCATE 1, 1: PRINT USING "Sterne:###,###"; a
w = TIMER - startTime#: LOCATE 2, 1: PRINT USING "Zeit: ########"; w
LOOP WHILE INKEY$ = ""

