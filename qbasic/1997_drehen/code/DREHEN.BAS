REM Mathias---------------------------------------------------------------------------
CLS
SCREEN 12
x = 100: y = 100: wink = 1: dx = 1: dy = 1
a$ = "l20 c8 l20 c4 d20 c10 r40 c2 e40 c13 r60 c14 u10": farb$ = "c12"

DO
 zufi = 1 + INT(RND * 20)
 x = x + dx: y = y + dy
 xy$ = "bm" + STR$(x) + "," + STR$(y)
 wink = wink + 2
 IF wink = 359 THEN wink = 1
 IF x > 600 OR x < 50 THEN dx = -dx
 IF y > 400 OR y < 50 THEN dy = -dy
 DRAW farb$ + xy$ + a$ + "ta" + STR$(wink)
 FOR a = 1 TO 1000: NEXT a
LOOP WHILE INKEY$ = ""
END

                










