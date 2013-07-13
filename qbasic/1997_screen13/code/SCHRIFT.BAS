SCREEN 13
LOCATE 1, 5: PRINT "H a l l o"

LINE (0, 15)-STEP(319, 0)

FOR y = 0 TO 30
    FOR x = 0 TO 319
    col = POINT(x, y)
        SELECT CASE (col)
               CASE IS = 0
                    PSET (x, y), 0
               CASE IS = 15
                    PSET (x, y), 40 + (RND * 21)
                    PSET (x + 1, y + 1), 22
                    PSET (x + 2, y + 2), 22
                    PSET (x + 3, y + 3), 22
                    PSET (x + 4, y + 4), 22
                    PSET (x, y + 50), 40: PSET (x + 1, y + 51), 22: PSET (x + 2, y + 52), 22: PSET (x + 3, y + 53), 22: PSET (x + 4, y + 54), 22
                    PSET ((x - 30) * 3, (y + 30) * 3), 40: PSET ((x - 29) * 3, (y + 31) * 3), 22: PSET ((x - 28) * 3, (y + 32) * 3), 22: PSET ((x - 27) * 3, (y + 33) * 3), 22: PSET ((x - 26) * 3, (y + 34) * 3), 22
        END SELECT
    NEXT x
NEXT y
SLEEP
END




