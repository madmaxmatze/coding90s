VERSION 5.00
Begin VB.Form SimonForm 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Simon"
   ClientHeight    =   4215
   ClientLeft      =   1425
   ClientTop       =   1605
   ClientWidth     =   3945
   Icon            =   "SIMON.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   4215
   ScaleWidth      =   3945
   Begin VB.Timer Timer 
      Enabled         =   0   'False
      Left            =   0
      Top             =   0
   End
   Begin VB.PictureBox Picture 
      BackColor       =   &H00FFFFFF&
      Height          =   1092
      Index           =   2
      Left            =   2640
      ScaleHeight     =   1035
      ScaleWidth      =   1035
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   2880
      Width           =   1092
      Begin VB.Label Punkte 
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
         ForeColor       =   &H00C00000&
         Height          =   372
         Left            =   120
         TabIndex        =   5
         Top             =   480
         Width           =   852
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Punkte"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   1
         Left            =   120
         TabIndex        =   6
         Top             =   120
         Width           =   852
      End
   End
   Begin VB.PictureBox Picture 
      BackColor       =   &H00FFFFFF&
      Height          =   1092
      Index           =   1
      Left            =   240
      ScaleHeight     =   1035
      ScaleWidth      =   2355
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   2880
      Width           =   2412
      Begin VB.HScrollBar LevelScroll 
         Height          =   252
         Left            =   240
         Max             =   100
         Min             =   1
         TabIndex        =   1
         Top             =   600
         Value           =   10
         Width           =   1932
      End
      Begin VB.Label Level 
         Alignment       =   1  'Rechts
         BackStyle       =   0  'Transparent
         Caption         =   "10"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Left            =   1440
         TabIndex        =   3
         Top             =   180
         Width           =   372
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Level :"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   0
         Left            =   720
         TabIndex        =   2
         Top             =   180
         Width           =   732
      End
   End
   Begin VB.PictureBox Picture 
      BackColor       =   &H80000005&
      Height          =   2412
      Index           =   0
      Left            =   240
      ScaleHeight     =   2355
      ScaleWidth      =   3435
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   240
      Width           =   3492
      Begin VB.Label Img 
         Appearance      =   0  '2D
         BackColor       =   &H00C000C0&
         BorderStyle     =   1  'Fest Einfach
         ForeColor       =   &H80000008&
         Height          =   852
         Index           =   6
         Left            =   2400
         TabIndex        =   13
         Top             =   1320
         Width           =   852
      End
      Begin VB.Label Img 
         Appearance      =   0  '2D
         BackColor       =   &H00C00000&
         BorderStyle     =   1  'Fest Einfach
         ForeColor       =   &H80000008&
         Height          =   852
         Index           =   5
         Left            =   1320
         TabIndex        =   12
         Top             =   1320
         Width           =   852
      End
      Begin VB.Label Img 
         Appearance      =   0  '2D
         BackColor       =   &H00C0C000&
         BorderStyle     =   1  'Fest Einfach
         ForeColor       =   &H80000008&
         Height          =   852
         Index           =   4
         Left            =   240
         TabIndex        =   11
         Top             =   1320
         Width           =   852
      End
      Begin VB.Label Img 
         Appearance      =   0  '2D
         BackColor       =   &H0000C000&
         BorderStyle     =   1  'Fest Einfach
         ForeColor       =   &H80000008&
         Height          =   852
         Index           =   3
         Left            =   2400
         TabIndex        =   10
         Top             =   240
         Width           =   852
      End
      Begin VB.Label Img 
         Appearance      =   0  '2D
         BackColor       =   &H0000C0C0&
         BorderStyle     =   1  'Fest Einfach
         ForeColor       =   &H80000008&
         Height          =   852
         Index           =   2
         Left            =   1320
         TabIndex        =   9
         Top             =   240
         Width           =   852
      End
      Begin VB.Label Img 
         Appearance      =   0  '2D
         BackColor       =   &H000000C0&
         BorderStyle     =   1  'Fest Einfach
         ForeColor       =   &H80000008&
         Height          =   855
         Index           =   1
         Left            =   240
         TabIndex        =   8
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.Label Label 
      Height          =   375
      Index           =   2
      Left            =   600
      TabIndex        =   14
      Top             =   0
      Width           =   3135
   End
   Begin VB.Menu PopUp_Datei 
      Caption         =   "&Datei"
      Begin VB.Menu PopUp_Datei_Neu 
         Caption         =   "&Neu"
         Shortcut        =   {F2}
      End
      Begin VB.Menu PopUp_Datei_Strich1 
         Caption         =   "-"
      End
      Begin VB.Menu PopUp_Datei_HighScore 
         Caption         =   "&HighScore"
      End
      Begin VB.Menu PopUp_Datei_Strich2 
         Caption         =   "-"
      End
      Begin VB.Menu PopUp_Datei_Beenden 
         Caption         =   "&Beenden"
         Shortcut        =   {F4}
      End
   End
   Begin VB.Menu PopUp_Hilfe 
      Caption         =   "&?"
      Begin VB.Menu PopUp_Hilfe_Hilfe 
         Caption         =   "&Hilfe"
         Shortcut        =   {F1}
      End
      Begin VB.Menu PopUp_Hilfe_Info 
         Caption         =   "&Info..."
      End
   End
End
Attribute VB_Name = "SimonForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Beepcode As String
Public aktiv As Byte
Dim BC(1 To 12) As Long

Private Sub Form_Load()
   BC(1) = &HC0&          ' dunkel rot
   BC(2) = &HC0C0&        ' dunkel gelb
   BC(3) = &HC000&        ' dunkel grün
   BC(4) = &HC0C000       ' dunkel türkis
   BC(5) = &HC00000       ' dunkel blau
   BC(6) = &HC000C0       ' dunkel lila
   BC(7) = &HFF&          ' hell rot
   BC(8) = &HFFFF&        ' hell gelb
   BC(9) = &HFF00&        ' hell grün
   BC(10) = &HFFFF00      ' hell türkis
   BC(11) = &HFF0000      ' hell blau
   BC(12) = &HFF00FF      ' hell lila

End Sub

Public Sub LevelScroll_Change()
TxtLevelAnz.Caption = LevelScroll.Value
End Sub

Private Sub PopUp_Datei_Neu_Click()
  Beepcode = ""
  For a = 1 To Level.Caption
      B = Int(Rnd * 6) + 1
      Beepcode = Beepcode + Str(B)
  Next a
  
  Label(2).Caption = Beepcode
  
  aktiv = aktiv + 1
  
  For a = 1 To aktiv
      B = Mid(Beepcode, a, 1)
      Img(B).BackColor = BC(B + 6)
      Timer.Enabled = True
      Img(B).BackColor = BC(B)
  Next a
  
  
End Sub

Private Sub Timer1_Timer()

End Sub
