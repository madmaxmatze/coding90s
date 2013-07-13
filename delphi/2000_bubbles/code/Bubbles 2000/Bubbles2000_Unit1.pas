unit Bubbles2000_Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, forms, Dialogs, StdCtrls, ExtCtrls, ImgList, INifiles, Registry, ComCtrls,
  jpeg, MMSystem, HKStreamCol;

type
  THiscore = Record
    Name   : String[50];
    Punkte : Word;
  end;
  TfrmBubbles = class(Tform)
    Startbild     : TImage;
    Spielbild     : TImage;
    Endbild       : TImage;
    ImgNeuesSpiel : TImage;
    ImgOptionen   : TImage;
    ImgHilfe      : TImage;
    ImgCredits    : TImage;
    ImgButton     : TImageList;
    Kugellist     : TImageList;
    Ani1          : TRadioButton;
    Ani2          : TRadioButton;
    Ani3          : TRadioButton;
    Ani4          : TRadioButton;
    Ani5          : TRadioButton;
    InputTimer    : TTimer;
    cbGameMode    : TComboBox;
    cbSkill       : TComboBox;
    Animationen   : TGroupBox;
    SoundBox      : TGroupBox;
    cbSound       : TCheckBox;
    cbMusik       : TCheckBox;
    Status        : TLabel;
    HKS           : THKStreams;
    procedure formCreate(Sender: TObject);
    procedure formPaint(Sender: TObject);
    procedure formMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; XPos, YPos: Integer);
    procedure formMouseMove(Sender: TObject; Shift: TShiftState; XPos, YPos: Integer);
    procedure cbSkillChange(Sender: TObject);
    procedure formClose(Sender: TObject; var Action: TCloseAction);
    procedure Ani1Click(Sender: TObject);
    procedure Ani2Click(Sender: TObject);
    procedure Ani3Click(Sender: TObject);
    procedure Ani4Click(Sender: TObject);
    procedure Ani5Click(Sender: TObject);
    procedure InputTimerTimer(Sender: TObject);
    procedure formKeyPress(Sender: TObject; var Key: Char);
  private
  public
end;

Const
  Styles : Array[0..7] of String = ('Normal','Planet','Element','Comic','Marmor','Retro','Rock','Old School');
  X0 : Byte = 40;
  Y0 : Byte = 82;

Var
  frmBubbles   : TfrmBubbles;
  SpielFeld    : Array[0..11,0..8] of Byte;
  IndexFeld    : Array[1..2,1..70] of Byte;
  ButtonStatus : Array[1..9] of Byte;
  Hiscore      : Array[0..1,0..3,1..10] of THiscore;
  VINI         : TINifile;
  Scr          : TDevMode;
  Punkte       : LongWord;
  Hintergrund, ImgScroll : TBitmap;
  SpielerName, Cheat, AppPath : String;
  Steine, Versuche, oldxres, oldyres : Integer;
  KugelStyle, SteinAnzahl, Index, Fensteraktiv, Buttonaktiv, Schieben, Endlos, Spielstatus, Highscore, Ani, Strich : Byte;

Implementation
{$R SOUNDS.RES}
{$R *.DFM}

procedure PlaySoundRes(const ResName : String);
begin;
  if (frmBubbles.cbSound.Checked) then
    try
      PlaySound(PChar(ResName), hInstance, snd_ASync or snd_Resource);
    except
      ;
    end;
end;

procedure ButtonControl;
Var A : Byte;
begin;
  with frmBubbles Do
    If (Spielstatus > 0) and (Spielstatus < 4) then
      for A := 1 to 9 Do
        if Buttonstatus[A] > 4 then begin;
          Dec(Buttonstatus[A], 5);
          if (A < 8) then begin;
            ImgButton.Draw(Canvas, 680, A * 75 - 5, ButtonStatus[A]);
            ImgButton.Draw(Canvas, 680, A * 75 - 5, 3 + A);
            ImgButton.Draw(Hintergrund.Canvas, 680, A * 75 - 5, ButtonStatus[A]);
            ImgButton.Draw(Hintergrund.Canvas, 680, A * 75 - 5, 3 + A);
          end;
          if (A > 7) then begin;
            ImgButton.Draw(Hintergrund.Canvas, 530, -250 + A * 75, Buttonstatus[A]);
            If Buttonstatus[A] > 0 then begin;
              ImgButton.Draw(Canvas, 530, -250 + A * 75, Buttonstatus[A]);
              ImgButton.Draw(Canvas, 530, -250 + A * 75, 3 + A);
              ImgButton.Draw(Hintergrund.Canvas, 530, -250 + A * 75, 3 + A);
             End;
          end;
        end;
end;


