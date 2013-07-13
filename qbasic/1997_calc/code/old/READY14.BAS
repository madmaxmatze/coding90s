DECLARE SUB AufScroll (AA$, AB$, aw, sf, hf, fhf, fvf, her, avf, ahf, ton, m)
DECLARE SUB ENDE (sf, fhf, fvf, her, ton)
DECLARE SUB Fenstermacher (x, Y, addx, addy, sf, hf, fhf, fvf, cl)
DECLARE SUB HauptFensterInhalt (aw, AA$, AB$, m, fhf, fvf, avf, ahf)
DECLARE SUB Hilfe (fvf, fhf)
DECLARE SUB Options (sf, hf, fhf, fvf, avf, ahf, her, ton)
DECLARE SUB Rechnen (AA$, AB$, fhf, fvf)
DECLARE SUB SeitenFenster (AA$, AB$, m, sf, hf, fhf, fvf, avf, ahf, ton)
   
OPEN "c:\Qbasic\Calc\calc.dat" FOR INPUT AS #1
     INPUT #1, sf, hf, fvf, fhf, avf, ahv, ahf, her, ton
CLOSE #1

aw = 1
AA$ = " Dez "
AB$ = " Hex "

COLOR , hf: CLS

x = 25: Y = 3: addx = 31: addy = 3
Fenstermacher x, Y, addx, addy, sf, hf, fhf, fvf, cl
COLOR fvf, fhf: LOCATE 5, 31: PRINT "von Mathias Nitzsche"
COLOR her, fhf: LOCATE 4, 28: PRINT "*** S U P E R  C A L C ***"

x = 25: Y = 10: addx = 31: addy = 8
Fenstermacher x, Y, addx, addy, sf, hf, fhf, fvf, cl
HauptFensterInhalt aw, AA$, AB$, m, fhf, fvf, avf, ahf

IF ton = 1 THEN SOUND 100, 2: SOUND 300, 2: SOUND 500, 2: SOUND 200, 3
IF ton = 2 THEN FOR a = 1 TO 60: SOUND 40 + a * 5, .1: SOUND 1040 - a * 5, .1: NEXT a

DO
  K$ = INKEY$
  SELECT CASE K$
         CASE CHR$(0) + "K"
              IF aw = 1 THEN IF m > -1 THEN m = m - 1: HauptFensterInhalt aw, AA$, AB$, m, fhf, fvf, avf, ahf
         CASE CHR$(0) + "M"
              IF aw = 1 THEN IF m < 1 THEN m = m + 1: HauptFensterInhalt aw, AA$, AB$, m, fhf, fvf, avf, ahf
         CASE CHR$(0) + "H"
              IF aw = 1 THEN aw = 5
              aw = aw - 1: m = 0: HauptFensterInhalt aw, AA$, AB$, m, fhf, fvf, avf, ahf
         CASE CHR$(0) + "P"
              IF aw = 4 THEN aw = 0
              aw = aw + 1: m = 0: HauptFensterInhalt aw, AA$, AB$, m, fhf, fvf, avf, ahf
         CASE CHR$(0) + CHR$(59)
              aw = 3: AufScroll AA$, AB$, aw, sf, hf, fhf, fvf, her, avf, ahf, ton, m
         CASE CHR$(13)
              IF ton = 1 THEN SOUND 100, .4
              IF aw = 4 THEN ENDE sf, fhf, fvf, her, ton
             
              'IF AW = 1 AND m = 0 AND AA$ <> AB$ THEN AufScroll AA$, AB$, AW, sf, hf, fhf, fvf, her, avf, ahf, ton, m
              'IF AA$ = AB$ THEN IF ton = 1 THEN SOUND 100, 1
              'IF AW = 2 OR 3 THEN AufScroll AA$, AB$, AW, sf, hf, fhf, fvf, her, avf, ahf, ton, m
        
              IF aw = 1 AND m <> 0 THEN SeitenFenster AA$, AB$, m, sf, hf, fhf, fvf, avf, ahf, ton: HauptFensterInhalt aw, AA$, AB$, m, fhf, fvf, avf, ahf
              IF aw = 2 OR aw = 3 THEN AufScroll AA$, AB$, aw, sf, hf, fhf, fvf, her, avf, ahf, ton, m
              IF m = 0 AND aw = 1 AND AA$ <> AB$ THEN AufScroll AA$, AB$, aw, sf, hf, fhf, fvf, her, avf, ahf, ton, m ELSE IF ton = 1 THEN SOUND 100, 1
        
         CASE ELSE
  END SELECT
