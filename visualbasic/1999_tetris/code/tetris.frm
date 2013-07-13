VERSION 5.00
Begin VB.Form TetrisForm 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Tetris"
   ClientHeight    =   6345
   ClientLeft      =   855
   ClientTop       =   1350
   ClientWidth     =   4560
   Icon            =   "TETRIS.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   6345
   ScaleWidth      =   4560
   Begin VB.PictureBox Picture2 
      Enabled         =   0   'False
      Height          =   1490
      Left            =   120
      ScaleHeight     =   1425
      ScaleWidth      =   1035
      TabIndex        =   8
      Top             =   4695
      Width           =   1095
      Begin VB.Image ImgVorschau 
         Height          =   480
         Left            =   300
         Picture         =   "TETRIS.frx":044A
         Top             =   720
         Width           =   480
      End
      Begin VB.Label Label 
         Alignment       =   2  'Zentriert
         BackStyle       =   0  'Transparent
         Caption         =   "Vorschau:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   3
         Left            =   60
         TabIndex        =   9
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Timer Timer 
      Enabled         =   0   'False
      Interval        =   850
      Left            =   1320
      Top             =   120
   End
   Begin VB.PictureBox Picture1 
      Enabled         =   0   'False
      Height          =   4455
      Left            =   120
      ScaleHeight     =   4395
      ScaleWidth      =   1035
      TabIndex        =   1
      Top             =   120
      Width           =   1095
      Begin VB.Label Label 
         Alignment       =   2  'Zentriert
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "Level:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   0
         Left            =   0
         TabIndex        =   7
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label Label 
         Alignment       =   2  'Zentriert
         BackStyle       =   0  'Transparent
         Caption         =   "Punkte:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   1
         Left            =   0
         TabIndex        =   6
         Top             =   1800
         Width           =   1095
      End
      Begin VB.Label LabelPunkte 
         Alignment       =   2  'Zentriert
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   2160
         Width           =   855
      End
      Begin VB.Label LabelLevel 
         Alignment       =   2  'Zentriert
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   0
         TabIndex        =   4
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label Label 
         Alignment       =   2  'Zentriert
         BackStyle       =   0  'Transparent
         Caption         =   "Linien"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   0
         TabIndex        =   3
         Top             =   3120
         Width           =   1095
      End
      Begin VB.Label LabelLinien 
         Alignment       =   2  'Zentriert
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   0
         TabIndex        =   2
         Top             =   3480
         Width           =   1095
      End
   End
   Begin VB.PictureBox Hauptpic 
      AutoRedraw      =   -1  'True
      Enabled         =   0   'False
      FillStyle       =   0  'Ausgefüllt
      FontTransparent =   0   'False
      Height          =   6060
      Left            =   1320
      MousePointer    =   99  'Benutzerdefiniert
      ScaleHeight     =   6000
      ScaleWidth      =   3000
      TabIndex        =   0
      Top             =   120
      Width           =   3060
   End
   Begin VB.Line Line 
      BorderColor     =   &H00FFFFFF&
      Index           =   1
      X1              =   4560
      X2              =   0
      Y1              =   15
      Y2              =   15
   End
   Begin VB.Line Line 
      BorderColor     =   &H00808080&
      Index           =   0
      X1              =   4560
      X2              =   0
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   0
      Left            =   120
      Picture         =   "TETRIS.frx":0894
      Top             =   6240
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   480
      Index           =   14
      Left            =   3720
      Picture         =   "TETRIS.frx":0D86
      Top             =   6600
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   480
      Index           =   13
      Left            =   3120
      Picture         =   "TETRIS.frx":1090
      Top             =   6600
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   480
      Index           =   11
      Left            =   1920
      Picture         =   "TETRIS.frx":139A
      Top             =   6600
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   480
      Index           =   10
      Left            =   1320
      Picture         =   "TETRIS.frx":16A4
      Top             =   6600
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   480
      Index           =   9
      Left            =   720
      Picture         =   "TETRIS.frx":19AE
      Top             =   6600
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   480
      Index           =   12
      Left            =   2520
      Picture         =   "TETRIS.frx":1CB8
      Top             =   6600
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   480
      Index           =   8
      Left            =   120
      Picture         =   "TETRIS.frx":1FC2
      Top             =   6600
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   7
      Left            =   2640
      Picture         =   "TETRIS.frx":22CC
      Top             =   6240
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   6
      Left            =   2280
      Picture         =   "TETRIS.frx":289E
      Top             =   6240
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   5
      Left            =   1920
      Picture         =   "TETRIS.frx":2E70
      Top             =   6240
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   4
      Left            =   1560
      Picture         =   "TETRIS.frx":3442
      Top             =   6240
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   3
      Left            =   1200
      Picture         =   "TETRIS.frx":3A14
      Top             =   6240
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   2
      Left            =   840
      Picture         =   "TETRIS.frx":3FE6
      Top             =   6240
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   1
      Left            =   480
      Picture         =   "TETRIS.frx":45B8
      Top             =   6240
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Menu PopUp_Datei 
      Caption         =   "&Datei"
      Begin VB.Menu PopUp_Datei_Neu 
         Caption         =   "&Neu"
         Shortcut        =   {F2}
      End
      Begin VB.Menu PopUp_Datei_Pause 
         Caption         =   "&Pause"
         Enabled         =   0   'False
         Shortcut        =   {F3}
      End
      Begin VB.Menu PopUp_Datei_Beenden 
         Caption         =   "&Beenden"
         Shortcut        =   {F4}
      End
   End
   Begin VB.Menu PopUp_Schwierigkeit 
      Caption         =   "&Schwierigkeit"
      Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel 
         Caption         =   "Anfangs&level"
         Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel_Bestimmen 
            Caption         =   "0"
            Checked         =   -1  'True
            Index           =   0
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel_Bestimmen 
            Caption         =   "1"
            Index           =   1
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel_Bestimmen 
            Caption         =   "2"
            Index           =   2
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel_Bestimmen 
            Caption         =   "3"
            Index           =   3
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel_Bestimmen 
            Caption         =   "4"
            Index           =   4
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel_Bestimmen 
            Caption         =   "5"
            Index           =   5
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel_Bestimmen 
            Caption         =   "6"
            Index           =   6
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel_Bestimmen 
            Caption         =   "7"
            Index           =   7
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel_Bestimmen 
            Caption         =   "8"
            Index           =   8
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel_Bestimmen 
            Caption         =   "9"
            Index           =   9
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangslevel_Bestimmen 
            Caption         =   "10"
            Index           =   10
         End
      End
      Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen 
         Caption         =   "Anfangs&reihen"
         Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen_Bestimmen 
            Caption         =   "0"
            Checked         =   -1  'True
            Index           =   0
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen_Bestimmen 
            Caption         =   "1"
            Index           =   1
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen_Bestimmen 
            Caption         =   "2"
            Index           =   2
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen_Bestimmen 
            Caption         =   "3"
            Index           =   3
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen_Bestimmen 
            Caption         =   "4"
            Index           =   4
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen_Bestimmen 
            Caption         =   "5"
            Index           =   5
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen_Bestimmen 
            Caption         =   "6"
            Index           =   6
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen_Bestimmen 
            Caption         =   "7"
            Index           =   7
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen_Bestimmen 
            Caption         =   "8"
            Index           =   8
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen_Bestimmen 
            Caption         =   "9"
            Index           =   9
         End
         Begin VB.Menu PopUp_Schwierigkeit_Anfangsreihen_Bestimmen 
            Caption         =   "10"
            Index           =   10
         End
      End
   End
   Begin VB.Menu PopUp_Hilfe 
      Caption         =   "&?"
      Begin VB.Menu PopUp_Hilfe_Info 
         Caption         =   "&Info"
      End
   End
