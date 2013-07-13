object User: TUser
  Left = 127
  Top = 119
  Width = 582
  Height = 386
  Caption = 'Benutzer einstellen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 192
    Width = 40
    Height = 16
    Caption = 'Name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 224
    Width = 92
    Height = 16
    Caption = 'E-Mail KontoNr:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 256
    Width = 76
    Height = 16
    Caption = 'Pop3-Server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 16
    Top = 320
    Width = 75
    Height = 16
    Caption = 'Smtp-Server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 288
    Width = 58
    Height = 16
    Caption = 'Passwort:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 16
    Top = 168
    Width = 95
    Height = 16
    Caption = 'E-Mail Adresse:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 40
    Top = 236
    Width = 43
    Height = 13
    Caption = '(optional)'
    Transparent = True
  end
  object name: TEdit
    Left = 120
    Top = 192
    Width = 353
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'Mathias Nitzsche'
  end
  object Konto: TEdit
    Left = 120
    Top = 224
    Width = 353
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '7276352'
  end
  object Passwort: TMaskEdit
    Left = 120
    Top = 288
    Width = 353
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
    Text = 'stefan2000'
  end
  object Adresse: TEdit
    Left = 120
    Top = 160
    Width = 353
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'MadMaxMatze@gmx.de'
  end
  object TreeView1: TTreeView
    Left = 8
    Top = 8
    Width = 449
    Height = 137
    Indent = 19
    ReadOnly = True
    TabOrder = 4
    Items.Data = {
      03000000290000000000000000000000FFFFFFFFFFFFFFFF0000000002000000
      104D617468696173204E69747A736368652B0000000000000000000000FFFFFF
      FFFFFFFFFF0000000000000000124D61644D61784D41747A6540676D782E6465
      2B0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000124D6164
      4D61784D41747A65407765622E6465230000000000000000000000FFFFFFFFFF
      FFFFFF00000000020000000A416E6E65204B6C61747429000000000000000000
      0000FFFFFFFFFFFFFFFF000000000000000010416E6E654B6C61747440676D78
      2E64652C0000000000000000000000FFFFFFFFFFFFFFFF000000000000000013
      446965484173656E6D616D6140676D782E6465240000000000000000000000FF
      FFFFFFFFFFFFFF00000000010000000B4D61747A65204B6C696E6B2800000000
      00000000000000FFFFFFFFFFFFFFFF00000000000000000F4465724B696C696B
      40676D782E6465}
  end
  object pop3server: TComboBox
    Left = 120
    Top = 256
    Width = 353
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 5
    Text = 'pop.gmx.de'
    Items.Strings = (
      'pop.gmx.de'
      'pop3.web.de'
      'pop.t-online.de'
      'pop.mail.yahoo.de'
      'pop3.freenet.de')
  end
  object smtpserver: TComboBox
    Left = 120
    Top = 320
    Width = 353
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 6
    Text = 'mail.gmx.de'
    Items.Strings = (
      'mail.gmx.de'
      'smtp.web.de'
      'mailto.t-online.de'
      'smtp.mail.yahoo.de'
      'mx.freenet.de')
  end
end