LOOP UNTIL K$ = CHR$(27)
ENDE sf, fhf, fvf, her, ton

SUB AufScroll (AA$, AB$, aw, sf, hf, fhf, fvf, her, avf, ahf, ton, m)

COLOR , hf
FOR t = 10 TO 19
    LOCATE t, 25: PRINT SPACE$(33)
NEXT t

IF aw = 1 THEN a$ = SPACE$(26)
IF aw = 2 THEN a$ = " Option "
IF aw = 3 THEN a$ = " Hilfe (F1) "
s = LEN(a$)
FOR r = 9 + aw * 2 TO 9 STEP -1
    COLOR fvf, fhf
      x = 39 - s / 2: Y = r - 1: addx = s + 3: addy = 2
      Fenstermacher x, Y, addx, addy, sf, hf, fhf, fvf, cl
    COLOR avf, ahf
      IF aw <> 1 THEN LOCATE r, x + 2: PRINT a$
      IF aw = 1 THEN LOCATE r, 28: PRINT AA$: LOCATE r, 34: PRINT " umrechnen in ": LOCATE r, 49: PRINT AB$
    COLOR fvf, hf
      LOCATE r + 3, 26: PRINT SPACE$(31)
      LOCATE r + 2, x: PRINT " "
      IF ton = 0 THEN FOR a = 1 TO 4000: NEXT a
      IF ton = 1 THEN PLAY "l30ms o0b"
NEXT r

COLOR fvf, fhf: LOCATE 10, x: PRINT "ส": LOCATE 10, 42 + s / 2: PRINT "ส"

FOR o = 6 TO 38 - s / 2
    COLOR fvf, fhf: LOCATE 10, 37 + s / 2 + o: PRINT "อ": LOCATE 10, 44 - s / 2 - o: PRINT "อ"
    COLOR sf, hf: : LOCATE 11, 38 + s / 2 + o: PRINT "฿": LOCATE 11, 45 - s / 2 - o: PRINT "฿"
    IF ton = 0 THEN FOR a = 1 TO 1500: NEXT a
    IF ton = 1 THEN FOR a = 1 TO 5: SOUND 40, .1: NEXT a
NEXT o

COLOR fvf, fhf: LOCATE 10, 6: PRINT "ษ": LOCATE 10, 75: PRINT "ป"

FOR f = 10 TO 21
    COLOR fvf, fhf
      IF f > 10 THEN LOCATE f, 6: PRINT "บ"; SPACE$(68); "บ"
      LOCATE f + 1, 6: PRINT "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ"
    COLOR sf, hf
      LOCATE f + 1, 76: PRINT "Û"
      FOR u = 7 TO 76
          LOCATE f + 2, u: PRINT "฿"
      NEXT u
    IF ton = 0 THEN FOR a = 1 TO 2000: NEXT a
    IF ton = 1 THEN PLAY "l64mso1c"
NEXT f

IF aw = 1 THEN Rechnen AA$, AB$, fhf, fvf
IF aw = 2 THEN Options sf, hf, fhf, fvf, avf, ahv, her, ton
IF aw = 3 THEN Hilfe fvf, fhf

d$ = "ณ/ฤ\"
COLOR her, fhf
DO
  l = l + 1: IF l = 5 THEN l = 1
  e$ = MID$(d$, l, 1)
  LOCATE 21, 71: PRINT e$: FOR r = 1 TO 5000: NEXT
LOOP WHILE INKEY$ = ""

FOR t = (s / 2) + 2 TO 1 STEP -1
    COLOR fvf, fhf
    LOCATE 8, 41 - t: PRINT "ษ": LOCATE 8, 40 + t: PRINT "ป"
    LOCATE 9, 41 - t: PRINT "บ": LOCATE 9, 40 + t: PRINT "บ"
    LOCATE 10, 26: PRINT "ออออออออออออออออออออออออออออออ"
    LOCATE 10, 41 - t: PRINT "ส": LOCATE 10, 40 + t: PRINT "ส"
    COLOR sf, hf
    FOR u = 8 TO 9
        LOCATE u, 40 - t: PRINT " ": LOCATE u, 41 + t: PRINT " ": LOCATE 9, 41 + t: PRINT "Û "
    NEXT u
    FOR z = 1 TO 1000: NEXT z
    IF ton = 0 THEN FOR a = 1 TO 2000: NEXT a
    IF ton = 1 THEN FOR a = 1 TO 4: SOUND 40 + a * 100, .1: FOR r = 1 TO 200: NEXT r: NEXT a
