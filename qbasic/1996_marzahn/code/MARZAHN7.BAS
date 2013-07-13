REM------------------------------- Subs anmelden ---------------------------------------
DECLARE SUB auto ()
DECLARE SUB baume ()
DECLARE SUB Bodenstriche ()
DECLARE SUB Haus1 ()
DECLARE SUB Haus2 ()
DECLARE SUB Haus3 ()
DECLARE SUB Hotel ()
DECLARE SUB sterne ()
DECLARE SUB strasse ()

REM------------------------------- X,Y anmelden -----------------------------------------
DIM SHARED x: DIM SHARED y
DIM SHARED x1: DIM SHARED y1
                            
REM--------------------------- Ein paar kleine Dinge -------------------------------------------
CLS
SCREEN 7, , 1, 1
RANDOMIZE TIMER                                  ' Zeitzufallsgenerantor an

REM------------------------------- Subs aufruffen -----------------------------------------
sterne
Bodenstriche
strasse
Haus1
Haus2
Haus3
baume
LOCATE 1, 24: PRINT "Space zum beenden"

REM----------------------------- PCOPY Befehl -------------------------------------
PCOPY 1, 2
start:
  y = 125
  x = x + 1
  y1 = 123
  x1 = x1 - 1
  Hotel
  COLOR 15
  LOCATE 1, 1: PRINT TIME$;
  SCREEN 7, , 3, 1
    IF x1 < -50 THEN x1 = 350
    IF x > 350 THEN x = -30
    IF INKEY$ = " " THEN GOSUB ende
    auto
    PCOPY 3, 1
    PCOPY 2, 3
GOTO start

ende:
COLOR 15
END

SUB auto
SCREEN 7, , 3, 1
REM------------------------------ malt 2.Auto -------------------------------------
    REM------------------------ malt Reifen des 2.Auto -------------------------------------
    CIRCLE (x1 + 7, y1 + 16), 5, 12                    ' malt Mantel des Rades
    PAINT (x1 + 7, y1 + 19), 7, 12                     ' malt untere hÑlfte des Forderrades aus
    CIRCLE (x1 + 7, y1 + 16), 2, 15                    ' malt Kreis in der Mitte aus
    CIRCLE (x1 + 33, y1 + 16), 5, 12                   ' malt Mantel des Rades
    PAINT (x1 + 33, y1 + 19), 7, 12                    ' malt untere hÑlfte des Hinterrades aus
    CIRCLE (x1 + 33, y1 + 16), 2, 15                   ' malt Kreis in der Mitte aus
    REM------------------------ malt Karroserie des 2.Auto -------------------------------------
    LINE (x1 - 5, y1 + 9)-STEP(50, 7), 2, BF           ' malt Karroserie
    LINE (x1 + 10, y1 + 1)-STEP(18, 1), 2, BF          ' malt Dach
    LINE (x1 + 22, y1 + 1)-STEP(7, 10), 2, BF          ' malt Hinerdach
    LINE (x1 + 45, y1 + 9)-STEP(1, 3), 4, BF           ' malt Hinterlicht
    LINE (x1 - 7, y1 + 9)-STEP(1, 3), 14, BF           ' malt Vorderlicht
    LINE (x1 - 5, y1 + 9)-STEP(50, 1), 5, B            ' malt Seitenleiste
    LINE (x1 - 6, y1 + 15)-STEP(4, 1), 6, B            ' malt Vordersto·stange
    LINE (x1 + 42, y1 + 15)-STEP(4, 1), 6, B           ' malt Hintersto·stange
    LINE (x1 + 10, y1 + 3)-STEP(1, 5), 1, BF           ' malt Vorderfensterscheibe

