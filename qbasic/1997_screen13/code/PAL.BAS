'-------------------------------- Mathias -----------------------------------------
CLS
SCREEN 13

DEF SEG = &HA000
nr = 0:  r = 255: b = 255: g = 255
SHELL "C:\qbasic\screen13\bmp.exe C:\qbasic\screen13\saal.bmp"
FOR a = 1 TO 255
LINE (a, 0)-(a, 10), a
NEXT
SLEEP 1

start:
FOR r = 1 TO 255
    IF r = 255 THEN nr = nr + 1:  r = nr / 4: b = nr / 4: g = nr / 4
    GOSUB pal
NEXT

IF INKEY$ = " " THEN END
GOSUB start


'--------------------------------- Palette -----------------------------------------
pal:
OUT &H3C8, nr
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
RETURN



