NEXT t

FOR a = 8 TO 9
    LOCATE a, 38: PRINT "     "
NEXT
COLOR fvf, fhf: LOCATE 10, 40: PRINT "ออ"

Y = 10: addy = 12
FOR x = 6 TO 25
    IF x = 10 OR x = 15 OR x = 20 OR x = 25 THEN addy = addy - 1
    addx = 81 - x * 2: cl = 1
    COLOR 1, hf
    LOCATE Y + addy + 1, x: PRINT " "
    LOCATE Y + addy + 1, x + addx + 2: PRINT " "
    FOR a = 10 TO 22
        LOCATE a, x - 1: PRINT " "
        LOCATE a, x + addx + 1: PRINT "  "
    NEXT a
    FOR u = Y + addy + 2 TO 23
        LOCATE u, 1: PRINT SPACE$(80)
    NEXT
    Fenstermacher x, Y, addx, addy, sf, hf, fhf, fvf, cl
    IF ton = 0 THEN FOR a = 1 TO 3000: NEXT a
    IF ton = 1 THEN SOUND 100 + 50 * x, .1: FOR e = 1 TO 3000: NEXT
NEXT x

'+++++++++++++++++ Haupfensterinhalt einfgen +++++++++++++++++++
COLOR , fhf
FOR a = 11 TO 17
    LOCATE a, 26: PRINT SPACE$(30)
NEXT a

HauptFensterInhalt aw, AA$, AB$, m, fhf, fvf, avf, ahf

END SUB

SUB ENDE (sf, fhf, fvf, her, ton)
COLOR , 0: CLS

x = 18: Y = 20: addx = 44: addy = 2
Fenstermacher x, Y, addx, addy, sf, hf, fhf, fvf, cl

COLOR 15, 1: LOCATE 21, 20: PRINT "*** SUPER CALC - BIS ZUM NACHSTEN MAL ***"

COLOR 15, 0
IF ton = 1 THEN PLAY "MBT180o2P2P8L8GGGL2E-P24P8L8FFFL2D"
IF ton = 2 THEN FOR r = 1 TO 40: d = INT(RND * 300) + 200: SOUND d, .5: FOR o = 1 TO 3000: NEXT o: NEXT r
END
END SUB

SUB Fenstermacher (x, Y, addx, addy, sf, hf, fhf, fvf, cl)

COLOR fvf, fhf
IF Y = 20 THEN COLOR 15, 1
LOCATE Y, x: PRINT "ษ": LOCATE Y, x + addx: PRINT "ป"
LOCATE Y + addy, x: PRINT "ศ": LOCATE Y + addy, x + addx: PRINT "ผ"

FOR a = x + 1 TO x + addx - 1
    LOCATE Y + addy, a: PRINT "อ"
    LOCATE Y, a: PRINT "อ"
NEXT a

FOR a = Y + 1 TO Y + addy - 1
    LOCATE a, x: PRINT "บ"
    IF cl = 0 THEN LOCATE a, x + 1: PRINT SPACE$(addx - 1)
    LOCATE a, x + addx: PRINT "บ"
NEXT a

COLOR sf, hf
SchattenOnly:
IF x = 18 THEN COLOR 8, 0
LOCATE Y, x + addx + 1: PRINT "Ü"
FOR a = Y + 1 TO Y + addy
    LOCATE a, x + addx + 1: PRINT "Û"
NEXT a
FOR a = 1 TO addx + 1
    LOCATE Y + addy + 1, x + a: PRINT "฿"
NEXT a
END SUB

SUB HauptFensterInhalt (aw, AA$, AB$, m, fhf, fvf, avf, ahf)
COLOR fvf, fhf
IF aw = 1 AND m = 0 THEN COLOR avf, ahf
LOCATE 11, 34: PRINT " umrechnen in ": COLOR fvf, fhf
IF aw = 2 THEN COLOR avf, ahf
   LOCATE 13, 37: PRINT " Option ": COLOR fvf, fhf
