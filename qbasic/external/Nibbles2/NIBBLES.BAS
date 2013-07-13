'                    …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
'                    ∫ …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª ∫
'                    ∫ ∫ Q B a s i c  N i b b l e s ∫ ∫
'                    ∫ »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº ∫
'                    »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
'
'                                I N F O
'                              ÕÕÕÕÕÕÕÕÕÕÕ
'Geschrieben      : MicroSoft
'VerÑndert        : Mathias Nitzsche
'VerÑnderungsdatum: 13.1.1996
'
'Systemvorraussetzungen: 286 DX oder besser
'                        IBM kompatieblen PC
'                        MS-Dos 5.00 oder hîher / Windows95   (mit QBasic)
'                        ein Diskettenlaufwerk      (3´ Zoll oder 5¨ Zoll)
'                        am besten einen Farbbidschirm
'ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ


'ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ
'                      D A S   P R O G R A M M
'ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ

DEFINT A-Z

TYPE snakeBody
    row AS INTEGER
    col AS INTEGER
END TYPE

TYPE snaketype
    head      AS INTEGER
    length    AS INTEGER
    row       AS INTEGER
    col       AS INTEGER
    direction AS INTEGER
    leben     AS INTEGER
    scolor    AS INTEGER
    alive     AS INTEGER
END TYPE

TYPE arenaType
    realRow     AS INTEGER
    acolor      AS INTEGER
    sister      AS INTEGER
END TYPE

'ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ Sub's anmelden ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ
DECLARE SUB SpacePause (text$)
DECLARE SUB PrintScore (NumPlayers%, leben1%, leben2%, curLevel)
DECLARE SUB intro ()
DECLARE SUB GetInputs (NumPlayers, speed, diff$, monitor$)
DECLARE SUB DrawScreen ()
DECLARE SUB PlayNibbles (NumPlayers, speed, diff$, a, b)
DECLARE SUB set (row, col, acolor)
DECLARE SUB CENTER (row, text$)
DECLARE SUB DoIntro ()
DECLARE SUB Initialize ()
DECLARE SUB SparklePause ()
DECLARE SUB Level (WhatToDO, sammy() AS snaketype)
DECLARE SUB Initcolors ()
DECLARE SUB EraseSnake (snake() AS ANY, snakeBod() AS ANY, snakeNum%)
DECLARE FUNCTION StillWantsToPlay (a, b, NumPlayers)
DECLARE FUNCTION PointIsThere (row, col, backColor)

'ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ Constans ? ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ
CONST TRUE = -1
CONST FALSE = NOT TRUE
CONST MAXSNAKELENGTH = 1000
CONST STARTOVER = 1             ' Parameters zu 'Level' SUB
CONST SAMELEVEL = 2
CONST Nextlevel = 3

'ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ Feld demensionieren ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ
DIM SHARED arena(1 TO 50, 1 TO 80) AS arenaType
DIM SHARED curLevel, ColorTable(10)

'ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ Nun geht es los ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ
RANDOMIZE TIMER
GOSUB ClearKeyLocks
CALL intro
GetInputs NumPlayers, speed, diff$, monitor$
GOSUB SetColors
CALL DrawScreen

DO
  PlayNibbles NumPlayers, speed, diff$, a, b
  LOOP WHILE StillWantsToPlay(a, b, NumPlayers)
GOSUB RestoreKeyLocks
COLOR 15
CLS
END

'ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ
ClearKeyLocks:
    DEF SEG = 0
    KeyFlags = PEEK(1047)
    POKE 1047, &H0
    DEF SEG
RETURN

RestoreKeyLocks:
    DEF SEG = 0
    POKE 1047, KeyFlags
    DEF SEG
RETURN

SetColors:
    IF monitor$ = "1" THEN
        RESTORE mono
    ELSE
        RESTORE normal
    END IF

    FOR a = 1 TO 6
        READ ColorTable(a)
    NEXT a
RETURN