Procedure TfrmBubbles.formCreate(Sender: TObject);
const Namen : Array[1..80] of String[50] =
     ('Gordan Freeman','Indiana Jones','Duke Nukem','Lara Croft','Guybrush Threepwood','Commander Keen','Le Chuck','Doom Warrior','Simon the Soccerer','Moorhuhn',
      'Pamela Anderson','Selma Hayek','Cathrin Cita Jones','Drew Barrymore','Heidi Klum','Christina Aguiliera','Tarra Banks','Jennifer Lopez','Jasmin Gerrat','Sarah Michell Gellah',
      'Batman','Superman','Meteor Man','Iron Man','Radioaktiv Man','Maga Man','Spider Man','Ice Man','X Man','Captian Planet',
      'Homer','Bart','Maggi','March','Lisa','Barney','Moe','Millhouse','Ned','Krusty',
      'Micky Maus','Snoopy','Tom','Jerry','Pinky','Goofy','Brain','Tweety','Road Runner','Bugs Bunny',
      'Caesar','Stalin','Adi H.','Castro','Sadam Hussein','Napoleon','Jelzin','Bill "Billy Boy" Clinton','Dr. Evil With Minimi','RaZoR',
      'Godzilla','King Kong','Frankenstein','Dracula','Bigfoot','Jason','Zombie','Jeti','Werwolf','Der grausame schreckliche unbarmherzige Alf',
      'Michael "Air" Jordan','Vince Carter','Allen Iverson','Stephon Marbury','Kobe Bryant','Kevin Garnett','Steve Francis','Latrell Spreewell','Jason Williams','Mad Max Matze');
var VReg : TRegistry;
    s, m, i, k, p : Integer;
    f : TFileStream;
    ms : TMemoryStream;
    IfScreenMode : Boolean;
begin
{  mcisendstring}

  Randomize;

  AppPath := ExtractFilePath(Application.ExeName);

  Canvas.Font.Name := 'Comic Sans Ms';

  VINI := TINifile.Create(AppPath + 'Bubbles.ini');
  SpielerName := VINI.ReadString('General', 'UserName', '');
  if SpielerName = '' then begin;
     VReg := TRegistry.Create;
     VReg.RootKey := HKEY_LOCAL_MACHINE;
     if VReg.OpenKey('Network\Logon', FALSE) then
        if VReg.ValueExists('username') then
           SpielerName := VReg.ReadString('username')
        else
          SpielerName := 'unbekannt';
          VReg.Free;
        end;
  KugelStyle := VINI.ReadInteger('General', 'Bubble Style', 1);
  cbGameMode.Tag := VINI.ReadInteger('General', 'GameMode', 1);
  cbSkill.Tag := VINI.ReadInteger('General', 'Skill', 1);
  cbsound.Checked := VINI.ReadBool('General', 'PlaySound', TRUE);
  Ani := VINI.ReadInteger('General', 'Ani', 1);
  case Ani of
    1 : ani1.Checked := TRUE;
    2 : ani2.Checked := TRUE;
    3 : ani3.Checked := TRUE;
    4 : ani4.Checked := TRUE;
    5 : ani5.Checked := TRUE;
  end;
  VINI.Free;

  // Load HighScore

  if FileExists(AppPath + 'bubbles.his') then begin;
    f := TFileStream.Create(AppPath + 'bubbles.his', fmShareDenyNone);
    if f.Size = SizeOf(Hiscore) then begin;  // alte Highscoredatei ??? (Bubbles 2000 Beta 1)
      f.Read(HighScore, SizeOf(Hiscore));
      // decodieren der Highscore
      for s := 0 to 1 do
        for m := 0 to 3 do
          for i := 0 to 9 do begin;
            Name := Hiscore[s, m, i].Name;
            for k := 0 to 49 do
              Hiscore[s, m, i].Name[49 - k] := Chr(Ord(Name[k]) - (49 - k));
            p := Hiscore[s, m, i].Punkte;
            Hiscore[s, m, i].Punkte := p div 2;
          end;
      f.Free;
    end
    else begin;                      // neue Highscoredatei (Bubbles 2000 beta 2)
      f.Free;
      try
        HKS.LoadFromFile(AppPath + 'bubbles.his');
      except
        on ECorruptFile do Exit;
        on EStreamError do Exit;
      end;
        ms := TMemoryStream.Create;
      try
        HKS.GetStream('BHSL', ms);
        ms.Read(Hiscore, SizeOf(Hiscore));
        ms.Clear;
        HKS.ClearStreams;
      finally
        ms.Free;
      end;
    end;
  end
  else
  Begin;
    for s := 0 to 1 do
      for m := 0 to 3 do
        for i := 1 to 10 do begin;
          Hiscore[s, m, i].Name := Namen[81 - i - m * 10 - S * 40];
          Hiscore[s, m, i].Punkte := i * 50;
        end;
  End;

  // Auflösung auf 800x600x16 umschalten
  IfScreenMode := FALSE;
  i := 0;
  scr.dmSize := SizeOf(scr);
  while EnumDisplaySettings(nil, i, scr) do begin;    // wird Modus unterstützt
    if (scr.dmPelsWidth = 800) and (scr.dmPelsHeight = 600) then
      IfScreenMode := TRUE;
    i := i + 1;
  end;

  if IfScreenMode then begin;          // wenn Modus unterstützt wird, dann umschalten
    oldxres := Screen.Width;
    oldyres := Screen.Height;

    scr.dmPelsWidth := 800;
    scr.dmPelsHeight := 600;
    ChangeDisplaySettings(scr, 0);
  end
  else begin;
    MessageDlg( 'Die Auflösung 800x600x16 wird von ihrem Computer nicht unterstützt!!!', mtError, [mbOk], 0);
    Application.Terminate
  end;

  Hintergrund := TBitmap.Create;
  Hintergrund.Assign(Spielbild.Picture.Graphic);

  ImgScroll := TBitmap.Create;
  Imgscroll.Assign(Spielbild.Picture.Graphic);
  Imgscroll.Width := 60;
  ImgScroll.Height := 420;
