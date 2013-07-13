object Main: TMain
  Left = 356
  Top = 243
  BorderStyle = bsSingle
  Caption = 'E-Mail-Client'
  ClientHeight = 100
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 89
    Height = 65
    Caption = 'Benutzer-Daten'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 16
    Width = 89
    Height = 65
    Caption = 'Server abrufen'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 16
    Width = 97
    Height = 65
    Caption = 'Mail versenden'
    TabOrder = 2
    OnClick = Button3Click
  end
end
