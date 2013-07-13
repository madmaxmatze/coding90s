CLS
DO
  I$ = INKEY$
  st$ = st$ + I$
  IF I$ = CHR$(8) AND zahl > 0 THEN
     zahl = zahl - 1: st$ = LEFT$(st$, zahl)
     LOCATE s + 1, zahl + 1: PRINT " "
  END IF
  IF I$ <> "" AND I$ <> CHR$(27) AND I$ <> CHR$(8) AND I$ <> CHR$(13) THEN
     IF zahl = 80 THEN zahl = 0: s = s + 1
     zahl = zahl + 1: LOCATE s + 1, zahl: PRINT I$
  END IF
 
  IF I$ = CHR$(27) THEN END
LOOP UNTIL I$ = CHR$(13)
LOCATE s + 2, 1: PRINT st$