End
Attribute VB_Name = "TetrisForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Feld(0 To 12, 0 To 21)
Dim BC(0 To 10) As Long
Public X1 As Byte
Public Y1 As Byte
Public X2 As Byte
Public Y2 As Byte
Public X3 As Byte
Public Y3 As Byte
Public X4 As Byte
Public Y4 As Byte
Public Jetzt As Byte
Public Danach As Byte
Public Position As Byte
Public Anfangslevel As Byte
Public AnfangsReihen As Byte

Public Sub Löschen()
   Hauptpic.PaintPicture Img(0).Picture, X1 * 300 - 300, Y1 * 300 - 300, 300, 300, 0, 0, 300, 300
   Hauptpic.PaintPicture Img(0).Picture, X2 * 300 - 300, Y2 * 300 - 300, 300, 300, 0, 0, 300, 300
   Hauptpic.PaintPicture Img(0).Picture, X3 * 300 - 300, Y3 * 300 - 300, 300, 300, 0, 0, 300, 300
   Hauptpic.PaintPicture Img(0).Picture, X4 * 300 - 300, Y4 * 300 - 300, 300, 300, 0, 0, 300, 300
End Sub

Public Sub Erstellen()
   Hauptpic.PaintPicture Img(Jetzt).Picture, X1 * 300 - 300, Y1 * 300 - 300, 300, 300, 0, 0, 300, 300
   Hauptpic.PaintPicture Img(Jetzt).Picture, X2 * 300 - 300, Y2 * 300 - 300, 300, 300, 0, 0, 300, 300
   Hauptpic.PaintPicture Img(Jetzt).Picture, X3 * 300 - 300, Y3 * 300 - 300, 300, 300, 0, 0, 300, 300
   Hauptpic.PaintPicture Img(Jetzt).Picture, X4 * 300 - 300, Y4 * 300 - 300, 300, 300, 0, 0, 300, 300
