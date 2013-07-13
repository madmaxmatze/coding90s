VERSION 5.00
Begin VB.Form TicForm 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Tic Tac Toe"
   ClientHeight    =   4215
   ClientLeft      =   1710
   ClientTop       =   2025
   ClientWidth     =   3120
   Icon            =   "TIC.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   281
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   208
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   975
      Index           =   9
      Left            =   2040
      ScaleHeight     =   915
      ScaleWidth      =   915
      TabIndex        =   15
      Top             =   3120
      Width           =   975
   End
   Begin VB.Frame Frame 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   972
      Left            =   120
      TabIndex        =   8
      Top             =   0
      Width           =   2895
      Begin VB.Image Img 
         Height          =   480
         Index           =   1
         Left            =   -60
         Picture         =   "TIC.frx":030A
         Top             =   480
         Visible         =   0   'False
         Width           =   480
      End
      Begin VB.Image Img 
         Height          =   480
         Index           =   0
         Left            =   -60
         Picture         =   "TIC.frx":0614
         Top             =   120
         Visible         =   0   'False
         Width           =   480
      End
      Begin VB.Label Label 
         Caption         =   ":"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   1
         Left            =   2160
         TabIndex        =   14
         Top             =   600
         Visible         =   0   'False
         Width           =   135
      End
      Begin VB.Label Label 
         Caption         =   ":"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   255
         Index           =   0
         Left            =   2160
         TabIndex        =   13
         Top             =   240
         Visible         =   0   'False
         Width           =   135
      End
      Begin VB.Label LabelName 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   12
         Top             =   600
         Width           =   1695
      End
      Begin VB.Label LabelName 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   11
         Top             =   240
         Width           =   1695
      End
      Begin VB.Label LabelPunkte 
         Alignment       =   2  'Zentriert
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   255
         Index           =   1
         Left            =   2400
         TabIndex        =   10
         Top             =   240
         Width           =   375
      End
      Begin VB.Label LabelPunkte 
         Alignment       =   2  'Zentriert
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Index           =   2
         Left            =   2400
         TabIndex        =   9
         Top             =   600
         Width           =   375
      End
   End
   Begin VB.Timer WinAktiv 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   120
      Top             =   1200
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   975
      Index           =   8
      Left            =   1080
      ScaleHeight     =   915
      ScaleWidth      =   915
      TabIndex        =   7
      Top             =   3120
      Width           =   975
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   975
      Index           =   6
      Left            =   2040
      ScaleHeight     =   915
      ScaleWidth      =   915
      TabIndex        =   5
      Top             =   2160
      Width           =   975
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   975
      Index           =   3
      Left            =   2040
      ScaleHeight     =   915
      ScaleWidth      =   915
      TabIndex        =   2
      Top             =   1200
      Width           =   975
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   975
      Index           =   7
      Left            =   120
      ScaleHeight     =   915
      ScaleWidth      =   915
      TabIndex        =   6
      Top             =   3120
      Width           =   975
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   975
      Index           =   5
      Left            =   1080
      ScaleHeight     =   915
      ScaleWidth      =   915
      TabIndex        =   4
      Top             =   2160
      Width           =   975
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   975
      Index           =   2
      Left            =   1080
      ScaleHeight     =   915
      ScaleWidth      =   915
      TabIndex        =   1
      Top             =   1200
      Width           =   975
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   975
      Index           =   4
      Left            =   120
      ScaleHeight     =   915
      ScaleWidth      =   915
      TabIndex        =   3
      Top             =   2160
      Width           =   975
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   975
      Index           =   1
      Left            =   120
      ScaleHeight     =   915
      ScaleWidth      =   915
      TabIndex        =   0
      Top             =   1200
      Width           =   975
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   200
      Y1              =   72
      Y2              =   72
   End
   Begin VB.Image Img 
      Height          =   900
      Index           =   5
      Left            =   3120
      Picture         =   "TIC.frx":091E
      Top             =   3120
      Visible         =   0   'False
      Width           =   900
   End
   Begin VB.Image Img 
      Height          =   900
      Index           =   4
      Left            =   3120
      Picture         =   "TIC.frx":1B70
      Top             =   2160
      Visible         =   0   'False
      Width           =   900
   End
   Begin VB.Image Img 
      Height          =   900
      Index           =   3
      Left            =   3120
      Picture         =   "TIC.frx":2DC2
      Top             =   1200
      Visible         =   0   'False
      Width           =   900
   End
   Begin VB.Image Img 
      Height          =   900
      Index           =   2
      Left            =   3120
      Picture         =   "TIC.frx":5834
      Top             =   240
      Visible         =   0   'False
      Width           =   900
   End
   Begin VB.Menu PopUp_Datei 
      Caption         =   "&Datei"
      Begin VB.Menu PopUp_Datei_Neu 
         Caption         =   "&Neu"
         Begin VB.Menu PopUp_Datei_Neu_NeueRunde 
            Caption         =   "Neue &Runde"
            Enabled         =   0   'False
            Shortcut        =   {F2}
         End
         Begin VB.Menu PopUp_Datei_Neu_Strich 
            Caption         =   "-"
         End
         Begin VB.Menu PopUp_Datei_Neu_2Spieler 
            Caption         =   "Neues Spiel für 2 &Spieler"
            Shortcut        =   {F3}
         End
         Begin VB.Menu PopUp_Datei_Neu_GegenComputer 
            Caption         =   "Neues Spiel Gegen &Computer"
            Enabled         =   0   'False
            Shortcut        =   {F4}
         End
      End
      Begin VB.Menu PopUp_Datei_Strich 
         Caption         =   "-"
      End
      Begin VB.Menu PopUp_Datei_Beenden 
         Caption         =   "&Beenden"
      End
   End
   Begin VB.Menu PopUp_Datei_Hilfe 
      Caption         =   "&?"
      Begin VB.Menu PopUp_Hilfe_HiIfe 
         Caption         =   "&Hilfe"
         Shortcut        =   {F1}
      End
      Begin VB.Menu PopUp_Hilfe_Strich 
         Caption         =   "-"
      End
      Begin VB.Menu PopUp_Hilfe_Info 
         Caption         =   "&Info..."
      End
   End
