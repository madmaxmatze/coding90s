object Form1: TForm1
  Left = 234
  Top = 154
  BorderStyle = bsSingle
  Caption = 'Matzes PictureSnap'
  ClientHeight = 108
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = -8
    Top = 144
    Width = 800
    Height = 600
    Visible = False
  end
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 166
    Height = 16
    Caption = 'Sekunden bis zum Snap'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 208
    Top = 40
    Width = 156
    Height = 13
    Caption = '1   2    3   4    5   6   7    8    9  10'
  end
  object TrackBar1: TTrackBar
    Left = 200
    Top = 8
    Width = 169
    Height = 33
    Min = 1
    Orientation = trHorizontal
    Frequency = 1
    Position = 1
    SelEnd = 0
    SelStart = 0
    TabOrder = 0
    TickMarks = tmBottomRight
    TickStyle = tsAuto
  end
  object Button1: TButton
    Left = 16
    Top = 64
    Width = 361
    Height = 33
    Caption = 'Screenshoot nehmen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 40
    Width = 57
    Height = 33
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
  end
end