End Sub

Public Sub Level()
   If LabelLevel.Caption < 10 Then If LabelLinien.Caption > ((LabelLevel.Caption + 1) * 10) - 1 Then LabelLevel.Caption = LabelLevel.Caption + 1:
   TetrisForm.BackColor = BC(LabelLevel.Caption)
   Timer.Interval = 860 - LabelLevel.Caption * 80
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
If PopUp_Datei_Pause.Checked = False Then
   Select Case KeyAscii
          Case 53
               Löschen
               For A = 1 To 18
                   If Feld(X1, Y1 + 1) = 0 And Feld(X2, Y2 + 1) = 0 And Feld(X3, Y3 + 1) = 0 And Feld(X4, Y4 + 1) = 0 Then
                       LabelPunkte.Caption = LabelPunkte.Caption + 1
                       Y1 = Y1 + 1
                       Y2 = Y2 + 1
                       Y3 = Y3 + 1
                       Y4 = Y4 + 1
                   End If
               Next A
               Erstellen
               Feld(X1, Y1) = Jetzt
               Feld(X2, Y2) = Jetzt
               Feld(X3, Y3) = Jetzt
               Feld(X4, Y4) = Jetzt
               Control
               Spielen
          
          Case 56
               If Jetzt = 1 Then
                  If Position = 1 Then
                     Position = 2
                     If Feld(X2, Y2 - 1) = 0 And Feld(X2, Y2 + 1) = 0 And Feld(X2, Y2 + 2) = 0 Then
                        Löschen
                        X1 = X2:  Y1 = Y2 - 1
                        X3 = X2:  Y3 = Y2 + 1
                        X4 = X2:  Y4 = Y2 + 2
                        Erstellen
                     End If
                  Else
                     If Feld(X2 - 1, Y2) = 0 And Feld(X2 + 1, Y2) = 0 And Feld(X2 + 2, Y2) = 0 Then
                        Position = 1
                        Löschen
                        X1 = X2 - 1: Y1 = Y2
                        X3 = X2 + 1: Y3 = Y2
                        X4 = X2 + 2: Y4 = Y2
                        Erstellen
                     End If
                  End If
               End If

               If Jetzt = 2 Then
                  If Position = 1 Then
                     Position = 2
                     If Feld(X1, Y1 - 1) = 0 And Feld(X2, Y2 + 1) = 0 And Feld(X2 + 1, Y2 - 1) = 0 Then
                        Löschen
                        X1 = X2: Y1 = Y2 + 1
                        X3 = X2: Y3 = Y2 - 1
                        X4 = X2 + 1: Y4 = Y2 - 1
                        Erstellen
                     End If
                  ElseIf Position = 2 Then
                     If Feld(X1 - 1, Y1) = 0 And Feld(X2 + 1, Y2) = 0 And Feld(X2 - 1, Y2 - 1) = 0 Then
                        Position = 3
                        Löschen
                        X1 = X1 + 1: Y1 = Y2
                        X3 = X2 - 1: Y3 = Y2
                        X4 = X2 - 1: Y4 = Y2 - 1
                        Erstellen
                     End If
                  ElseIf Position = 3 Then
                     If Feld(X1, Y1 - 1) = 0 And Feld(X2, Y2 + 1) = 0 And Feld(X2 - 1, Y2 + 1) = 0 Then
                        Position = 4
                        Löschen
                        X1 = X2: Y1 = Y2 - 1
                        X3 = X2: Y3 = Y2 + 1
                        X4 = X2 - 1: Y4 = Y2 + 1
                        Erstellen
                     End If
                  ElseIf Position = 4 Then
                     If Feld(X1 - 1, Y1) = 0 And Feld(X2 + 1, Y2) = 0 And Feld(X2 + 1, Y2 + 1) = 0 Then
                        Position = 1
                        Löschen
                        X1 = X2 - 1: Y1 = Y2
                        X3 = X3 + 1: Y3 = Y2
                        X4 = X2 + 1: Y4 = Y2 + 1
                        Erstellen
                     End If
                  End If
               End If

               If Jetzt = 3 Then
                  If Position = 1 Then
                     If Feld(X1, Y1 - 1) = 0 And Feld(X2, Y2 + 1) = 0 And Feld(X2 + 1, Y2 + 1) = 0 Then
                        Position = 2
                        Löschen
                        X1 = X2: Y1 = Y2 + 1
                        X3 = X2: Y3 = Y2 - 1
                        X4 = X2 + 1: Y4 = Y2 + 1
                        Erstellen
                     End If
                  ElseIf Position = 2 Then
                     If Feld(X1 - 1, Y1) = 0 And Feld(X2 + 1, Y2) = 0 And Feld(X2 + 1, Y2 - 1) = 0 Then
                        Position = 3
                        Löschen
                        X1 = X1 + 1: Y1 = Y2
                        X3 = X2 - 1: Y3 = Y2
                        X4 = X2 + 1: Y4 = Y2 - 1
                        Erstellen
                     End If
                  ElseIf Position = 3 Then
                     If Feld(X1 - 1, Y1 - 1) = 0 And Feld(X2, Y2 - 1) = 0 And Feld(X2, Y2 + 1) = 0 Then
                        Position = 4
                        Löschen
                        X1 = X2: Y1 = Y2 - 1
                        X3 = X2: Y3 = Y2 + 1
                        X4 = X2 - 1: Y4 = Y2 - 1
                        Erstellen
                     End If
                  ElseIf Position = 4 Then
                     If Feld(X1 - 1, Y1) = 0 And Feld(X2 + 1, Y2) = 0 And Feld(X2 - 1, Y2 + 1) = 0 Then
                        Position = 1
                        Löschen
                        X1 = X2 - 1: Y1 = Y2
                        X3 = X3 + 1: Y3 = Y2
                        X4 = X2 - 1: Y4 = Y2 + 1
                        Erstellen
                     End If
                  End If
               End If

               If Jetzt = 5 Then
                  If Position = 1 Then
                     If Feld(X2, Y2 - 1) = 0 Then
                        Position = 2
                        Löschen
                        X1 = X2: Y1 = Y2 - 1
                        Erstellen
                     End If
                  ElseIf Position = 2 Then
                     If Feld(X2 - 1, Y2) = 0 Then
                        Position = 3
                        Löschen
                        X4 = X2 - 1: Y4 = Y2
                        Erstellen
                     End If
                  ElseIf Position = 3 Then
                     If Feld(X2, Y2 + 1) = 0 Then
                        Position = 4
                        Löschen
                        X3 = X2: Y3 = Y2 + 1
                        Erstellen
                     End If
                  ElseIf Position = 4 Then
                     If Feld(X2 + 1, Y2) = 0 Then
                        Position = 1
                        Löschen
                        X1 = X2 - 1: Y1 = Y2
                        X3 = X3 + 1: Y3 = Y2
                        X4 = X2: Y4 = Y2 + 1
                        Erstellen
                     End If
                  End If
               End If

               If Jetzt = 6 Then
                  If Position = 1 Then
                     Position = 2
                     If Feld(X1, Y1 - 1) = 0 And Feld(X2, Y2 + 1) = 0 Then
                        Löschen
                        X3 = X1:  Y3 = Y1 - 1
                        X4 = X2:  Y4 = Y2 + 1
                        Erstellen
                     End If
                  Else
                     If Feld(X1 - 1, Y1 + 1) = 0 And Feld(X1, Y1 + 1) = 0 Then
                        Position = 1
                        Löschen
                        X3 = X1 - 1: Y3 = Y1 + 1
                        X4 = X1
                        Erstellen
                     End If
                  End If
               End If

               If Jetzt = 7 Then
                  If Position = 1 Then
                     Position = 2
                     If Feld(X2, Y2 - 1) = 0 And Feld(X1, Y1 + 1) = 0 Then
                        Löschen
                        X3 = X2:  Y3 = Y2 - 1
                        X4 = X1
                        Erstellen
                     End If
                  Else
                     If Feld(X2, Y2 + 1) = 0 And Feld(X2 + 1, Y2 + 1) = 0 And Feld(X1, Y2 + 1) = 0 Then
                        Position = 1
                        Löschen
                        X3 = X2: Y3 = Y1 + 1
                        X4 = X2 + 1
                        Erstellen
                     End If
                  End If
               End If
          
          Case 52
               If Feld(X1 - 1, Y1) = 0 And Feld(X2 - 1, Y2) = 0 And Feld(X3 - 1, Y3) = 0 And Feld(X4 - 1, Y4) = 0 Then
                  Löschen
                  X1 = X1 - 1
                  X2 = X2 - 1
                  X3 = X3 - 1
                  X4 = X4 - 1
               End If
               Erstellen
          
          Case 54
               If Feld(X1 + 1, Y1) = 0 And Feld(X2 + 1, Y2) = 0 And Feld(X3 + 1, Y3) = 0 And Feld(X4 + 1, Y4) = 0 Then
                  Löschen
                  X1 = X1 + 1
                  X2 = X2 + 1
                  X3 = X3 + 1
                  X4 = X4 + 1
               End If
               Erstellen
    End Select
