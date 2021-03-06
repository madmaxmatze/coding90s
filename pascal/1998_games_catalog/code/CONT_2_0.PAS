Uses Crt, Cursor, Fenster;

Type MenuTyp    = Array[1..500] of String[60];
     FileTyp    = File of Byte;

Var  SpieleProgs                            : MenuTyp;
     OpenVar                                : FileTyp;
     Aktiv, LowFen, BF, DA, PDA, SDA, LFile : Byte;
     Taste                                  : Char;
     V                                      : String;
     AddVar, A                              : Integer;

     {AktivDatenSatz, 1.Datensatz im Fenster, BalkenFarbe, DatenSatzAnzahl
     DatenSatzAnzahl, ProgrammeDatenSatzAnzahl, SpieleDatenSatzZahl}

Procedure ReadFile;
  Var  B, Readfile : Byte;
       ErrNum      : Integer;
  Begin;
    Assign(OpenVar, 'CONT.DAT');{I$-}
    Reset(OpenVar);
    {I$+}
      Repeat
        Inc(A);
        V := '';
        Repeat
          Read(OpenVar, B);
          V := V + (Chr(B));
        Until EOF(OpenVar) or (Length(V) > 58);
        If Copy(V, 2, 1) = '-' then Begin; Dec(A); SDA := A; End Else SpieleProgs[A] := V;
      Until EOF(OpenVar);
      Close(OpenVar);
      PDA := A - SDA + 1 - 2 + 1;
  End;

Procedure Load;
  Begin;
    A := 0; Aktiv := 1; LowFen := 1;
    If Lfile = 1 then Begin; DA := PDA; Inc(LFile); ADDVAR := SDA; End
    Else
    Begin; DA := SDA; Dec(LFile); ADDVAR := 0; End;
  End;

Procedure FensterInhalt;
  Begin;
    If Aktiv > LowFen + 13 then Inc(LowFen);
    If Aktiv < LowFen then Dec(LowFen);
    For A := LowFen to LowFen + 13 Do
        Begin;
          If Aktiv = A then TextBackground(BF) Else TextBackground(2);
          V := Copy(SpieleProgs[A + AddVar], 54, 2);
          If (V = ' 9') or (V = '10') then TextColor(14) Else TextColor(15);
          GotoXY(11, A - LowFen + 9); Write(Copy(SpieleProgs[A + AddVar], 1, 28));
          GotoXY(40, A - LowFen + 9); Write(Copy(SpieleProgs[A + AddVar], 29, 23));
          GotoXY(64, A - LowFen + 9); Write(Copy(SpieleProgs[A + AddVar], 52, 6));
        End;
    TextColor(15); TextBackground(2);
  End;

Procedure Sucher;
  Begin;
    A := 0;
    Repeat
      Inc(A);
      If Copy(SpieleProgs[A + AddVar], 2, 1) = Chr(Ord(Taste) - 32) Then
         Begin
           If A > DA - 14 then LowFen := DA - 13 Else LowFen := A;
           If LowFen < 1 then LowFen := 1;
           Aktiv := A; A := DA;
         End;
    Until A = DA;
  End;

Procedure PageDown;
  Begin;
    If Aktiv < DA - 26 then Begin Inc(LowFen, 14); Inc(Aktiv, 14); End
  Else
     Begin;
       LowFen := DA - 13;
       If DA - 13 < 1 then LowFen := 1;
       If Aktiv > DA - 14 then Aktiv := DA Else Inc(Aktiv, 14);
     End;
  End;

Procedure PageUp;
  Begin;
    If Aktiv > 28 then Begin Dec(LowFen, 14); Dec(Aktiv, 14); End
  Else
     Begin;
       LowFen := 1;
       If Aktiv < 16 then Aktiv := 1 Else Dec(Aktiv, 14);
     End;
  End;

Procedure AktivFarbe;
  Begin;
    Inc(BF);
    If BF = 2 then BF := 4;
    If BF = 8 then BF := 0;
  End;

Procedure ListMenu;
  Begin;
    FensterOn(10, 8, 60, 15, 1, 0, 15, 2);
    FensterSB(39, 8, 15, 15, 2); FensterSB(63, 8, 15, 15, 2);
    GotoXY(13, 8); Write('� Name ���������������������͹ Beschreibung �����͹ Bew. �');
    For A := 9 to 22 Do Begin; GotoXY(11, A); Write('                            �                       �     '); End;
  End;

Procedure HelpMenu;
  Begin;
    FensterOn(10, 8, 60, 15, 1, 0, 15, 2);
    GotoXY(13, 8); Write('� ContensLister - Hilfe �');
    GotoXY(12, 9); Write('����������������Ŀ');
    GotoXY(12, 10); Write('� Tastenbelegung �');
    GotoXY(12, 11); Write('������������������');
    GotoXY(12, 12); Write('  ���> Pfeiltasten     ��>  Cursorbewegung');
    GotoXY(12, 13); Write('  ���> Space           ��>  Spiele / Programme umschalten');
    GotoXY(12, 14); Write('  ���> A - Z           ��>  Suchsystem');
    GotoXY(12, 15); Write('  ���> Tab             ��>  Balkenfarbe umschalten');
    GotoXY(12, 16); Write('  ���> Page Up / Down  ��>  ganze Seite hoch / runter');
    GotoXY(12, 17); Write('  ���> Esc             ��>  Beenden des Programms');
    GotoXY(10, 18); Write('�����������������������������������������������������������͹');
    GotoXY(12, 19); Write('��������Ŀ �� DS.Anzahl Ŀ �����������Ŀ');
    GotoXY(12, 20); Write('� Spiele �����������������Ĵ Programme �');
    GotoXY(12, 21); Write('����������                 �������������');
    GotoXY(14, 22); Write('���> ', SDA);
    Str(PDA, V); GotoXY(45 - (Length(V)), 22); Write(PDA,' <���');
    GotoXY(56, 21); Write('�������������͹');
    GotoXY(56, 22); Write('�');
    GotoXY(56, 23); Write('�');
    TextBackGround(Bf); GotoXY(57, 22); Write(' Esc dr�cken ');
    Repeat Taste := ReadKey; Until Taste = Chr(27); Taste := ' ';
    ListMenu;
  End;

Begin;
  TextColor(15); TextBackGround(1); ClrScr;
  Readfile;
  CursorOff;
  FensterOn(20, 2, 40, 3, 1, 0, 15, 2);
  GotoXY(28, 3); Write('DOS ContensLister v2.0 ��');
  GotoXY(24, 4); Write('Made by the Matze-Man  (Hilfe=F1)');
  ListMenu;
  LFile := 2;
  Load;
  Repeat
    FensterInhalt;
    Taste := ReadKey;
    Case Taste Of #9        : AktivFarbe;
                  #32       : Load;
                  #72       : If Aktiv > 1 then Dec(Aktiv);
                  #73       : PageUp;
                  #75       : Begin; LowFen := 1; Aktiv := 1; End;
                  #77       : Begin; Aktiv := DA; PageDown; End;
                  #80       : If Aktiv < DA then Inc(Aktiv);
                  #81       : PageDown;
                  #97..#122 : Sucher;
                  #59       : HelpMenu;
    End;
  Until Taste = Chr(27);
  TextbackGround(0); TextColor(15); ClrScr;
End.