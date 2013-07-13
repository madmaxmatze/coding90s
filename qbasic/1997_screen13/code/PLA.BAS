REM PLASMA-Generator --------------------------------------
DECLARE SUB setpal (j)
DECLARE SUB subdivide (x1, y1, x2, y2)
DECLARE SUB newcol (xa, ya, x, y, xb, yb)
DECLARE SUB setrgb (nr, r, g, B)

DEFINT A-Z
CONST rauheit! = 5
RANDOMIZE TIMER

SCREEN 13
setpal 0

REM aufruf subdivide !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

WHILE INKEY$ = ""
setpal (1)
j = j + 1
LINE (20, 20)-STEP(100, 100), 12, BF
LINE (19, 19)-STEP(101, 101), 10, B
LINE (160, 20)-STEP(100, 100), 10, BF
LINE (159, 19)-STEP(101, 101), 12, B
WEND

SCREEN 0

DEFSNG A-Z
SUB newcol (xa, ya, x, y, xb, yb)
col = ABS(xa - xb) + ABS(ya - yb)
col = RND * rauheit! * col - col
col = (col + POINT(xa, ya) + POINT(xb, yb)) / 2
IF col < 1 THEN col = 1
IF col > 163 THEN col = 1
IF POINT(x, y) = 0 THEN PSET (x, y), col
END SUB

SUB setpal (j)
FOR i = 1 TO 63
 CALL setrgb(i + j, 0, 63 - i, i)
 CALL setrgb(i + 63 + j, i, 0, 63 - i)
 CALL setrgb(i + 126 + j, 63 - i, i, 0)
NEXT
END SUB

SUB setrgb (nr, r, g, B)
OUT &H3C8, 4
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, B
END SUB

SUB subdivide (x1, y1, x2, y2)
IF NOT (x2 - x1 < 1 AND y2 - y1 < 1) THEN
  x = (x1 + x2) / 2
  y = (y1 + y2) / 2
  newcol x1, y1, x, y1, x2, y1
  newcol x2, y1, x2, y, x2, y2
  newcol x1, y2, x, y2, x2, y2
  newcol x1, y1, x1, y, x1, y2
  col = POINT(x1, y1) + POINT(x2, y1) + POINT(x2, y2) + POINT(x1, y2)
  col = col / 4
  PSET (x, y), col
  subdivide x1, y1, x, y
  subdivide x, y1, x2, y
  subdivide x, y, x2, y2
  subdivide x1, y, x, y2
END IF
END SUB