'           snake1    ∫snake2  ∫Walls ∫Background  ∫Dialogs-Fore ∫Back
mono:   DATA 15,         7,       7,     0,          15,            0
normal: DATA 14,         13,      12,    1,          15,            4

SUB DrawScreen

VIEW PRINT
COLOR ColorTable(1), ColorTable(4)
CLS

 LOCATE 6, 30: PRINT "…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª"
 LOCATE 7, 30: PRINT "∫ …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª ∫"
 LOCATE 8, 30: PRINT "∫ ∫ N i b b l e s ∫ ∫"
 LOCATE 9, 30: PRINT "∫ »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº ∫"
LOCATE 10, 30: PRINT "»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº"

LOCATE 14, 33: PRINT "Lade Spielfeld..."
  
FOR row = 1 TO 50
    FOR col = 1 TO 80
        arena(row, col).realRow = INT((row + 1) / 2)
        arena(row, col).sister = (row MOD 2) * 2 - 1
    NEXT col
NEXT row

END SUB

SUB EraseSnake (snake() AS snaketype, snakeBod() AS snakeBody, snakeNum)

FOR c = 0 TO 9
    FOR b = snake(snakeNum).length - c TO 0 STEP -10
        tail = (snake(snakeNum).head + MAXSNAKELENGTH - b) MOD MAXSNAKELENGTH
        set snakeBod(tail, snakeNum).row, snakeBod(tail, snakeNum).col, ColorTable(4)
    NEXT b
NEXT c
    
END SUB

SUB GetInputs (NumPlayers, speed, diff$, monitor$)

COLOR 7
CLS

DO
  LOCATE 5, 47: PRINT SPACE$(34);
  LOCATE 5, 20
  INPUT "Wie viele Spieler (1 oder 2)"; num$
LOOP UNTIL VAL(num$) = 1 OR VAL(num$) = 2
    NumPlayers = VAL(num$)

LOCATE 8, 12: PRINT "Welches Geschicklichkeitslevel (von 1 bis 100)"
LOCATE 7, 18: PRINT "1 = AnfÑnger ƒ"; CHR$(26); " 100 = Schnelle Finger "
DO
  LOCATE 8, 58
  INPUT gamespeed$
LOOP UNTIL VAL(gamespeed$) >= 1 AND VAL(gamespeed$) <= 100
speed = VAL(gamespeed$)

speed = (100 - speed) * 2 + 1
   
DO
  LOCATE 10, 56: PRINT SPACE$(25);
  LOCATE 10, 5
  INPUT "Soll die Spielegeschwindigkeit wÑrend des Spieles zunehmen (J oder N)"; diff$
     diff$ = UCASE$(diff$)
LOOP UNTIL diff$ = "J" OR diff$ = "N"

DO
  LOCATE 12, 25: PRINT "1. Schwarz-Wei·monitor"
  LOCATE 13, 25: INPUT "2. Farbmonitor            (1 oder 2)"; monitor$
     monitor$ = UCASE$(monitor$)
LOOP UNTIL monitor$ = "1" OR monitor$ = "2"
   