End If
End Sub

Public Sub Form_Load()
   
   Randomize
   
   BC(0) = &HC0C0C0         ' Grau
   BC(1) = &HFFFF00         ' hellblau
   BC(2) = &HFF00&          ' grün
   BC(3) = &HFF00FF         ' lila
   BC(4) = &HFF0000         ' blau
   BC(5) = &H404080         ' braun
   BC(6) = &HFF&            ' rot
   BC(7) = &HE0E0E0         ' Hellgrau
   BC(8) = &HFFFF&          ' gelb
   BC(9) = &H80FF&          ' Orange
   BC(10) = &H0&            ' schwarz
   
   For A = 0 To 12
       Feld(A, 21) = 1
       Feld(A, 0) = 1
   Next A
   For A = 0 To 21
       Feld(0, A) = 1
       Feld(11, A) = 1
       Feld(12, A) = 1
   Next A

End Sub

Private Sub PopUp_Datei_Beenden_Click()
   Unload Form
End Sub

Private Sub PopUp_Datei_Neu_Click()
   
   Position = 1
   
   PopUp_Datei_Pause.Enabled = True
   PopUp_Datei_Pause.Checked = False
      
   Hauptpic.BackColor = &H8000000F
   
   For X = 1 To 10
       For Y = 1 To 20
           Feld(X, Y) = 0
       Next Y
   Next X
   
   LabelLevel.Caption = Anfangslevel

   Level
   
   If AnfangsReihen > 0 Then
      For A = 1 To AnfangsReihen
          For B = 1 To 10
              Feld(B, 21 - A) = Int(Rnd * 8)
          Next B
          Feld(Int(Rnd * 10) + 1, 21 - A) = 0
      Next A
   End If
      
   For F = 1 To 10
       For G = 1 To 20
           Hauptpic.PaintPicture Img(Feld(F, G)).Picture, F * 300 - 300, G * 300 - 300, 300, 300, 0, 0, 300, 300
       Next G
   Next F
      
   LabelLinien.Caption = "0"
   LabelPunkte.Caption = "0" + AnfangsReihen * 1000
   
   Danach = Int(Rnd * 7) + 1

   Timer.Enabled = True

   Spielen