end;

procedure TfrmBubbles.FormPaint(Sender: TObject);
Var A, B : Byte;
begin
  Case Spielstatus of
    0 : Canvas.draw(0, 0, Startbild.Picture.Graphic);
    1, 2, 3 : Canvas.Draw(0, 0, Hintergrund);
    4 : Canvas.Draw(0, 0, Endbild.Picture.graphic);
  End;

  Case Fensteraktiv of
    0 : Begin;
          if Spielstatus > 1 then
            for A := 1 to 10 Do
              for B := 1 to 7 Do
                if SpielFeld[A, B] <> 0 then frmBubbles.Kugellist.Draw(frmBubbles.Canvas, A * 60 - 60 + X0, B * 60 - 60 + Y0, SpielFeld[A, B] - 1 + KugelStyle * 5);
          for A := 5 to Index + 4 Do
            Kugellist.Draw(Canvas, IndexFeld[1, A] * 60 - 60 + X0, IndexFeld[2, A] * 60 -60 + Y0, 40);
    End;
    1 : Begin;
      Canvas.Pen.Color := clWhite;
      canvas.RoundRect(56, 175, 271, 230, 20, 20);
      canvas.RoundRect(293, 175, 510, 230, 20, 20);
      canvas.RoundRect(56, 250, 510, 487, 20, 20);
      Canvas.font.Size := 12;
      Canvas.font.Color := clwhite;
      Canvas.textout(65, 165, 'Spielmodus');
      Canvas.textout(303, 165, 'Schwierigkeitsgrad');
      Canvas.textout(65, 240, 'Highscore');
      if Highscore > 0 then begin;
        Canvas.Pen.Color := clred;
        canvas.RoundRect(63, 244 + (11 - Highscore) * 21, 502, 266 + (11 - Highscore) * 21, 10, 10);
      end;
      Canvas.font.Size := 11;
      for A := 10 downto 1 do begin;
        Canvas.font.Color := clwhite;
        if A = 1 then Canvas.font.Color := clYellow;
        if (11 - Highscore) = A then Canvas.font.Color := clred;
        Canvas.Textout(130, 245 + A * 21, Hiscore[cbSkill.itemindex, cbGameMode.Itemindex, 11 - A].Name);
        Canvas.Textout(70, 245 + A * 21, IntToStr(Hiscore[cbSkill.Itemindex, cbGameMode.Itemindex, 11 - A].Punkte));
      end;
      Canvas.font.Color := clwhite;
    end;
    4 : begin;
      Animationen.Visible := TRUE;
      soundBox.Visible := True;
      Canvas.Draw(245, 110, ImgOptionen.Picture.Graphic);
    end;
    5 : begin;
      Canvas.font.Size := 11;
      Canvas.textout(164, 180, 'Bubbles 2000 ist eigentlich ein sehr simples Spiel.');
      Canvas.textout(102, 210, 'Das einzige was du tun musst, ist mindestens 2 Bubbles der gleichen');
      Canvas.textout(93, 240, 'Farbe weg zu clicken. Ist dies möglich, so werden die Bubbles umkreist.');
      Canvas.textout(102, 270, 'Dann genügt ein Click und sie verschwinden. Da du das Quadrat der');
      Canvas.textout(93, 300, 'entsorgten Bubbles als Punkte gutgeschrieben bekommst, ist es ratsam');
      Canvas.textout(105, 330, 'so viele wie möglich gleichzeitig zu beseitigen. Fördernd ist es auch,');
      Canvas.textout(96, 360, 'etwas im voraus zu denken, um sich nichts zu verbauen. Auf Grund der');
      canvas.textout(90, 390, 'Schwerkraft fallen die oberen Bubbles immer runter. Wenn du dahinter');
      Canvas.textout(85, 420, 'gestiegen bist solltest du die anderen Spielarten ausprobieren...');
      Canvas.Draw(285, 110, ImgHilfe.Picture.Graphic);
    end;
    6 : begin;
      Canvas.Draw(260, 110, ImgCredits.Picture.Graphic);

      Canvas.font.Size := 11;
      Canvas.Pen.Color := clwhite;
      Canvas.RoundRect(394,220,573,236,15,15);
      Canvas.RoundRect(96,182,595,230,15,15);
      Canvas.textout(230, 185, 'programmiert von Mathias Nitzsche & Mirco Menze');
      Canvas.textout(103, 205, '© Copyright 2000 by Future Productions');
      Canvas.textout(395, 211, '    All rights reserved !!!    ');
      Canvas.RoundRect(75,170,225,202,15,15);

      Canvas.RoundRect(216,270,575,300,15,15);
      Canvas.textout(232, 275, 'Robi ,  Blackhead ,  Olek ,  Chris ,  Daniel ,  MoU');
      Canvas.RoundRect(115,257,225,286,15,15);

      Canvas.RoundRect(70,325, 520,475, 15,15);
      Canvas.RoundRect(60,304, 140,330, 15,15);

      Canvas.textout(135, 340, 'alle unsere Freunde & vor allem Freundinnen ,');
      Canvas.textout(165, 360, 'unsere Verwanten (muss schon sein),');
      Canvas.textout(135, 380, 'alle anderen Programmier (ganz wichtig Pawel) ,');
      Canvas.textout(220, 400, 'alle von unsere Schule ,');
      Canvas.textout(190, 420, 'alle B-Baller & Thai-Boxer und');
      Canvas.textout(120, 440, 'den einen oder anderen der uns sonst noch kennt');

      Canvas.font.Size := 12;
      Canvas.textout(80,  175, 'Bubbles 2000 v1.0');
      Canvas.textout(120, 260, 'Beta - Tester');
      Canvas.textout(67,  305, 'Grüße an');
    end;
  End;