IF aw = 3 THEN COLOR avf, ahf
   LOCATE 15, 35: PRINT " Hilfe (F1) ": COLOR fvf, fhf
IF aw = 4 THEN COLOR avf, ahf
   LOCATE 17, 35: PRINT " Ende (Esc) ": COLOR fvf, fhf
IF m = -1 THEN COLOR avf, ahf
   LOCATE 11, 28: PRINT AA$: COLOR fvf, fhf
IF m = 1 THEN COLOR avf, ahf
   LOCATE 11, 49: PRINT AB$: COLOR fvf, fhf
END SUB

SUB Hilfe (fvf, fhf)

COLOR fvf, fhf
LOCATE 12, 10: PRINT "Wie funktioniert das Men des Programms ?"
LOCATE 13, 10: PRINT "Was ist des dezimal Zahlensystem ?"
LOCATE 14, 10: PRINT "Was ist das hexadezimal Zahlensystem ?"
LOCATE 15, 10: PRINT "Was ist das binre Zahlensystem ?"
LOCATE 16, 10: PRINT "Was ist das oktale Zahlensystem ?"
LOCATE 17, 10: PRINT "???"
LOCATE 18, 10: PRINT "Cheaten von Savegames mit SUPER-CALC..."

END SUB

SUB Options (sf, hf, fhf, fvf, avf, ahf, her, ton)
w = 12

fvftest = fvf: fhftest = fhf: avftest = avf: ahftest = ahf

COLOR fvf, fhf
LOCATE 12, 10: PRINT "Schatten"
LOCATE 13, 10: PRINT "Hintergrundfarbe"
LOCATE 14, 10: PRINT "Fenstervordergrundfarbe"
LOCATE 15, 10: PRINT "Fensterhintergrundfarbe"
LOCATE 16, 10: PRINT "Aktive Vordergrundfarbe"
LOCATE 17, 10: PRINT "Aktive Hintergrundfarbe"
LOCATE 18, 10: PRINT "Hervorgehoben"
LOCATE 19, 10: PRINT "Sound"
FOR a = 12 TO 19
    LOCATE a, 40: PRINT "<=         =>"
NEXT
 
GOSUB akt

DO
  K$ = INKEY$
  SELECT CASE K$
         CASE CHR$(0) + "H"
              IF w = 12 THEN w = 21
              w = w - 1
              GOSUB akt
         CASE CHR$(0) + "P"
              IF w = 20 THEN w = 11
              w = w + 1
              GOSUB akt
         CASE CHR$(0) + "K"
              IF w <> 20 THEN LOCATE w, 40: COLOR avftest, fhftest: PRINT "<=": ofarb = ofarb - 1: GOSUB opfarb: FOR a = 1 TO 8000: NEXT a: LOCATE w, 40: COLOR fvftest, fhftest: PRINT "<="
         CASE CHR$(0) + "M"
              IF w <> 20 THEN LOCATE w, 51: COLOR avftest, fhftest: PRINT "=>": ofarb = ofarb + 1: GOSUB opfarb: FOR a = 1 TO 8000: NEXT a: LOCATE w, 51: COLOR fvftest, fhftest: PRINT "=>"
         CASE CHR$(13)
              IF w = 20 THEN
                 OPEN "c:\QBAsic\calc\calc.dat" FOR OUTPUT AS #1
                      PRINT #1, sf
                      PRINT #1, hf
                      PRINT #1, fvf
                      PRINT #1, fhf
                      PRINT #1, avf
                      PRINT #1, ahv
                      PRINT #1, ahf
                      PRINT #1, her
                      PRINT #1, ton
                 CLOSE #1
                 RUN
              END IF
         CASE ELSE
     END SELECT
LOOP UNTIL K$ = CHR$(27)
ENDE sf, fhf, fvf, her, ton

akt:
COLOR sf, fhftest
IF w = 12 THEN ofarb = sf: COLOR sf, ahftest
   LOCATE 12, 44: PRINT "þþþþþ": COLOR hf, fhftest
IF w = 13 THEN ofarb = hf: COLOR hf, ahftest
   LOCATE 13, 44: PRINT "þþþþþ": COLOR fvf, fhftest
IF w = 14 THEN ofarb = fvf: COLOR fvf, ahftest
   LOCATE 14, 44: PRINT "þþþþþ": COLOR fhf, fhftest