End Sub

Private Sub PopUp_Datei_Pause_Click()
   
   If PopUp_Datei_Pause.Checked = True Then
      PopUp_Datei_Pause.Checked = False
      Timer.Enabled = True
   Else
      PopUp_Datei_Pause.Checked = True
      Timer.Enabled = fasle
   End If
End Sub

Private Sub PopUp_Hilfe_Info_Click()
   MsgBox "Tetris Deluxe wurde erdacht, designed, programmiert, " + Chr(13) + "getestet und auch gerne gespielt von Mathias Nitzsche.", vbOKOnly + vbInformation, "Info..."
End Sub

Private Sub PopUp_Schwierigkeit_Anfangslevel_Bestimmen_Click(Index As Integer)
   For A = 0 To 10
       PopUp_Schwierigkeit_Anfangslevel_Bestimmen(A).Checked = False
   Next A
   
   PopUp_Schwierigkeit_Anfangslevel_Bestimmen(Index).Checked = True
   
   Anfangslevel = Index
End Sub

Private Sub PopUp_Schwierigkeit_Anfangsreihen_Bestimmen_Click(Index As Integer)
   For A = 0 To 10
       PopUp_Schwierigkeit_Anfangsreihen_Bestimmen(A).Checked = False
   Next A
   
   PopUp_Schwierigkeit_Anfangsreihen_Bestimmen(Index).Checked = True

   AnfangsReihen = Index