REM------------------------------ malt 1.Auto -------------------------------------
    LINE (x, y + 7)-STEP(40, 10), 1, BF                ' malt Karroserie
    LINE (x + 10, y - 1)-STEP(18, 1), 1, BF            ' malt Dach
    LINE (x + 8, y - 1)-STEP(8, 10), 1, BF             ' malt Hinerdach
    LINE (x + 7, y - 2)-STEP(1, 8), 13, B              ' malt Hinerdachverkleidung
    LINE (x + 7, y - 2)-STEP(21, 1), 13, B             ' malt Dachverkleidung
    LINE (x + 40, y + 7)-STEP(1, 4), 14, BF            ' malt Vorderlicht
    LINE (x - 2, y + 7)-STEP(1, 4), 4, BF              ' malt Hinterlicht
    LINE (x, y + 7)-STEP(39, 1), 12, B                 ' malt Seitenleiste
    LINE (x + 27, y + 1)-STEP(1, 5), 3, BF             ' malt Forderfensterscheibe
    REM------------------------ malt Reifen des 1.Auto -------------------------------------
    CIRCLE (x + 7, y + 19), 5, 12                      ' malt Mantel des Rades
    PAINT (x + 7, y + 19), 7, 12                       ' malt obere hÑlfte des Fordertrades aus
    PAINT (x + 7, y + 22), 7, 12                       ' malt untere hÑlfte des Forderrades aus
    CIRCLE (x + 7, y + 19), 2, 15                      ' malt Kreis in der Mitte aus
    CIRCLE (x + 33, y + 19), 5, 12                     ' malt Mantel des Rades
    PAINT (x + 33, y + 19), 7, 12                      ' malt obere hÑlfte des Hintertrades aus
    PAINT (x + 33, y + 22), 7, 12                      ' malt untere hÑlfte des Hinterrades aus
    CIRCLE (x + 33, y + 19), 2, 15                     ' malt Kreis in der Mitte aus

REM-------------------- malt Umrisse des ersten Hauses -------------------------
    LINE (31, 123)-(99, 150), 7, BF                  ' der Hauskasten
    LINE (30, 123)-(30, 150), 15, B                  ' erste wei·e Hauslinie
    LINE (100, 123)-(100, 150), 15, B                ' zweite wei·e Hauslinie
    LINE (101, 123)-(109, 150), 4, BF                ' der Schatenkasten
    LINE (110, 123)-(110, 150), 15, BF               ' der Schatenkasten
    REM-------------------- malt Fenster des ersten Hauses -------------------------
    LINE (70, 130)-STEP(10, 10), 14, BF              ' ganzes Fenster
    LINE (45, 130)-STEP(10, 10), 14, BF              ' ganzes Fenster
    LINE (70, 123)-STEP(10, 2), 14, BF               ' halbes Fenster
    LINE (85, 123)-STEP(10, 2), 15, BF               ' halbes Fenster
    LINE (70, 145)-STEP(10, 5), 6, BF                ' TÅr

REM-------------------- malt Umrisse des dritten Hauses -------------------------
    LINE (231, 123)-(289, 150), 12, BF               ' der Hauskasten
    LINE (230, 123)-(230, 150), 15, B                ' erste wei·e Hauslinie
    LINE (290, 123)-(290, 150), 15, B                ' zweite wei·e Hauslinie
    LINE (291, 123)-(297, 150), 2, BF                ' der Schatenkasten
    LINE (298, 123)-(298, 150), 15, BF               ' der Schatenkasten
    REM-------------------- malt Fenster des dritten Hauses -------------------------
    LINE (270, 125)-STEP(10, 10), 14, BF             ' ganzes Fenster
    LINE (255, 140)-STEP(10, 10), 15, BF             ' ganzes Fenster

END SUB

SUB baume
REM-------------------------------- BÑume --------------------------------------
FOR z = 1 TO 20
    q = 20 + INT(280 * RND)
    w = 157 + INT(30 * RND)
      FOR t = 1 TO 10
          LINE (q - 3 + t / 2, w + 5)-STEP(0, 10), 6
          CIRCLE (q, w), t, 2
      NEXT t
NEXT z

END SUB

SUB Bodenstriche
FOR xx11 = -1000 TO 1000 STEP 20
    LINE (190, 120)-(xx11, 200)
NEXT xx11
END SUB

SUB Haus1
REM ------------------------------- 1.Haus --------------------------------------
FOR a = 1 TO 10
LINE (30 + a, 60 - a)-STEP(70, 100), 4, BF
NEXT a
LINE (30, 60)-(100, 160), 7, BF

' malt Kasten
LINE (30, 60)-(100, 160), 15, B
DRAW "bm 30,60 c15 e10 r70 g10 e10 d100 g10"

