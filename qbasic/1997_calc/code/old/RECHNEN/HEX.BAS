CLS
INPUT "", Hez$
Hez$ = UCASE$(Hez$)
LOCATE 1, 1: PRINT Hez$
l = LEN(Hez$)
FOR t = 1 TO l
    r = ASC(MID$(Hez$, t, 1))
    r = r - 48
    IF r > 9 THEN r = r - 7
    dez = dez + r * 16 ^ (l - t)
NEXT t

LOCATE 22, 1: PRINT USING "############"; dez
SLEEP
RUN