End;

procedure TfrmBubbles.formMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; XPos, YPos: Integer);
Var A, B, C, D, E: Byte;
    Dummy : LongInt;
    Von, Bis : Array[1..10] of Byte;
begin
  if Button = mbLeft then begin;
    if (Index > 1) and (Buttonaktiv = 0) then begin
      PlaySoundRes('DROP');
      Inc(Punkte, Index * Index);
      Inc(Steine, Index);
      Inc(Versuche);

      Canvas.Pen.Color := clblack;

      for A := 5 to Index + 4 Do begin;
        SpielFeld[IndexFeld[1, A], IndexFeld[2, A]] := 0;
        Canvas.Ellipse(IndexFeld[1, A] * 60 - 60 + X0, IndexFeld[2, A] * 60 - 60 + Y0, IndexFeld[1, A] * 60 + X0, IndexFeld[2, A] * 60 + Y0);
      end;

      Repeat
        D := 0;
        for A := 1 to 10 do begin;
          Bis[A] := 0;
          Von[A] := 8;
          for B := 1 to 7 do begin;
            if (SpielFeld[A, B] > 0) and (B < Von[A]) then Von[A] := B;
            if (SpielFeld[A, B] = 0) and (Spielfeld[A, B - 1] > 0) then begin;
              Bis[A] := B;
              Inc(D);
            end;
          end;
        end;
        for A := 1 to 10 do
          for B := Bis[A] downto Von[A] Do
            SpielFeld[A, B] := Spielfeld[A, B - 1];
        if Ani < 5 then begin;
          for A := 1 to 60 div Ani Do
            for B := 1 to 10 Do
              if Bis[B] > 0 then begin;
                for dummy := 1 to 20000 + (4 - Ani) * 50000 Do begin; end;
                frmBubbles.canvas.copyrect(Rect(X0 + (B - 1) * 60, Y0 + A * Ani + (Von[B] - 1) * 60, X0 + B * 60, Y0 + A * Ani + (Bis[B] - 1) * 60), frmbubbles.canvas, Rect(X0 + (B - 1) * 60, Y0 + A * Ani - Ani + (Von[B] - 1) * 60, X0 + B * 60, Y0 + A * Ani - Ani+ (Bis[B] - 1) * 60));
              end;
        end
        Else
        for B := 1 to 10 Do
            if Bis[B] > 0 then begin;
              frmBubbles.canvas.copyrect(Rect(X0 + (B - 1) * 60, Y0 + (Von[B]) * 60, X0 + B * 60, Y0 + (Bis[B]) * 60), frmbubbles.canvas, Rect(X0 + (B - 1) * 60, Y0 + (Von[B] - 1) * 60, X0 + B * 60, Y0 + (Bis[B] - 1) * 60));
              frmBubbles.Canvas.Rectangle(X0 + (B - 1) * 60, Y0 + (Von[B] - 1) * 60, X0 + B * 60, Y0 + (Von[B]) * 60);
            end;
      Until D = 0;

      for B := 7 downto Schieben Do
        for A := 11 downto 2 Do
          if ((SpielFeld[A, B] > 0) or (A + B = 18)) and (SpielFeld[A - 1, B] = 0) then begin;
            Bis[B] := 10;
            for C := A to 10 Do
              if SpielFeld[C, B] > 0 then Bis[B] := C;
            for D := B Downto 1 do
              for C := A - 1 to Bis[B] Do
                Spielfeld[C, D] := Spielfeld[C + 1, D];
            if Ani < 5 then begin;
              C := 200 - (Bis[B] - A) * 10 - B * 10  ;
              if (endlos = 1) and (B = 7) then
                for D := 1 to 7 do begin;
                  Spielfeld[10, D] := Random(SteinAnzahl) + 1;
                  Kugellist.Draw(ImgScroll.Canvas, 0, (D - 1) * 60, SpielFeld[10, D] + Kugelstyle * 5 - 1);
                  C := 100 - (Bis[B] - A) * 10 - B * 10;
                end;
              for D := 1 to 60 div Ani Do begin;
                for dummy := 1 to 200 * C + (4 - Ani) * 50000 Do begin; end;
                  frmBubbles.canvas.copyrect(Rect(X0 + (A - 1) * 60 - D * (Ani), Y0 , X0 + Bis[B] * 60 - D * (Ani), Y0 + B * 60), frmbubbles.canvas, Rect(X0 + (A - 1) * 60 - D * (Ani) + (Ani), Y0, X0 + Bis[B] * 60 - D * Ani + Ani, Y0 + B * 60));
                if (endlos = 1) and (B = 7) then
                  frmBubbles.Canvas.CopyRect(Rect(X0 + 600 - D * Ani, Y0, X0 + 600, Y0 + 420), ImgScroll.Canvas, Rect(0,0,D*Ani,420));
              end;
            end
            Else
            begin;
              frmBubbles.canvas.copyrect(Rect(X0 + (A - 2) * 60, Y0 , X0 + (Bis[B] - 1) * 60, Y0 + B * 60), frmbubbles.canvas, Rect(X0 + (A - 1) * 60, Y0, X0 + Bis[B] * 60, Y0 + B * 60));
              frmBubbles.Canvas.Rectangle(X0 + (Bis[B] - 1) * 60, Y0, X0 + Bis[B] * 60, Y0 + B * 60);
              if (endlos = 1) and (B = 7) then
                for D := 1 to 7 do begin;
                  Spielfeld[10, D] := Random(SteinAnzahl) + 1;
                  Kugellist.Draw(FrmBubbles.Canvas, X0 + 540, Y0 + (D - 1) * 60, SpielFeld[10, D] + Kugelstyle * 5 - 1);
                end;
            end;
          end;

      C := 0;
      for A := 1 to 10 Do
        for B := 1 to 7 Do
          if SpielFeld[A, B] > 0 then
            if (SpielFeld[A, B] = SpielFeld[A, B + 1]) or (SpielFeld[A, B] = SpielFeld[A, B - 1]) or (SpielFeld[A, B] = SpielFeld[A + 1, B]) or (SpielFeld[A, B] = SpielFeld[A - 1, B]) then Inc(C);
      if (C = 0) then begin;
