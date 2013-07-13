CLS
DO
r = r + 1
IF r = 24 THEN r = 1
starttime = TIMER
FOR i# = 1 TO r * 10000: NEXT i#
stoptime = TIMER
speed = 10 / (stoptime - starttime)

starttime = TIMER
FOR a = 1 TO speed * r * 1000: NEXT a
stoptime = TIMER

IF stoptime - starttime > .8 AND stoptime - starttime < 1.2 THEN
   IF stoptime - starttime > .8 AND stoptime - starttime < 1 THEN c = 4
   IF stoptime - starttime >= 1 AND stoptime - starttime < 1.2 THEN c = 2
ELSE
   c = 15
END IF

COLOR c: LOCATE r, 45: PRINT USING "###.###"; stoptime - starttime
COLOR 15: LOCATE r, 1: PRINT USING "## -      Speed = ###.###             Zeit = "; r; speed
                             
LOOP UNTIL INKEY$ <> ""

