object Form1: TForm1
  Left = 149
  Top = 189
  Width = 700
  Height = 500
  Caption = 'Matze'#39's Polyflow'
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 40
    Top = 16
  end
end
