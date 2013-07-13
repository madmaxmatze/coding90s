CLS

starttime = TIMER
FOR i# = 1 TO 10000: NEXT i#
stoptime = TIMER
speed = 1 / (stoptime - starttime)

DO
r = r + 1
IF r = 23 THEN r = 1: CLS
LOCATE 1, 1: PRINT "S P E E D = "; speed

starttime = TIMER
FOR a = 1 TO speed * 1000: NEXT a
stoptime = TIMER

s = (stoptime - starttime) * 100000

IF s > 8000 AND s < 12000 THEN
   IF s > 8000 AND s < 10000 THEN c = 2
   IF s >= 10000 AND s < 12000 THEN c = 2
ELSE
   c = 4
END IF

COLOR c: LOCATE r + 1, 15: PRINT USING "######.#######"; s
COLOR 15: LOCATE r + 1, 1: PRINT USING "## -   Zeit = "; r;
                             
LOOP UNTIL INKEY$ <> ""

