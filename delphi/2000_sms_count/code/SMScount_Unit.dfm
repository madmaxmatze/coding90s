object Form1: TForm1
  Left = 192
  Top = 107
  Width = 550
  Height = 199
  Caption = 'Letter - Count'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 144
    Width = 137
    Height = 20
    Caption = 'Buchstabenanzahl:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Count: TLabel
    Left = 168
    Top = 144
    Width = 33
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Memo: TMemo
    Left = 24
    Top = 16
    Width = 497
    Height = 121
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = MemoChange
  end
end
