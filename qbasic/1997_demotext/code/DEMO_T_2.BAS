REM Mirco -----------------------------------------------------------
' ------------------------------------ Bildschirm einstellen --------
SCREEN 0
CLS
' ------------------------------------ Variablen declarieren --------
RANDOMIZE TIMER
 zufi = INT(RND * 10)
zeichen$ = CHR$(zufi)
a$ = zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    " + zeichen$ + "    "
big1$ = "DDDD   EEEE  MM   MM   OOO          TTTTT  EEEE  X   X  TTTTT"
big2$ = "D   D  E     M M M M  O   O           T    E      X X     T   "
big3$ = "D   D  EEEE  M  M  M  O   O  ²²²²²    T    EEEE    X      T   "
big4$ = "D   D  E     M     M  O   O           T    E      X X     T    "
big5$ = "DDDD   EEEE  M     M   OOO            T    EEEE  X   X    T    "
' ------------------------------------ Hauptprogramm ----------------
GOSUB text
WHILE INKEY$ <> "": WEND                            ' Tastatur Puffer l”schen
      WHILE INKEY$ = ""
            COLOR 14
             FOR x = 1 TO 5
                 LOCATE 1, 1: PRINT MID$(a$, x, 80)
                 FOR dummy = 1 TO 600: NEXT dummy
                 LOCATE 22, 1: PRINT MID$(a$, 6 - x, 80)
                  
                  FOR y = 2 TO 21
                      c = (x + y) MOD 4
                      IF c = 1 THEN
                         LOCATE y, 80: PRINT zeichen$
                         LOCATE 23 - y, 1: PRINT zeichen$
                      ELSE
                         LOCATE y, 80: PRINT " "
                         LOCATE 23 - y, 1: PRINT " "
                      END IF
                  NEXT y
             NEXT x
      WEND
END


' ------------------------------------ Unterprogramm "Text" ---------
text:
 COLOR 10
 LOCATE 10, 10: PRINT big1$
 LOCATE 11, 10: PRINT big2$
 LOCATE 12, 10: PRINT big3$
 LOCATE 13, 10: PRINT big4$
 LOCATE 14, 10: PRINT big5$

RETURN

