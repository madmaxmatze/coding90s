DIM AX(0 TO 80, 1 TO 60) AS INTEGER, AY(0 TO 40, 1 TO 60) AS INTEGER
DIM X(1 TO 100) AS INTEGER, Y(1 TO 100) AS INTEGER, Z(1 TO 100) AS INTEGER
DIM i AS INTEGER
DEF SEG = VARSEG(AX(0, 1))
BLOAD "C:\qbasic\sterne\demox.dat", VARPTR(AX(0, 1))
DEF SEG = VARSEG(AY(0, 1))
BLOAD "C:\qbasic\sterne\demoy.dat", VARPTR(AY(0, 1))
DEF SEG
FOR i = 1 TO 100
X(i) = INT(RND * 81)    '  81
Y(i) = INT(RND * 41)    '  41
Z(i) = INT(RND * 60)    '  60
NEXT
SCREEN 9: CLS
DO
LINE (200, 250)-(440, 250), 8
LINE (0, 350)-(200, 250), 8
LINE (440, 250)-(640, 350), 8

LINE (200, 100)-(440, 100), 8
LINE (0, 0)-(200, 100), 8
LINE (440, 100)-(640, 0), 8

LINE (200, 100)-(200, 250), 8
LINE (440, 100)-(440, 250), 8

LINE (320, 300)-(330, 350), 7, BF

start:
     FOR i = 1 TO 100
         LINE (AX(X(i), Z(i)), AY(Y(i), Z(i)))-(AX(X(i), Z(i) + 1), AY(Y(i), Z(i) + 1)), 0
         Z(i) = Z(i) + 28
         IF Z(i) >= 59 THEN Z(i) = 1: X(i) = INT(RND * 81): Y(i) = INT(RND * 41)
         LINE (AX(X(i), Z(i)), AY(Y(i), Z(i)))-(AX(X(i), Z(i) + 1), AY(Y(i), Z(i) + 1)), 14
     NEXT
LOOP
END