//         if Cheat = '' then Punkte := Hiscore[cbSkill.tag, cbGameMode.tag, 10].Punkte + Random(50);
        for A := 1 to 10 Do
          if Punkte > Hiscore[cbSkill.Tag, cbGameMode.Tag, A].Punkte then Highscore := A;
        if Highscore > 0 then begin;
          for A := 1 to Highscore - 1 Do begin;
            Hiscore[cbSkill.ItemIndex, cbGameMode.ItemIndex, A].Name := Hiscore[cbSkill.ItemIndex, cbGameMode.ItemIndex, A + 1].Name;
            Hiscore[cbSkill.ItemIndex, cbGameMode.ItemIndex, A].Punkte := Hiscore[cbSkill.ItemIndex, cbGameMode.ItemIndex, A + 1].Punkte;
          end;
          Hiscore[cbSkill.ItemIndex, cbGameMode.ItemIndex, Highscore].Name := '  ';
          Hiscore[cbSkill.ItemIndex, cbGameMode.ItemIndex, Highscore].Punkte := Punkte;
        end;
        Spielstatus := 3;     // bedeutet Spiel zu Ende
        Buttonaktiv := 10;    // und Highscore zeigen
      end;
    end;

    if Spielstatus = 0 then begin;
      for A := 1 to 7 Do
        if (A <> 2) and (A <> 3) then ButtonStatus[A] := 2 else ButtonStatus[A] := 1;
      Status.Visible := TRUE;
      Spielstatus := 1;
      Paint;
    end;

    If Spielstatus = 4 then Close;

    if (InputTimer.Enabled = FALSE) and (Buttonaktiv > 0) and (Spielstatus < 4) then begin;
      If Buttonaktiv = 10 then Buttonaktiv := 1 else PlaySoundRes('CLICK');
      cbGamemode.visible := FALSE;
      cbSkill.Visible := FALSE;
      ButtonStatus[8] := 5;
      Animationen.Visible := FALSE;
      SoundBox.Visible := false;
      Buttonstatus[Fensteraktiv] := 7;
      If (Buttonaktiv <> 2) and (Buttonaktiv <> 3) then Begin;
        Hintergrund.Canvas.Pen.Mode := pmBlack;
        Hintergrund.Canvas.Pen.Color := clblack;
        Hintergrund.canvas.RoundRect(31,75,646,508,35,35);
        If Buttonstatus[3] <> 1 then ButtonStatus[3] := 6;
        Fensteraktiv := Buttonaktiv;;
      End;
      Case Buttonaktiv of
        1, 4, 5, 6 : begin
          If Buttonaktiv = 1 then Begin;
            Hintergrund.Canvas.Draw(215, 110, ImgNeuesSpiel.Picture.Graphic);
            cbGamemode.Visible := TRUE;
            cbSkill.visible := TRUE;
            cbgamemode.ItemIndex := cbgamemode.Tag;
            cbskill.ItemIndex := cbskill.Tag;
            If Buttonstatus[2] <> 1 then Buttonstatus[2] := 6;
            Buttonstatus[8] := 7;
            if Highscore > 0 then begin;
              PlaySoundRes('HIGHSCORE');
              InputTimer.Enabled := TRUE;
              cbskill.Enabled := FALSE;
              cbGamemode.Enabled := FALSE;
              for a := 1 to 9 do
                Buttonstatus[A] := 6;
            end;
          end;
          Paint;
          If (Buttonaktiv <> 1) and (Spielstatus > 1) and (ButtonStatus[2] <> 2) then ButtonStatus[2] := 7;
          ButtonStatus[Buttonaktiv] := 6;
          if (Spielstatus > 1) and (InputTimer.Enabled = FALSE) then ButtonStatus[9] := 7 else ButtonStatus[9] := 6;
          Buttoncontrol;
          Buttonaktiv := 0;
        end;
        2, 8 : begin;
          if Buttonaktiv = 8 then Begin;
            case cbGameMode.ItemIndex of
              0 : begin Schieben := 7; endlos := 0; end;
              1 : begin Schieben := 7; endlos := 1; end;
              2 : begin Schieben := 1; endlos := 0; end;
              3 : begin Schieben := 1; endlos := 1; end;
            end;
            if cbSkill.ItemIndex = 0 then Steinanzahl := 4 else Steinanzahl := 5;
            cbgamemode.Tag := cbgamemode.ItemIndex;
            cbskill.tag := cbskill.ItemIndex;
            for A := 1 to 3 Do
              Buttonstatus[A] := 7;
            Buttonstatus[8] := 5;
            Buttonstatus[9] := 5;
            Buttonaktiv := 0;
          End;
          for A := 1 to 10 Do
            for B := 1 to 7 Do
              SpielFeld[A, B] := Random(Steinanzahl) + 1;
          Punkte := 0; Versuche := 0; Steine := 0;
          Fensteraktiv := 0;
          If Buttonstatus[3] <> 2 then Buttonstatus[3] := 7;
          Buttonstatus[9] := 5;
          Spielstatus := 2;
          Highscore := 0;
          Paint;
          Status.Repaint;
        end;
        3 : if (Fensteraktiv = 0) and (Spielstatus > 1) then begin;
          Inc(Kugelstyle); if Kugelstyle = 8 then Kugelstyle := 0;
          for A := 1 to 10 Do
            for B := 1 to 7 Do
              if SpielFeld[A, B] <> 0 then frmBubbles.Kugellist.Draw(frmBubbles.Canvas, A * 60 - 60 + X0, B * 60 - 60 + Y0, SpielFeld[A, B] - 1 + KugelStyle * 5);
        end;
        7 : Begin;
          Spielstatus := 4;
          Status.visible := False;
          Paint;
        End;
        9 : begin;
          for a := 1 to 6 Do
            if Buttonstatus[A] <> 2 then ButtonStatus[A] := 7;
          Buttonstatus[8] := 5;
          Buttonstatus[9] := 5;
          Buttonaktiv := 0;
          Fensteraktiv := 0;
          Paint;
        end;
      end;
    end;
  end;
  Index := 0;

