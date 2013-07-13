REM Mathias
CLS
SCREEN 12
x = 100: y = 100: w = 1: dx = 1: dy = 1
a$ = "c8 r50 f10 c14 d50 c8 h10 f10 c14 l50 c8 h10 u50 f10 c14 r50 bh10 c8 d50 l50 bf10 c14 u50 r50 bg25 "

farb$ = "c12"

DO
 w = w + 1
 x = x + dx: y = y + dy
 xy$ = "bm" + STR$(x) + "," + STR$(y)
 IF w > 359 THEN w = -w
 IF x > 600 OR x < 50 THEN dx = -dx
 IF y > 400 OR y < 50 THEN dy = -dy
 w$ = "ta" + STR$(w)
GOSUB zeichnen
LOOP WHILE INKEY$ = ""
END

zeichnen:
LINE (x - 90, y - 90)-STEP(90 * 2, 90 * 2), 0, BF
DRAW farb$ + xy$ + a$ + "ta" + w$

RETURN