IF w = 15 THEN ofarb = fhf: COLOR fhf, ahftest
   LOCATE 15, 44: PRINT "þþþþþ": COLOR avf, fhftest
IF w = 16 THEN ofarb = avf: COLOR avf, ahftest
   LOCATE 16, 44: PRINT "þþþþþ": COLOR ahf, fhftest
IF w = 17 THEN ofarb = ahf: COLOR ahf, ahftest
   LOCATE 17, 44: PRINT "þþþþþ": COLOR her, fhftest
IF w = 18 THEN ofarb = her: COLOR her, ahftest
   LOCATE 18, 44: PRINT "þþþþþ": COLOR fvftest, fhftest
IF ton = 0 THEN r$ = " AUS "
IF ton = 1 THEN r$ = " EIN "
IF w = 19 THEN ofarb = ton: COLOR fvftest, ahftest
   LOCATE 19, 44: PRINT r$: COLOR fvftest, fhftest
IF w = 20 THEN COLOR fvftest, ahftest
   LOCATE 20, 65: PRINT "Fertig"
LOCATE 1, 1: PRINT "W:"; w, "OFarb:"; ofarb
RETURN

opfarb:
IF ofarb = -1 THEN ofarb = 15
IF ofarb = 16 THEN ofarb = 0
IF w = 12 THEN sf = ofarb
IF w = 13 THEN hf = ofarb
IF w = 14 THEN fvf = ofarb
IF w = 15 THEN fhf = ofarb
IF w = 16 THEN avf = ofarb
IF w = 17 THEN ahf = ofarb
IF w = 18 THEN her = ofarb
IF w = 19 THEN
   IF ofarb = 15 THEN ofarb = 1
   IF ofarb = 2 THEN ofarb = 0
   ton = ofarb
END IF
GOSUB akt
RETURN

END SUB

SUB Rechnen (AA$, AB$, fhf, fvf)

Zahl = 9: o = 54: G = 7

IF AA$ = " Dez " THEN f = 3: o = o + 1: G$ = "dezimale": IF AB$ = " Hex " THEN G = G + 2
IF AA$ = " Hex " THEN f = 4: o = o + 5: G$ = "hexadezimale": IF AB$ = " Dez " THEN G = G + 22: o = o + 1
IF AA$ = " Bin " THEN f = 1: G$ = "binre": G = 28
IF AA$ = " Okt " THEN f = 2: G$ = "oktale"

GOSUB unter
LOCATE 12, 10: PRINT "Geben sie eine "; G$; " Zahl mit maximal"; G; "Stellen ein:"

DO
  i$ = INKEY$: LOCATE 14, Zahl + 1: PRINT "þ"
  IF Zahl >= 10 AND i$ = CHR$(8) THEN Zahl = Zahl - 1: ST$ = LEFT$(ST$, Zahl - 9): LOCATE 14, Zahl + 1: PRINT "  "
  IF Zahl - 8 <= G THEN
     IF f > 0 THEN : IF i$ > CHR$(47) AND i$ < CHR$(50) THEN GOSUB Schreiben
     IF f > 1 THEN : IF i$ > CHR$(49) AND i$ < CHR$(56) THEN GOSUB Schreiben
     IF f > 2 THEN : IF i$ > CHR$(55) AND i$ < CHR$(59) THEN GOSUB Schreiben
     IF f > 3 THEN : IF i$ > CHR$(64) AND i$ < CHR$(71) OR i$ > CHR$(96) AND i$ < CHR$(103) THEN GOSUB Schreiben
  END IF
  IF i$ = CHR$(27) THEN ENDE sf, fhf, fvf, her, ton
LOOP UNTIL i$ = CHR$(13)

LOCATE 14, Zahl + 1: PRINT " "

IF f = 3 THEN dez = VAL(ST$)
IF f = 4 THEN Hez$ = ST$
IF f = 1 THEN Bin$ = ST$
IF f = 2 THEN okt = VAL(ST$)