End;

Procedure TfrmBubbles.formMouseMove(Sender: TObject; Shift: TShiftState; XPos, YPOs: Integer);
Var A, B, C, D, E, F, X, Y: Integer;
begin
  if (Spielstatus > 0) and (Spielstatus < 4) then begin;
    if ((Ypos < Buttonaktiv * 75 - 5) or (Ypos > Buttonaktiv * 75 + 55) or (XPos < 680) or (XPos > 780)) And (ButtonAktiv > 0) and (ButtonAktiv < 8) and (Fensteraktiv <> Buttonaktiv) then begin;
      ButtonStatus[ButtonAktiv] := 7;
      Buttonaktiv := 0;
      PlaySoundRes('SLIDE');
    end;
    for A := 1 to 7 Do
      if (Ypos > A * 75 - 5) And (Ypos < A * 75 + 55) and (XPos > 680) and (XPos < 780) and (ButtonStatus[A] = 2) then begin;
        ButtonStatus[A] := 8;
        Buttonaktiv := A;
        PlaySoundRes('SLIDE');
      end;
    if Buttonstatus[9] > 0 then begin;
      if ((Ypos < 275 + (Buttonaktiv - 7) * 75 ) or (Ypos > 335 + (Buttonaktiv - 7) * 75) or (XPos < 530) or (XPos > 630)) and (ButtonStatus[Buttonaktiv] > 1) and (Buttonaktiv > 7) then begin;
        ButtonStatus[ButtonAktiv] := 7;
        Buttonaktiv := 0;
        PlaySoundRes('SLIDE');
      end;
      for A := 1 to 2 Do
        if (Ypos > 275 + A * 75 ) And (Ypos < 335 + A * 75) and (XPos > 530) and (XPos < 630) and (ButtonStatus[A + 7] = 2) then begin;
          ButtonStatus[A + 7] := 8;
          Buttonaktiv := A + 7;
          PlaySoundRes('SLIDE');
        end;
    end;
  end;

  ButtonControl;

  if (Spielstatus = 2) and (Fensteraktiv = 0) then begin;
    X := (Xpos - X0 + 60) div 60; Y := (YPos - Y0 + 60) div 60;
    B := 0;
    for A := 5 to Index + 4 Do
      if (IndexFeld[1, A] = X) and (IndexFeld[2, A] = Y) then B := 1;

    if B = 0 then begin
      for A := 5 to Index + 4 Do
        Kugellist.Draw(Canvas, IndexFeld[1, A] * 60 - 60 + X0, IndexFeld[2, A] * 60 - 60 + Y0, SpielFeld[IndexFeld[1, A], IndexFeld[2, A]] + Kugelstyle * 5 - 1);
      Index := 0;
    end;

    if (Ypos - Y0 < 420) and (XPos - X0 < 600) and (Ypos - Y0 >= 0) and (XPos - X0 >= 0) and (SpielFeld[X, Y] <> 0) and (B = 0) then begin;
      C := X; D:= Y; Index := 0;
      for A := 1 to 1000 Do begin;
        B := 0; F:= 0;
        if (SpielFeld[C, D - 1] = SpielFeld[C, D]) then begin; Inc(B); IndexFeld[1, B] := C; IndexFeld[2, B] := D - 1; end;
        if (SpielFeld[C + 1, D] = SpielFeld[C, D]) then begin; Inc(B); IndexFeld[1, B] := C + 1; IndexFeld[2, B] := D; end;
        if (SpielFeld[C, D + 1] = SpielFeld[C, D]) then begin; Inc(B); IndexFeld[1, B] := C; IndexFeld[2, B] := D + 1; end;
        if (SpielFeld[C - 1, D] = SpielFeld[C, D]) then begin; Inc(B); IndexFeld[1, B] := C - 1; IndexFeld[2, B] := D; end;

        if B > 0 then begin;
          B := Random(B) + 1;
          for E := 5 to Index + 4 Do
            if (C = IndexFeld[1, E]) and (D = IndexFeld[2, E]) then F := 1;
          if F = 0 then begin;
            Inc(Index);
            IndexFeld[1, Index + 4] := C; IndexFeld[2, Index + 4] := D;
          end;
          C := IndexFeld[1, B]; D := IndexFeld[2, B];
        end;
      end;
      for A := 5 to Index + 4 Do
        Kugellist.Draw(Canvas, IndexFeld[1, A] * 60 - 60 + X0, IndexFeld[2, A] * 60 -60 + Y0, 40);
    end;
  end;

  case Buttonaktiv of
    0 : case Fensteraktiv of
      0 : Case Spielstatus of
        1 : Begin;
              If Copy(datetimetostr(date), 1,5) = '09.04' then Status.Caption := '>>>  HAPPY  BIRTHDAY  MATZE  ZUM  ' + Inttostr(Strtoint(Copy(datetimetostr(date), 7, 2)) + 17) + '.  <<<'
              else If Copy(datetimetostr(date), 1,5) = '11.06' then Status.Caption := '>>>  HAPPY  BIRTHDAY  MIRCO  ZUM  ' + Inttostr(Strtoint(Copy(datetimetostr(date), 7, 2)) + 18) + '.  <<<'
              else If Copy(datetimetostr(date), 1,5) = '24.12' then Status.Caption := '>>>  FROHLICHE WEIHNACHTEN  <<<'
              else Status.Caption := 'Willkommen beim besten Spiel der Welt';
            End;
        2 : if Index < 2 then Status.Caption := 'Punkte: ' + Inttostr(Punkte) else Status.Caption := 'Punkte: ' + Inttostr(Punkte) + ' (+ ' + InttoStr(Index * Index) + ' Punkte durch ' + IntToStr(Index) + ' Steine)';
        3 : Status.Caption := IntTostr(Punkte) + ' Punkte - ' + IntToStr(Steine) + ' Bubbles (' + IntToStr(Steine div Versuche) + '.' + IntToStr(Steine mod Versuche * 10 div Versuche) + ' pro Click)';
      end;
      1 : Case InputTimer.Enabled of
        True : Status.Caption := 'Gratulation... neue Highscore !!!';
        False : If Spielstatus > 2 then Status.Caption := IntTostr(Punkte) + ' Punkte - ' + IntToStr(Steine) + ' Bubbles (' + IntToStr(Steine div Versuche) + '.' + IntToStr(Steine mod Versuche * 10 div Versuche) + ' pro Click)' else Status.Caption := 'World Highscore unter www.FutureProductions.de';
      End;
      4 : Status.Caption := 'Optionen ...';
      5 : Status.Caption := 'Hilfe ...';
      6 : Status.Caption := 'Credits ...';
    end;
    1 : Status.Caption := 'Neues Spiel beginnen ?';
    2 : Status.Caption := 'Neue Runde starten ?';
    3 : Status.Caption := 'Bubbles-Style : "' + Styles[Kugelstyle] + '" ändern ?';
    4 : Status.Caption := 'Optionen verändern ?';
    5 : Status.Caption := 'Brauche sie Hilfe ?';
    6 : Status.Caption := 'Credits anschauen ?';
    7 : Status.Caption := 'Bubbles 2000 beenden ?';
    8 : Status.Caption := 'Neues Spiel starten ?';
    9 : Status.Caption := 'Zurück zum aktuellen Spiel ?';
  end;