startTime# = TIMER                          ' berechnet die geschwindigkeit
FOR i# = 1 TO 10000: NEXT i#                                 'des Systems
stopTime# = TIMER
speed = speed * 4 / (stopTime# - startTime#)

END SUB

SUB Initcolors

FOR row = 1 TO 50
    FOR col = 1 TO 80
        arena(row, col).acolor = ColorTable(4)
    NEXT col
NEXT row

CLS
   
FOR col = 1 TO 80
    set 3, col, ColorTable(3)
    set 50, col, ColorTable(3)
NEXT col

FOR row = 4 TO 49
    set row, 1, ColorTable(3)
    set row, 80, ColorTable(3)
NEXT row

END SUB

SUB intro

SCREEN 0
WIDTH 80, 25
CLS

COLOR 15
LOCATE 4, 24: PRINT " Q B a s i c   N i b b l e s "
LOCATE 5, 24: PRINT "ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ"

COLOR 7
LOCATE 7, 8: PRINT "Nibbles ist ein Spiel fÅr 1 oder 2 Spieler."
LOCATE 8, 8: PRINT "In den 15 spannenden Level mu·t du deine Schlange Åber das Spielfeld"
LOCATE 9, 8: PRINT "steuern und versuchen, die Zahlen zu essen. Renne nicht in WÑnde"
LOCATE 10, 8: PRINT "oder in dich selbst. Beachte, da· die Schlange immer lÑnger wird."

LOCATE 13, 30: PRINT " Spiel-steuerung "
LOCATE 14, 30: PRINT "ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ"
LOCATE 15, 19: PRINT "J a k e                      S a m m y"
LOCATE 17, 20: PRINT "(hoch)                        (hoch)"
LOCATE 18, 22: PRINT "W                             "; CHR$(24)
LOCATE 19, 11: PRINT "(lings) A     D (rechts)      (lings) "; CHR$(27); "     "; CHR$(26); " (rechts)"
LOCATE 20, 22: PRINT "S                             "; CHR$(25)
LOCATE 21, 19: PRINT "(runter)                      (runter)"
LOCATE 23, 35: PRINT "P = Pause      Esc = Ende"
LOCATE 25, 20: PRINT "DrÅcke bitte eine Taste um fortzusetzen"

PLAY "MBT160O1L8CDEDCDL4ECC"
SparklePause

END SUB

SUB Level (WhatToDO, sammy() AS snaketype) STATIC

IF INKEY$ = "c" THEN
LOCATE 10, 10: INPUT "Welches Level"; curLevel
END IF
    
SELECT CASE (WhatToDO)

CASE STARTOVER
     curLevel = 1
CASE Nextlevel
     curLevel = curLevel + 1
END SELECT

sammy(1).head = 1
sammy(1).length = 2
sammy(1).alive = TRUE
sammy(2).head = 1
sammy(2).length = 2
sammy(2).alive = TRUE

Initcolors

SELECT CASE curLevel
       CASE 1
            sammy(1).row = 25: sammy(2).row = 25
            sammy(1).col = 50: sammy(2).col = 30
            sammy(1).direction = 4: sammy(2).direction = 3


       CASE 2
            FOR i = 20 TO 60
                set 25, i, ColorTable(3)
            NEXT i
                 sammy(1).row = 7: sammy(2).row = 43
                 sammy(1).col = 60: sammy(2).col = 20
                 sammy(1).direction = 3: sammy(2).direction = 4
 
       CASE 3
            FOR i = 10 TO 40
                set i, 20, ColorTable(3)
                set i, 60, ColorTable(3)
            NEXT i
                 sammy(1).row = 25: sammy(2).row = 25
                 sammy(1).col = 50: sammy(2).col = 30
                 sammy(1).direction = 1: sammy(2).direction = 2
        
       CASE 4
            FOR i = 4 TO 30
                set i, 20, ColorTable(3)
                set 53 - i, 60, ColorTable(3)
            NEXT i
                 FOR i = 2 TO 40
                     set 38, i, ColorTable(3)
                     set 15, 81 - i, ColorTable(3)
                 NEXT i
                      sammy(1).row = 7: sammy(2).row = 43
                      sammy(1).col = 60: sammy(2).col = 20
                      sammy(1).direction = 3: sammy(2).direction = 4
  

       CASE 5
            FOR i = 4 TO 49
                IF i > 28 OR i < 22 THEN
                   set i, 40, ColorTable(3)
                END IF
            NEXT i
            FOR i = 1 TO 80
                IF i < 36 OR i > 44 THEN
                   set 25, i, ColorTable(3)
                END IF
            NEXT i
             sammy(1).row = 15: sammy(2).row = 15
             sammy(1).col = 65: sammy(2).col = 15
             sammy(1).direction = 3: sammy(2).direction = 4
      
       CASE 6
            FOR i = 4 TO 49 STEP 3
                set i, 40, ColorTable(3)
            NEXT i
                 sammy(1).row = 7: sammy(2).row = 43
                 sammy(1).col = 65: sammy(2).col = 15
                 sammy(1).direction = 2: sammy(2).direction = 1
     
       CASE 7
            FOR i = 6 TO 47
                set i, i, ColorTable(3)
                set i, i + 28, ColorTable(3)
            NEXT i
                 sammy(1).row = 40: sammy(2).row = 15
                 sammy(1).col = 75: sammy(2).col = 5
                 sammy(1).direction = 1: sammy(2).direction = 2


       CASE 8
            FOR i = 4 TO 49
                IF i > 30 OR i < 23 THEN
                   set i, 10, ColorTable(3)
                   set i, 20, ColorTable(3)
                   set i, 30, ColorTable(3)
                   set i, 40, ColorTable(3)
                   set i, 50, ColorTable(3)
                   set i, 60, ColorTable(3)
                   set i, 70, ColorTable(3)
             END IF
        NEXT i
             sammy(1).row = 7: sammy(2).row = 43
             sammy(1).col = 65: sammy(2).col = 15
             sammy(1).direction = 2: sammy(2).direction = 1
           
       CASE 9
            FOR i = 4 TO 49 STEP 2
                set i, 30, ColorTable(3)
                set i + 1, 50, ColorTable(3)
            NEXT i
                 sammy(1).row = 7: sammy(2).row = 43
                 sammy(1).col = 65: sammy(2).col = 15
                 sammy(1).direction = 2: sammy(2).direction = 1

      
       CASE 10
            FOR i = 13 TO 39
                set i, 21, ColorTable(3)
                set i, 59, ColorTable(3)
            NEXT i
                 FOR i = 23 TO 57
                     set 11, i, ColorTable(3)
                     set 41, i, ColorTable(3)
                 NEXT i
                      sammy(1).row = 25: sammy(2).row = 25
                      sammy(1).col = 50: sammy(2).col = 30
                      sammy(1).direction = 1: sammy(2).direction = 2
      

       CASE 11
            FOR i = 4 TO 40
                set i, 10, ColorTable(3)
                set 53 - i, 20, ColorTable(3)
                set i, 30, ColorTable(3)
                set 53 - i, 40, ColorTable(3)
                set i, 50, ColorTable(3)
                set 53 - i, 60, ColorTable(3)
                set i, 70, ColorTable(3)
            NEXT i
                 sammy(1).row = 7: sammy(2).row = 43
                 sammy(1).col = 65: sammy(2).col = 15
                 sammy(1).direction = 2: sammy(2).direction = 1
      
       CASE 12
            FOR i = 4 TO 40
                set i, 10, ColorTable(3)
                set 53 - i, 20, ColorTable(3)
                set i, 30, ColorTable(3)
                set 53 - i, 40, ColorTable(3)
                set i, 50, ColorTable(3)
                set 53 - i, 60, ColorTable(3)
                set i, 70, ColorTable(3)
            NEXT i
            FOR i = 1 TO 80 STEP 2
                set 25, i, ColorTable(3)
            NEXT i
                 sammy(1).row = 7: sammy(2).row = 43
                 sammy(1).col = 65: sammy(2).col = 15
                 sammy(1).direction = 2: sammy(2).direction = 1

          
       CASE 13
            FOR i = 4 TO 49 STEP 2
                set i, 10, ColorTable(3)
                set i + 1, 20, ColorTable(3)
                set i, 30, ColorTable(3)
                set i + 1, 40, ColorTable(3)
                set i, 50, ColorTable(3)
                set i + 1, 60, ColorTable(3)
                set i, 70, ColorTable(3)
            NEXT i
                 sammy(1).row = 7: sammy(2).row = 43
                 sammy(1).col = 65: sammy(2).col = 15
                 sammy(1).direction = 2: sammy(2).direction = 1

       CASE 14
            FOR i = 4 TO 49 STEP 2
                set i, 10, ColorTable(3)
                set i + 1, 20, ColorTable(3)
                set i, 30, ColorTable(3)
                set i + 1, 40, ColorTable(3)
                set i, 50, ColorTable(3)
                set i + 1, 60, ColorTable(3)
                set i, 70, ColorTable(3)
            NEXT i
            FOR i = 5 TO 49 STEP 4
                set i, 10, ColorTable(3)
                set i + 1, 20, ColorTable(3)
                set i, 30, ColorTable(3)
                set i + 1, 40, ColorTable(3)
                set i, 50, ColorTable(3)
                set i + 1, 60, ColorTable(3)
                set i, 70, ColorTable(3)
            NEXT i
                
                 sammy(1).row = 7: sammy(2).row = 43
                 sammy(1).col = 65: sammy(2).col = 15
                 sammy(1).direction = 2: sammy(2).direction = 1

       CASE 15
            FOR i = 4 TO 49 STEP 2
                set i, 10, ColorTable(3)
                set i + 1, 20, ColorTable(3)
                set i, 30, ColorTable(3)
                set i + 1, 40, ColorTable(3)
                set i, 50, ColorTable(3)
                set i + 1, 60, ColorTable(3)
                set i, 70, ColorTable(3)
            NEXT i
            FOR i = 5 TO 49 STEP 4
                set i, 10, ColorTable(3)
                set i + 1, 20, ColorTable(3)
                set i, 30, ColorTable(3)
                set i + 1, 40, ColorTable(3)
                set i, 50, ColorTable(3)
                set i + 1, 60, ColorTable(3)
                set i, 70, ColorTable(3)
            NEXT i
            FOR i = 1 TO 80 STEP 2
                set 14, i, ColorTable(3)
                set 24, i + 1, ColorTable(3)
                set 34, i, ColorTable(3)
                set 44, i + 1, ColorTable(3)
            NEXT i
            FOR i = 2 TO 80 STEP 4
                set 14, i, ColorTable(3)
                set 24, i + 1, ColorTable(3)
                set 34, i, ColorTable(3)
                set 44, i + 1, ColorTable(3)
            NEXT i
                 sammy(1).row = 7: sammy(2).row = 47
                 sammy(1).col = 79: sammy(2).col = 2
                 sammy(1).direction = 3: sammy(2).direction = 4

CASE ELSE
IF curLevel > 15 THEN
   COLOR ColorTable(5), ColorTable(6)
   LOCATE 10, 20: PRINT "€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€"
   LOCATE 11, 20: PRINT "€      G R A T U L A T I O N      €"
   LOCATE 12, 20: PRINT "€ Du hast alle 14 Level geschaft  €"
   LOCATE 13, 20: PRINT "€ Mîchtest du noch einmal spielen €"
   LOCATE 14, 20: PRINT "€     Ja oder Nein (j/n)          €"
   LOCATE 15, 20: PRINT "€‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹€"
     Tonleiter$ = "CDEFGAB"
     PLAY "L16"
     FOR i% = 0 TO 3
         PLAY "O" + STR$(i%)
         PLAY "X" + VARPTR$(Tonleiter$)
     NEXT i%
     LOCATE 14, 44: INPUT g$
     IF g$ = "n" THEN CLS : END
     IF g$ = "j" THEN
        COLOR 15, ColorTable(4)
        LOCATE 10, 20: PRINT "                                   "
        LOCATE 11, 20: PRINT "                                   "
        LOCATE 12, 20: PRINT "                                   "
        LOCATE 13, 20: PRINT "                                   "
        LOCATE 14, 20: PRINT "                                   "
        LOCATE 15, 20: PRINT "                                   "
        RUN
     END IF
END IF

END SELECT

END SUB

SUB PlayNibbles (NumPlayers, speed, diff$, a, b)

DIM sammyBody(MAXSNAKELENGTH - 1, 1 TO 2) AS snakeBody
DIM sammy(1 TO 2) AS snaketype
    sammy(1).leben = 5
    sammy(1).scolor = ColorTable(1)
    sammy(2).leben = 5
    sammy(2).scolor = ColorTable(2)
Level STARTOVER, sammy()
    startRow1 = sammy(1).row: startCol1 = sammy(1).col
    startRow2 = sammy(2).row: startCol2 = sammy(2).col
    PrintScore NumPlayers, sammy(1).leben, sammy(2).leben, curLevel
curSpeed = speed

SpacePause "     Level" + STR$(curLevel) + ", DrÅcke Space"
     gameover = FALSE
DO
  IF NumPlayers = 1 THEN
     sammy(2).row = 0
  END IF
 
  number = 1          'Current number that snakes are trying to run into
  nonum = TRUE        'nonum = TRUE if a number is not on the screen
  playerDied = FALSE
  PrintScore NumPlayers, sammy(1).leben, sammy(2).leben, curLevel
        PLAY "T160O1>L20CDEDCDL10ECC"

  DO
    IF nonum = TRUE THEN
       DO
         numberRow = INT(RND(1) * 47 + 3)
         NumberCol = INT(RND(1) * 78 + 2)
         sisterRow = numberRow + arena(numberRow, NumberCol).sister
       LOOP UNTIL NOT PointIsThere(numberRow, NumberCol, ColorTable(4)) AND NOT PointIsThere(sisterRow, NumberCol, ColorTable(4))
            numberRow = arena(numberRow, NumberCol).realRow
            nonum = FALSE
            COLOR ColorTable(1), ColorTable(4)
            LOCATE numberRow, NumberCol
            PRINT RIGHT$(STR$(number), 1);
            count = 0
    END IF
        FOR a# = 1 TO curSpeed:  NEXT a#
            kbd$ = INKEY$
            SELECT CASE kbd$
                CASE "w", "W": IF sammy(2).direction <> 2 THEN sammy(2).direction = 1
                CASE "s", "S": IF sammy(2).direction <> 1 THEN sammy(2).direction = 2
                CASE "a", "A": IF sammy(2).direction <> 4 THEN sammy(2).direction = 3
                CASE "d", "D": IF sammy(2).direction <> 3 THEN sammy(2).direction = 4
                CASE CHR$(0) + "H": IF sammy(1).direction <> 2 THEN sammy(1).direction = 1
                CASE CHR$(0) + "P": IF sammy(1).direction <> 1 THEN sammy(1).direction = 2
                CASE CHR$(0) + "K": IF sammy(1).direction <> 4 THEN sammy(1).direction = 3
                CASE CHR$(0) + "M": IF sammy(1).direction <> 3 THEN sammy(1).direction = 4
                CASE "l", "L"
                   COLOR ColorTable(5), ColorTable(6)
                   LOCATE 11, 23: PRINT "€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€"
                   LOCATE 12, 23: PRINT "€ Welches Level starten(1-15)     €"
                   LOCATE 13, 23: PRINT "€‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹€"
                   LOCATE 12, 52: INPUT curLevel
                   curLevel = curLevel - 1
                   COLOR ColorTable(1), ColorTable(4)
                   GOSUB steuerung
                CASE "x", "X"
                   IF NumPlayers = 1 THEN
                      leben1 = 5: sammy(1).leben = 5
                      CALL PrintScore(NumPlayers, leben1, leben2, curLevel)
                      SpacePause " Sammy hat jetzt 5 Leben !!!"
                   END IF
                CASE "p", "P": SpacePause "    Pause... DrÅcke Space"
                CASE CHR$(27): COLOR 15, 0: CLS : END
                CASE ELSE
            END SELECT

            FOR a = 1 TO NumPlayers
                SELECT CASE sammy(a).direction
                    CASE 1: sammy(a).row = sammy(a).row - 1
                    CASE 2: sammy(a).row = sammy(a).row + 1
                    CASE 3: sammy(a).col = sammy(a).col - 1
                    CASE 4: sammy(a).col = sammy(a).col + 1
                END SELECT

            IF numberRow = INT((sammy(a).row + 1) / 2) AND NumberCol = sammy(a).col THEN
               PLAY "MBO0L16>CCCE"
                    IF sammy(a).length < (MAXSNAKELENGTH - 30) THEN
                       sammy(a).length = sammy(a).length + number * 4
                    END IF
                    number = number + 1
                    IF number = 10 THEN
                        EraseSnake sammy(), sammyBody(), 1
                        EraseSnake sammy(), sammyBody(), 2
                        LOCATE numberRow, NumberCol: PRINT " "
steuerung:
                        Level Nextlevel, sammy()
                        PrintScore NumPlayers, sammy(1).leben, sammy(2).leben, curLevel
                        SpacePause "     Level" + STR$(curLevel) + ", DrÅcke Space"
                        IF NumPlayers = 1 THEN sammy(2).row = 0
                        number = 1
                        IF diff$ = "P" THEN speed = speed - 10: curSpeed = speed
                    END IF
                    nonum = TRUE
                    IF curSpeed < 1 THEN curSpeed = 1
                END IF
            NEXT a

            FOR a = 1 TO NumPlayers
                IF PointIsThere(sammy(a).row, sammy(a).col, ColorTable(4)) OR (sammy(1).row = sammy(2).row AND sammy(1).col = sammy(2).col) THEN
                    PLAY "MBO0L32EFGEFDC"
                    COLOR , ColorTable(4)
                    LOCATE numberRow, NumberCol
                    PRINT " "
                   
                    playerDied = TRUE
                    sammy(a).alive = FALSE
                    sammy(a).leben = sammy(a).leben - 1
                ELSE
                    sammy(a).head = (sammy(a).head + 1) MOD MAXSNAKELENGTH
                    sammyBody(sammy(a).head, a).row = sammy(a).row
                    sammyBody(sammy(a).head, a).col = sammy(a).col
                    tail = (sammy(a).head + MAXSNAKELENGTH - sammy(a).length) MOD MAXSNAKELENGTH
                    set sammyBody(tail, a).row, sammyBody(tail, a).col, ColorTable(4)
                    sammyBody(tail, a).row = 0
                    set sammy(a).row, sammy(a).col, sammy(a).scolor
                END IF
            NEXT a

        LOOP UNTIL playerDied

        curSpeed = speed                ' reset speed to initial value
       
        FOR a = 1 TO NumPlayers
            EraseSnake sammy(), sammyBody(), a

            IF sammy(a).alive = FALSE THEN
                'Update score
                PrintScore NumPlayers, sammy(1).leben, sammy(2).leben, curLevel
                
                IF a = 1 THEN
                    SpacePause "Sammy stirbt! DrÅcke Space ->"
                ELSE
                    SpacePause "<- Jake stirbt! DrÅcke Space"
                END IF
            END IF
        NEXT a

     Level SAMELEVEL, sammy()
     PrintScore NumPlayers, sammy(1).leben, sammy(2).leben, curLevel
    
IF sammy(1).leben = 0 THEN a = 100
IF sammy(2).leben = 0 THEN b = 100

LOOP UNTIL sammy(1).leben = 0 OR sammy(2).leben = 0

END SUB

FUNCTION PointIsThere (row, col, acolor)
    IF row <> 0 THEN
        IF arena(row, col).acolor <> acolor THEN
            PointIsThere = TRUE
        ELSE
            PointIsThere = FALSE
        END IF
    END IF
END FUNCTION

SUB PrintScore (NumPlayers, leben1, leben2, curLevel)
    COLOR 15, ColorTable(4)
    IF NumPlayers = 2 THEN
        LOCATE 1, 2
        PRINT USING "Leben: #     <--JAKE"; leben2
    END IF
    LOCATE 1, 60: PRINT USING "SAMMY-->    Leben: #"; leben1
    LOCATE 1, 33: PRINT "ÕÕ Level"; curLevel; "ÕÕ"
END SUB

SUB set (row, col, acolor)
    IF row <> 0 THEN
        arena(row, col).acolor = acolor             'assign color to arena
        realRow = arena(row, col).realRow           'Get real row of pixel
        topFlag = arena(row, col).sister + 1 / 2    'Deduce whether pixel
                                                    'is on topﬂ, or bottom‹
        sisterRow = row + arena(row, col).sister    'Get arena row of sister
        sisterColor = arena(sisterRow, col).acolor  'Determine sister's color

        LOCATE realRow, col

        IF acolor = sisterColor THEN                'If both points are same
            COLOR acolor, acolor                           'Print chr$(219) "€"
            PRINT CHR$(219);
        ELSE
            IF topFlag THEN                         'Since you cannot have
                IF acolor > 7 THEN                  'bright backgrounds
                    COLOR acolor, sisterColor       'determine best combo
                    PRINT CHR$(223);                'to use.
                ELSE
                    COLOR sisterColor, acolor
                    PRINT CHR$(220);
                END IF
            ELSE
                IF acolor > 7 THEN
                    COLOR acolor, sisterColor
                    PRINT CHR$(220);
                ELSE
                    COLOR sisterColor, acolor
                    PRINT CHR$(223);
                END IF
            END IF
        END IF
    END IF
END SUB

SUB SpacePause (text$)

COLOR ColorTable(5), ColorTable(6)

LOCATE 11, 24: PRINT "€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€"
LOCATE 12, 24: PRINT "€ " + LEFT$(text$ + SPACE$(29), 29) + " €"
LOCATE 13, 24: PRINT "€‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹€"
   
WHILE INKEY$ <> "": WEND
WHILE INKEY$ <> " ": WEND
COLOR 15, ColorTable(4)

FOR i = 21 TO 26            ' Restore the screen background
    FOR j = 24 TO 56
        set i, j, arena(i, j).acolor
    NEXT j
NEXT i

END SUB

SUB SparklePause

COLOR 4
a$ = "*    *    *    *    *    *    *    *    *    *    *    *    *    *    *    *    *    "
WHILE INKEY$ <> "": WEND 'Clear keyboard buffer

WHILE INKEY$ = ""
      FOR a = 1 TO 5
          LOCATE 1, 1                             'print wagerecht sparkles
          PRINT MID$(a$, a, 80);
          LOCATE 24, 1
          PRINT MID$(a$, 6 - a, 80);

          FOR b = 1 TO 24                         'Print senkrecht sparkles
              c = (a + b) MOD 3
                IF c = 1 THEN
                   LOCATE b, 80
                   PRINT "*";
                   LOCATE 25 - b, 1
                   PRINT "*";
               ELSE
                   LOCATE b, 80
                   PRINT " ";
                   LOCATE 25 - b, 1
                   PRINT " ";
               END IF
          NEXT b
      NEXT a
WEND

END SUB

FUNCTION StillWantsToPlay (a, b, NumPlayers)

COLOR ColorTable(5), ColorTable(6)

LOCATE 10, 30: PRINT "€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ€"
LOCATE 11, 30: PRINT "€       G A M E   O V E R       €"
LOCATE 12, 30: PRINT "€                               €"

IF NumPlayers = 2 THEN
IF a = 100 THEN LOCATE 12, 30: PRINT "€      Sammy hat Verloren       €"
IF b = 100 THEN LOCATE 12, 30: PRINT "€       Jake hat Verloren       €"
END IF

LOCATE 13, 30: PRINT "€  Nocheinmal spielen?  (J/N)   €"
LOCATE 14, 30: PRINT "€‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹€"

WHILE INKEY$ <> "": WEND
DO
  kbd$ = UCASE$(INKEY$)
LOOP UNTIL kbd$ = "J" OR kbd$ = "N"

COLOR 15, ColorTable(4)
LOCATE 10, 30: PRINT "                                 "
LOCATE 11, 30: PRINT "                                 "
LOCATE 12, 30: PRINT "                                 "
LOCATE 13, 30: PRINT "                                 "
LOCATE 14, 30: PRINT "                                 "

IF kbd$ = "J" THEN
   StillWantsToPlay = TRUE
ELSE
   StillWantsToPlay = FALSE
   COLOR 0
   CLS
END IF

END FUNCTION