REM -------------------------- Fenster fÅr 1.Haus --------------------------------------
LINE (40, 70)-STEP(10, 10), 14, BF
LINE (70, 70)-STEP(10, 10), 15, BF
LINE (40, 70)-STEP(10, 10), 14, BF
LINE (55, 85)-STEP(10, 10), 14, BF
LINE (55, 85)-STEP(10, 10), 14, BF
LINE (40, 100)-STEP(10, 10), 14, BF
LINE (85, 100)-STEP(10, 10), 14, BF
LINE (85, 100)-STEP(10, 10), 14, BF
LINE (70, 115)-STEP(10, 10), 14, BF
LINE (85, 115)-STEP(10, 10), 15, BF

LINE (70, 149)-STEP(10, 10), 6, BF               ' TÅr
END SUB

SUB Haus2
REM ------------------------------- 2.Haus --------------------------------------
FOR B = 1 TO 15
LINE (120 + B, 30 - B)-STEP(80, 110), 1, BF
NEXT B
LINE (120, 30)-(200, 140), 8, BF

' malt Kasten
LINE (120, 30)-(200, 140), 15, B
DRAW "bm 120,30 c15 e15 r80 g15 e15 d110 g15"
REM ---------------------- malt Fenster des 2.Haus --------------------------------------
LINE (145, 40)-STEP(10, 10), 15, BF
LINE (175, 40)-STEP(10, 10), 14, BF
LINE (130, 55)-STEP(10, 10), 15, BF
LINE (175, 55)-STEP(10, 10), 14, BF
LINE (160, 70)-STEP(10, 10), 15, BF
LINE (145, 85)-STEP(10, 10), 14, BF
LINE (175, 85)-STEP(10, 10), 14, BF
LINE (160, 100)-STEP(10, 10), 14, BF
LINE (145, 100)-STEP(10, 10), 15, BF
LINE (175, 100)-STEP(10, 10), 14, BF
LINE (130, 115)-STEP(10, 10), 14, BF

LINE (160, 125)-STEP(10, 14), 6, BF          'TÅr

LINE (150, 10)-STEP(2, 14), 6, BF              'Antenne
LINE (146, 10)-STEP(10, 1), 6, BF              'Antenne

END SUB

SUB Haus3
REM ------------------------------- 3.Haus --------------------------------------
FOR c = 1 TO 8
LINE (230 + c, 55 - c)-STEP(60, 110), 2, BF
NEXT c
LINE (230, 55)-(290, 165), 12, BF

' malt Kasten
LINE (230, 55)-(290, 165), 15, B
DRAW "bm 230,55 c15 e8 r60 g8 e8 d110 g8"

REM -------------------------- Fenster fÅr 3.Haus --------------------------------------
LINE (240, 65)-STEP(10, 10), 14, BF
LINE (240, 80)-STEP(10, 10), 15, BF
LINE (270, 65)-STEP(10, 10), 14, BF
LINE (255, 95)-STEP(10, 10), 14, BF
LINE (240, 110)-STEP(10, 10), 15, BF
LINE (270, 110)-STEP(10, 10), 14, BF

LINE (270, 150)-STEP(10, 14), 6, BF              'TÅr

END SUB

SUB Hotel
  LINE (46, 54)-STEP(42, 10), 12, B
  PAINT (47, 55), 0, 12
  m = INT(15 * RND)
  COLOR m: LOCATE 8, 7: PRINT "HOTEL"
END SUB

SUB sterne
REM------------------------------- Sterne -----------------------------------------------
'LOCATE 1, 1: PRINT "Das ist Marzahn"
'LOCATE 2, 1: PRINT "bei Nacht"
FOR zahl = 1 TO 300
    xx1 = INT(320 * RND)
    yy1 = INT(140 * RND)
    ff = INT(14 * RND)
       PSET (xx1, yy1), ff
NEXT zahl
END SUB

SUB strasse
REM-------------------------------- Stra·e -------------------------------------
LINE (0, 142)-(321, 150), 8, BF

REM----------------------------- Stra·enmckierungen ----------------------------
LINE (0, 145)-STEP(15, 1), 7, B
LINE (111, 145)-STEP(5, 1), 7, B
LINE (130, 145)-STEP(15, 1), 7, B
LINE (160, 145)-STEP(15, 1), 7, B
LINE (190, 145)-STEP(15, 1), 7, B
LINE (303, 145)-STEP(15, 1), 7, B
LINE (220, 145)-STEP(9, 1), 7, B
END SUB