IF AA$ = " Dez " AND AB$ = " Hex " THEN GOSUB Dez.Hez
IF AA$ = " Dez " AND AB$ = " Bin " THEN GOSUB Dez.Bin
IF AA$ = " Dez " AND AB$ = " Okt " THEN GOSUB Dez.Okt
IF AA$ = " Hex " AND AB$ = " Dez " THEN GOSUB Hez.Dez
IF AA$ = " Hex " AND AB$ = " Bin " THEN GOSUB Hez.Dez: GOSUB Dez.Bin
IF AA$ = " Hex " AND AB$ = " Okt " THEN GOSUB Hez.Dez: GOSUB Dez.Okt
IF AA$ = " Bin " AND AB$ = " Dez " THEN GOSUB Bin.Dez
IF AA$ = " Bin " AND AB$ = " Hex " THEN GOSUB Bin.Dez: GOSUB Dez.Hez
IF AA$ = " Bin " AND AB$ = " Okt " THEN GOSUB Bin.Dez: GOSUB Dez.Okt
IF AA$ = " Okt " AND AB$ = " Dez " THEN GOSUB Okt.Dez
IF AA$ = " Okt " AND AB$ = " Hex " THEN GOSUB Okt.Dez: GOSUB Dez.Hez
IF AA$ = " Okt " AND AB$ = " Bin " THEN GOSUB Okt.Dez: GOSUB Dez.Bin

Zahl = 14: o = 23
IF AB$ = " Dez " THEN LOCATE 17, 10: PRINT "Die dezimale Zahl lautet:": LOCATE 19, 11: PRINT dez: o = 25
IF AB$ = " Hex " THEN LOCATE 17, 10: PRINT "Die hexadezimale Zahl lautet:": LOCATE 19, 10: PRINT Hez$: o = 29
IF AB$ = " Bin " THEN LOCATE 17, 10: PRINT "Die binre Zahl lautet:": LOCATE 19, 10: PRINT Bin$
IF AB$ = " Okt " THEN LOCATE 17, 10: PRINT "Die oktale Zahl lautet:": LOCATE 19, 10: PRINT okt$
GOSUB unter
GOTO w

Dez.Hez:
Hez$ = HEX$(dez)
RETURN

Dez.Bin:
DO
  rest = dez MOD 2
  dez = dez / 2
  IF rest = 0 THEN Bin$ = "0" + Bin$ ELSE dez = dez - .5: Bin$ = "1" + Bin$
LOOP UNTIL dez = 0
RETURN

Dez.Okt:
okt$ = OCT$(dez)
RETURN

Hez.Dez:
Hez$ = UCASE$(Hez$)
COLOR 15, fhf: LOCATE 14, 10: PRINT Hez$
n = LEN(Hez$)
FOR l = 1 TO n
    x = ASC(MID$(Hez$, l, 1))
    x = x - 48
    IF x > 9 THEN x = x - 7
    dez = dez + x * 16 ^ (n - l)
NEXT l
RETURN

Bin.Dez:
m = LEN(Bin$)
FOR l = 1 TO m
    x = ASC(RIGHT$(Bin$, l))
    x = x - 48
    d = x * 2 ^ (l - 1): dez = d + dez
NEXT
RETURN

Okt.Dez:
DO
  IF okt >= 1000000 THEN dez = dez + 262144: okt = okt - 1000000
  IF okt >= 100000 AND okt < 777778 THEN dez = dez + 32768: okt = okt - 100000
  IF okt >= 10000 AND okt < 77778 THEN dez = dez + 4096: okt = okt - 10000
  IF okt >= 1000 AND okt < 7778 THEN dez = dez + 512: okt = okt - 1000
  IF okt >= 100 AND okt < 778 THEN dez = dez + 64: okt = okt - 100
  IF okt >= 10 AND okt < 78 THEN dez = dez + 8: okt = okt - 10
  IF okt < 10 THEN dez = dez + okt: okt = 0
LOOP UNTIL okt = 0
RETURN

Schreiben:
Zahl = Zahl + 1
LOCATE 14, Zahl: PRINT i$
ST$ = ST$ + i$
RETURN

unter:
COLOR fvf, fhf: FOR t = 1 TO o: LOCATE Zahl + 4, t + 9: PRINT "ฤ": NEXT t
RETURN

w:
END SUB

SUB SeitenFenster (AA$, AB$, m, sf, hf, fhf, fvf, avf, ahf, ton)

