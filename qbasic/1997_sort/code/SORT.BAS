REM JAN MossPOWER *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
SCREEN 12
CLS
DIM namen$(100)


REM Daten einlesen ----------------------------------------------------------------
RESTORE anfang
k = 0: s = 45                                 'k=Anzahl der Elemente -------------------
READ namen$(k)
DO WHILE namen$(k) <> "***"
   k = k + 1
   READ namen$(k)
LOOP

REM Daten anzeigen -----------------------------------------------------------------
LOCATE 1, 3: PRINT "unsortiert:"
FOR l = 0 TO k - 1
    LOCATE l + 2, 2: PRINT l + 1, namen$(l)
NEXT l

REM sortieren ---------------------------  ------------ ------------ ---------------
COLOR 14
LOCATE 1, 46: PRINT "sortiert:"
SLEEP
GOSUB sort
END

sort:
FOR q = 0 TO k - 1
    p = q + 1
        FOR o = q TO k
            IF namen$(o) > namen$(p) GOTO weiter
            p = o
weiter:
    NEXT o
    w$ = namen$(p)
    namen$(p) = namen$(q)
    namen$(q) = w$
LOCATE 1 + q, s
IF q > 0 THEN PRINT q, namen$(q)
FOR dummy = 1 TO 1000: NEXT
NEXT q
LOCATE 1 + q, s: PRINT q + 1, namen$(k)
RETURN


REM Daten (Namen) ------------------------  -----------  -----------  ----------  -
anfang:
DATA "Heinz", "Horst","Reiner","Stefan"
DATA "Pawel", "Matthias","Enrico","Ronny"
DATA "Katja", "Bianca","Z”sch","R”hl"
DATA "Dieter","Karl","Hinz","Kunz"
DATA "Bata","Oddy","Sebastian","Bernd"
DATA "Berger","Steve","Picho","Stefanlein"
DATA "***"