end;

procedure TfrmBubbles.cbSkillChange(Sender: TObject);
begin
  Paint;
  Status.Repaint;
end;

procedure TfrmBubbles.formClose(Sender: TObject; var Action: TCloseAction);
begin
  // Auflösung zurücksetzen
  scr.dmPelsWidth := OldXRes;
  scr.dmPelsHeight := OldYRes;
  ChangeDisplaySettings(scr, 0);

  // Speicher frei geben
  Spielbild.Free;
  Startbild.Free;

  // Einstellungen in der INI sichern
  VINI := TINIFile.Create(AppPath + 'Bubbles.ini');
  try
    VINI.WriteString('General', 'UserName', SpielerName);
    VINI.WriteInteger('General', 'Bubble Style', Kugelstyle);
    VINI.WriteInteger('General', 'GameMode', cbGameMode.Tag);
    VINI.WriteInteger('General', 'Skill', cbSkill.Tag);
    VINI.WriteBool('General', 'PlaySound', CbSound.checked);
    VINI.WriteInteger('General', 'Ani', Ani);
  finally
    VINI.Free;
  end;

  // Delphi Fehler ausbügeln
  ShowWindow(Handle, SW_MINIMIZE);
end;

procedure TfrmBubbles.Ani1Click(Sender: TObject);
begin
  Ani := 1;