IF m = -1 THEN
   posx = 11
   IF AA$ = " Dez " THEN Fa = 1
   IF AA$ = " Hex " THEN Fa = 2
   IF AA$ = " Bin " THEN Fa = 3
   IF AA$ = " Okt " THEN Fa = 4
   a$ = "ษอออออออหอออออน"
   FOR l = 1 TO 15
       IF l > 2 THEN COLOR sf, hf: LOCATE 12, 27 - l: PRINT "฿"
       x$ = RIGHT$(a$, l): COLOR fvf, fhf: LOCATE 11, 26 - l: PRINT x$
      IF ton = 0 THEN FOR a = 1 TO 2500: NEXT a
       IF ton = 1 THEN FOR a = 1 TO 5: SOUND 40, .1: NEXT a
   NEXT l
ELSE
   posx = 62
   IF AB$ = " Dez " THEN Fa = 1
   IF AB$ = " Hex " THEN Fa = 2
   IF AB$ = " Bin " THEN Fa = 3
   IF AB$ = " Okt " THEN Fa = 4
   a$ = "ฬอออออหอออออออป"
   B$ = "Û฿฿฿฿฿฿฿฿฿฿฿฿฿฿"
   FOR l = 1 TO 16
       COLOR sf, hf: Y$ = LEFT$(B$, l): LOCATE 12, 57: PRINT Y$
       COLOR fvf, fhf: x$ = LEFT$(a$, l): LOCATE 11, 56: PRINT x$
       IF ton = 0 THEN FOR a = 1 TO 2500: NEXT a
       IF ton = 1 THEN FOR a = 1 TO 5: SOUND 40, .1: NEXT a
   NEXT l
END IF

FOR a = 12 TO 16
    COLOR fvf, fhf
      IF a > 12 THEN LOCATE a - 1, posx: PRINT "บ       บ"
      LOCATE a, posx: PRINT "ศอออออออผ"
    COLOR sf, hf
      LOCATE a, posx + 9: PRINT "Û"
      LOCATE a + 1, posx + 1: PRINT "฿฿฿฿฿฿฿฿฿"
      GOSUB aktiv
      IF ton = 0 THEN FOR j = 1 TO 3000: NEXT j
      IF ton = 1 THEN FOR j = 1 TO 3000: NEXT j: SOUND 80, .5
NEXT a

DO
  K$ = INKEY$
  SELECT CASE K$
         CASE CHR$(0) + "H"
              IF Fa = 1 THEN Fa = 5
              Fa = Fa - 1
              GOSUB aktiv
         CASE CHR$(0) + "P"
              IF Fa = 4 THEN Fa = 0
              Fa = Fa + 1
              GOSUB aktiv
         CASE CHR$(13)
              GOTO endofsub
         CASE ELSE
     END SELECT
LOOP UNTIL K$ = CHR$(27)
ENDE sf, fhf, fvf, her, ton

aktiv:
IF Fa = 1 THEN COLOR avf, ahf ELSE COLOR fvf, fhf
   IF a > 12 THEN LOCATE 12, posx + 2: PRINT " Dez "
IF Fa = 2 THEN COLOR avf, ahf ELSE COLOR fvf, fhf
   IF a > 13 THEN LOCATE 13, posx + 2: PRINT " Hex "
IF Fa = 3 THEN COLOR avf, ahf ELSE COLOR fvf, fhf
   IF a > 14 THEN LOCATE 14, posx + 2: PRINT " Bin "
IF Fa = 4 THEN COLOR avf, ahf ELSE COLOR fvf, fhf
   IF a > 15 THEN LOCATE 15, posx + 2: PRINT " Okt "
RETURN

endofsub:
IF ton = 1 THEN SOUND 100, .4

COLOR , hf
  FOR a = 11 TO 17
      LOCATE a, posx - 4: PRINT SPACE$(18)
  NEXT a
COLOR fvf, fhf
  IF m = -1 THEN posx = 25 ELSE posx = 56
  LOCATE 11, posx: PRINT "บ"
COLOR sf, 7
   LOCATE 11, 57: PRINT "Û"


IF m = -1 THEN
   IF Fa = 1 THEN AA$ = " Dez "
   IF Fa = 2 THEN AA$ = " Hex "
   IF Fa = 3 THEN AA$ = " Bin "
   IF Fa = 4 THEN AA$ = " Okt "
ELSE
   IF Fa = 1 THEN AB$ = " Dez "
   IF Fa = 2 THEN AB$ = " Hex "
   IF Fa = 3 THEN AB$ = " Bin "
   IF Fa = 4 THEN AB$ = " Okt "
END IF

END SUB

