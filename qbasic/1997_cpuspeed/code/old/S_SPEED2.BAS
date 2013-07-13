CLS
DO
r = r + 1
IF r = 24 THEN r = 1: CLS
starttime = TIMER
FOR i# = 1 TO 100000: NEXT i#
stoptime = TIMER
speed = 10 / (stoptime - starttime)

starttime = TIMER
FOR a = 1 TO speed * 1000: NEXT a
stoptime = TIMER

s = (stoptime - starttime) * 100000

IF s > 7500 AND s < 12500 THEN
   IF s > 7500 AND s < 10000 THEN c = 4
   IF s >= 10000 AND s < 12500 THEN c = 2
ELSE
   c = 15
END IF

COLOR c: LOCATE r, 45: PRINT USING "###.###"; s
COLOR 15: LOCATE r, 1: PRINT USING "## -      Speed = ###.###             Zeit = "; 10; speed
                             
LOOP UNTIL INKEY$ <> ""