end;

procedure TfrmBubbles.Ani2Click(Sender: TObject);
begin
  Ani := 2;
end;
procedure TfrmBubbles.Ani3Click(Sender: TObject);
begin
  Ani := 3;
end;

procedure TfrmBubbles.Ani4Click(Sender: TObject);
begin
  Ani := 4;
end;

procedure TfrmBubbles.Ani5Click(Sender: TObject);
begin
  Ani := 5;
end;

procedure TfrmBubbles.InputTimerTimer(Sender: TObject);
begin
  Canvas.font.Color := clred;
  if Strich = 1 then Strich := 0 else Strich := 1;
  if Strich = 1 then Canvas.TextOut(130,245 + (11 - Highscore) * 21, SpielerName + '_');
  if Strich = 0 then Canvas.TextOut(130,245 + (11 - Highscore) * 21, SpielerName + '   ');
end;

procedure TfrmBubbles.formKeyPress(Sender: TObject; var Key: Char);
Var A : Byte;
    ms : TMemoryStream;
    Attrs : Integer;
begin
  if InputTimer.Enabled = TRUE then begin;
    if Key = #13 then begin;
      if SpielerName = '' then SpielerName := 'unbekannt';
      Hiscore[cbSkill.Tag, cbGameMode.Tag, Highscore].Name := SpielerName;
      Attrs := FileGetAttr(AppPath + 'Bubbles.his');
      FileSetAttr(AppPath + 'Bubbles.his', Attrs - (faReadOnly));
      ms := TMemoryStream.Create;
      try
        ms.Write(Hiscore, SizeOf(Hiscore));
        HKS.AddStream('BHSL', ms);
        ms.Clear;
        HKS.SaveToFile(AppPath + 'bubbles.his');
        HKS.ClearStreams;
      finally
        ms.Free;
      end;
      FileSetAttr(AppPath + 'Bubbles.his', faHidden + faReadOnly);       // Attribute wieder setzen
      Highscore := 0;
      Paint;
      Status.Repaint;
      cbSkill.Enabled := TRUE;
      cbGameMode.Enabled := TRUE;
      InputTimer.Enabled := FALSE;
      for a := 4 to 9 do
        Buttonstatus[A] := 7;
      ButtonControl;
      PlaySoundRes('CLICK');
    end;
    if (Key > #31) and (Key < #255) and (length(SpielerName) < 50) and (Canvas.Penpos.x < 430) then Begin; SpielerName := SpielerName + Key; PlaySoundRes('SLIDE'); End;
    if (Key = #8) and (Length(SpielerName) > 0) then begin;
      SpielerName := Copy(SpielerName, 1, Length(SpielerName) - 1);
      Canvas.TextOut(130,245 + (11 - Highscore) * 21, SpielerName + '_      ');
      PlaySoundRes('SLIDE');
    end;
  end
  else
  begin;
    Cheat := Cheat + Key;
    if Length(Cheat) > 10 then Cheat := Copy(Cheat, 2, Length(Cheat) - 1);
  end;
end;

end.