End
Attribute VB_Name = "TicForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public A As Byte
Public B As Byte
Public C As Byte
Public D As Byte
Public Aktiv As Byte
Public WAktiv As Byte






Private Sub Pic_Click(Index As Integer)
A = 0
If Pic(Index).Picture = LoadPicture() Then
   If Aktiv = 1 Then Aktiv = 2 Else Aktiv = 1
   Pic(Index).Picture = Img(Aktiv + 1).Picture
   For Sp = 2 To 3
       For T = 1 To 3
           If Pic(T * 3 - 2).Picture = Img(Sp).Picture And Pic(T * 3 - 1).Picture = Img(Sp).Picture And Pic(T * 3).Picture = Img(Sp).Picture Then A = T * 3 - 2: B = T * 3 - 1: C = T * 3: D = Sp
           If Pic(T).Picture = Img(Sp).Picture And Pic(T + 3).Picture = Img(Sp).Picture And Pic(T + 6).Picture = Img(Sp).Picture Then A = T: B = T + 3: C = T + 6: D = Sp
       Next T
       If Pic(1).Picture = Img(Sp).Picture And Pic(5).Picture = Img(Sp).Picture And Pic(9).Picture = Img(Sp).Picture Then A = 1: B = 5: C = 9: D = Sp
       If Pic(3).Picture = Img(Sp).Picture And Pic(5).Picture = Img(Sp).Picture And Pic(7).Picture = Img(Sp).Picture Then A = 3: B = 5: C = 7: D = Sp
   Next Sp
   If A <> 0 Then
      LabelPunkte(D - 1).Caption = LabelPunkte(D - 1).Caption + 1
      WinAktiv.Enabled = True
   End If
   If Aktiv = 1 Then Img(1).Visible = True: Img(0).Visible = False Else Img(1).Visible = False: Img(0).Visible = True
End If
End Sub

Private Sub PopUp_Datei_Beenden_Click()
Unload Me
End Sub

Private Sub PopUp_Datei_Neu_2Spieler_Click()
Load NameForm
NameForm.Visible = True
End Sub

Private Sub PopUp_Datei_Neu_NeueRunde_Click()
ClearNew
End Sub

Private Sub PopUp_Hilfe_HiIfe_Click()
Load HilfeForm
HilfeForm.Visible = True
End Sub

Private Sub PopUp_Hilfe_Info_Click()
  Load InfoForm
  InfoForm.Visible = True
End Sub

Private Sub WinAktiv_Timer()

For Z = 1 To 9
    Pic(Z).Enabled = False
Next Z

Pic(A).Picture = Img(D + WAktiv).Picture
Pic(B).Picture = Img(D + WAktiv).Picture
Pic(C).Picture = Img(D + WAktiv).Picture
If WAktiv = 0 Then WAktiv = 2 Else WAktiv = 0

End Sub







Public Sub ClearNew()
WinAktiv.Enabled = False
PopUp_Datei_Neu_NeueRunde.Enabled = True
For A = 1 To 9
    Pic(A).Enabled = True
    Pic(A).Picture = LoadPicture()
Next A
End Sub




