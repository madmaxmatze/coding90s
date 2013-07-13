CLS
d = 2097150
DO
  d = d + 1
  okt$ = OCT$(d): okt = VAL(okt$)
  dez = 0
  DO
    IF okt >= 1000000 AND okt < 7777778 THEN dez = dez + 262144: okt = okt - 1000000
    IF okt >= 100000 AND okt < 777778 THEN dez = dez + 32768: okt = okt - 100000
    IF okt >= 10000 AND okt < 77778 THEN dez = dez + 4096: okt = okt - 10000
    IF okt >= 1000 AND okt < 7778 THEN dez = dez + 512: okt = okt - 1000
    IF okt >= 100 AND okt < 778 THEN dez = dez + 64: okt = okt - 100
    IF okt >= 10 AND okt < 78 THEN dez = dez + 8: okt = okt - 10
    IF okt < 10 THEN dez = dez + okt: okt = 0
  LOOP UNTIL okt = 0
PRINT dez
LOOP UNTIL d <> dez