End Sub

Public Sub Timer_Timer()
   If Feld(X1, Y1 + 1) = 0 And Feld(X2, Y2 + 1) = 0 And Feld(X3, Y3 + 1) = 0 And Feld(X4, Y4 + 1) = 0 Then
      Löschen
      Y1 = Y1 + 1
      Y2 = Y2 + 1
      Y3 = Y3 + 1
      Y4 = Y4 + 1
   Else
      Erstellen
      Feld(X1, Y1) = Jetzt
      Feld(X2, Y2) = Jetzt
      Feld(X3, Y3) = Jetzt
      Feld(X4, Y4) = Jetzt
      Control
      Spielen
   End If
   
   Erstellen
End Sub

Public Sub Spielen()
   
   If Y1 < 3 Then Position = Position + 1 Else Position = 1
   If Position = 5 Then MsgBox "Sie haben ihr Tetrisspiel mit" + Chr(13) + LabelPunkte.Caption + " Punkten beendet.", vbOKOnly + vbInformation, "Verloren...": Timer.Enabled = fasle: PopUp_Datei_Pause.Enabled = fasle
     
   Jetzt = Danach
   Danach = Int(Rnd * 7) + 1
   ImgVorschau.Picture = Img(Danach + 7).Picture

   Select Case Jetzt
          Case 1: X1 = 4: Y1 = 1: X2 = 5: Y2 = 1: X3 = 6: Y3 = 1: X4 = 7: Y4 = 1
          Case 2: X1 = 4: Y1 = 1: X2 = 5: Y2 = 1: X3 = 6: Y3 = 1: X4 = 6: Y4 = 2
          Case 3: X1 = 4: Y1 = 1: X2 = 5: Y2 = 1: X3 = 6: Y3 = 1: X4 = 4: Y4 = 2
          Case 4: X1 = 5: Y1 = 1: X2 = 6: Y2 = 1: X3 = 5: Y3 = 2: X4 = 6: Y4 = 2
          Case 5: X1 = 4: Y1 = 1: X2 = 5: Y2 = 1: X3 = 6: Y3 = 1: X4 = 5: Y4 = 2
          Case 6: X1 = 5: Y1 = 1: X2 = 6: Y2 = 1: X3 = 4: Y3 = 2: X4 = 5: Y4 = 2
          Case 7: X1 = 4: Y1 = 1: X2 = 5: Y2 = 1: X3 = 5: Y3 = 2: X4 = 6: Y4 = 2
   End Select
End Sub

Public Sub Control()
   For Y = 2 To 20
       Test = 0
       For X = 1 To 10
           If Feld(X, Y) <> 0 Then Test = Test + 1
       Next X
       If Test = 10 Then
          Reihe = Reihe + 1
          LabelLinien.Caption = LabelLinien.Caption + 1
          For W = Y - 1 To 2 Step -1
              For V = 1 To 10
                  Feld(V, W + 1) = Feld(V, W)
              Next V
          Next W
       End If
   Next Y
   If Reihe > 0 Then
      For Y = 1 To 20
          For X = 1 To 10
              Hauptpic.PaintPicture Img(Feld(X, Y)).Picture, X * 300 - 300, Y * 300 - 300, 300, 300, 0, 0, 300, 300
          Next X
      Next Y
      Select Case Reihe
             Case 1: M = 40
             Case 2: M = 100
             Case 3: M = 300
             Case 4: M = 1200
      End Select
      LabelPunkte.Caption = LabelPunkte.Caption + (LabelLevel.Caption + 1) * M
      Level
   End If
End Sub

