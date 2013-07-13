VERSION 5.00
Begin VB.Form MenuForm 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "SmileWeeper - Menu"
   ClientHeight    =   5040
   ClientLeft      =   1905
   ClientTop       =   1650
   ClientWidth     =   5175
   Icon            =   "Menu.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   5040
   ScaleWidth      =   5175
   Begin VB.Frame Frame 
      Caption         =   "HighScores"
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
      Height          =   2532
      Index           =   5
      Left            =   120
      TabIndex        =   13
      Top             =   2400
      Visible         =   0   'False
      Width           =   4932
      Begin VB.CommandButton ClearBestButton 
         BackColor       =   &H00000000&
         Caption         =   "Bestzeit"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   1680
         TabIndex        =   28
         Top             =   1680
         Width           =   3132
      End
      Begin VB.CommandButton ClearStatsButton 
         Caption         =   "Gesamt - Statistik"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Left            =   1680
         TabIndex        =   19
         Top             =   2040
         Width           =   3132
      End
      Begin VB.Label LabelGewonnen 
         Alignment       =   2  'Zentriert
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   1560
         TabIndex        =   27
         Top             =   960
         Width           =   405
      End
      Begin VB.Label Label 
         Caption         =   "%"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   252
         Index           =   7
         Left            =   3600
         TabIndex        =   26
         Top             =   960
         Width           =   252
      End
      Begin VB.Label LabelZeit 
         Alignment       =   2  'Zentriert
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   3750
         TabIndex        =   25
         Top             =   480
         Width           =   420
      End
      Begin VB.Label LabelName 
         Alignment       =   2  'Zentriert
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   1500
         TabIndex        =   24
         Top             =   480
         Width           =   1935
      End
      Begin VB.Label LabelProzent 
         Alignment       =   1  'Rechts
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   3120
         TabIndex        =   23
         Top             =   960
         Width           =   420
      End
      Begin VB.Label LabelGesamt 
         Alignment       =   2  'Zentriert
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   2190
         TabIndex        =   22
         Top             =   960
         Width           =   495
      End
      Begin VB.Label Label 
         Caption         =   $"Menu.frx":030A
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   1572
         Index           =   3
         Left            =   720
         TabIndex        =   18
         Top             =   480
         Width           =   4092
      End
      Begin VB.Image Img 
         Height          =   480
         Index           =   10
         Left            =   180
         Picture         =   "Menu.frx":04AC
         Top             =   360
         Width           =   480
      End
   End
   Begin VB.Frame Frame 
      Caption         =   "Info..."
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
      Height          =   2532
      Index           =   4
      Left            =   120
      TabIndex        =   10
      Top             =   2400
      Visible         =   0   'False
      Width           =   4932
      Begin VB.Label Label 
         Caption         =   "Weitere Programme:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   5
         Left            =   720
         TabIndex        =   20
         Top             =   1200
         Width           =   1932
      End
      Begin VB.Image Img 
         Height          =   480
         Index           =   0
         Left            =   3360
         Picture         =   "Menu.frx":07B6
         Top             =   1920
         Width           =   480
      End
      Begin VB.Image Img 
         Height          =   480
         Index           =   6
         Left            =   2115
         Picture         =   "Menu.frx":0BF8
         Top             =   1920
         Width           =   480
      End
      Begin VB.Image Img 
         Height          =   480
         Index           =   7
         Left            =   840
         Picture         =   "Menu.frx":133A
         Top             =   1920
         Width           =   480
      End
      Begin VB.Label Label 
         Caption         =   $"Menu.frx":1644
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1212
         Index           =   4
         Left            =   720
         TabIndex        =   12
         Top             =   720
         Width           =   4092
      End
      Begin VB.Label Label 
         Caption         =   "SmileWeeper"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   372
         Index           =   6
         Left            =   720
         TabIndex        =   11
         Top             =   360
         Width           =   1932
      End
      Begin VB.Image Img 
         Height          =   480
         Index           =   8
         Left            =   135
         Picture         =   "Menu.frx":17B1
         Top             =   390
         Width           =   480
      End
   End
   Begin VB.Frame Frame 
      Caption         =   "Tip für Anfänger"
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
      Height          =   2532
      Index           =   3
      Left            =   120
      TabIndex        =   9
      Top             =   2400
      Visible         =   0   'False
      Width           =   4932
      Begin VB.Line Line 
         BorderColor     =   &H000000C0&
         Index           =   6
         X1              =   375
         X2              =   1200
         Y1              =   1650
         Y2              =   1395
      End
      Begin VB.Line Line 
         BorderColor     =   &H000000C0&
         Index           =   10
         X1              =   975
         X2              =   1230
         Y1              =   1665
         Y2              =   1365
      End
      Begin VB.Line Line 
         BorderColor     =   &H000000C0&
         Index           =   9
         X1              =   690
         X2              =   1215
         Y1              =   1665
         Y2              =   1395
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   22
         Left            =   840
         Picture         =   "Menu.frx":1ABB
         Top             =   1500
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   21
         Left            =   540
         Picture         =   "Menu.frx":1C2D
         Top             =   1500
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   20
         Left            =   240
         Picture         =   "Menu.frx":1D9F
         Top             =   1500
         Width           =   300
      End
      Begin VB.Line Line 
         BorderColor     =   &H00FF0000&
         Index           =   3
         X1              =   1125
         X2              =   1185
         Y1              =   1200
         Y2              =   840
      End
      Begin VB.Line Line 
         BorderColor     =   &H00FF0000&
         Index           =   2
         X1              =   660
         X2              =   1200
         Y1              =   375
         Y2              =   375
      End
      Begin VB.Line Line 
         BorderColor     =   &H00FF0000&
         Index           =   0
         X1              =   660
         X2              =   660
         Y1              =   855
         Y2              =   375
      End
      Begin VB.Shape Rahmen 
         BorderColor     =   &H00FF0000&
         Height          =   300
         Index           =   1
         Left            =   855
         Top             =   1200
         Width           =   285
      End
      Begin VB.Shape Rahmen 
         BorderColor     =   &H00FF0000&
         Height          =   330
         Index           =   0
         Left            =   540
         Top             =   870
         Width           =   285
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   19
         Left            =   840
         Picture         =   "Menu.frx":1F11
         Top             =   1200
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   18
         Left            =   540
         Picture         =   "Menu.frx":2083
         Top             =   1200
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   17
         Left            =   840
         Picture         =   "Menu.frx":21F5
         Top             =   900
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   16
         Left            =   555
         Picture         =   "Menu.frx":2367
         Top             =   885
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   11
         Left            =   240
         Picture         =   "Menu.frx":24D9
         Top             =   600
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   12
         Left            =   240
         Picture         =   "Menu.frx":264B
         Top             =   900
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   13
         Left            =   540
         Picture         =   "Menu.frx":27BD
         Top             =   600
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   14
         Left            =   840
         Picture         =   "Menu.frx":292F
         Top             =   600
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   15
         Left            =   240
         Picture         =   "Menu.frx":2AA1
         Top             =   1200
         Width           =   300
      End
      Begin VB.Label Label 
         Caption         =   $"Menu.frx":2C13
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2190
         Index           =   1
         Left            =   210
         TabIndex        =   21
         Top             =   285
         Width           =   4545
      End
   End
   Begin VB.Frame Frame 
      Caption         =   "Ziel des Spiels"
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
      Height          =   2532
      Index           =   2
      Left            =   120
      TabIndex        =   7
      Top             =   2400
      Visible         =   0   'False
      Width           =   4932
      Begin VB.Image Img 
         Height          =   300
         Index           =   9
         Left            =   1530
         Picture         =   "Menu.frx":2E5C
         Top             =   1275
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   2
         Left            =   1380
         Picture         =   "Menu.frx":2FCE
         Top             =   585
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   1
         Left            =   3330
         Picture         =   "Menu.frx":3140
         Top             =   810
         Width           =   300
      End
      Begin VB.Label Label 
         Caption         =   $"Menu.frx":32B2
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1572
         Index           =   2
         Left            =   240
         TabIndex        =   8
         Top             =   360
         Width           =   4452
      End
   End
   Begin VB.Frame Frame 
      Caption         =   "Themen:"
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
      Height          =   2172
      Index           =   0
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   4932
      Begin VB.OptionButton Opt 
         Caption         =   "HighScores"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   5
         Left            =   2880
         TabIndex        =   17
         Top             =   720
         Width           =   1695
      End
      Begin VB.Frame Frame 
         Caption         =   "Highscore"
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
         Height          =   732
         Index           =   8
         Left            =   2640
         TabIndex        =   16
         Top             =   360
         Width           =   2052
      End
      Begin VB.OptionButton Opt 
         Caption         =   "Info"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   4
         Left            =   2880
         TabIndex        =   15
         Top             =   1560
         Width           =   1695
      End
      Begin VB.Frame Frame 
         Caption         =   "Info"
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
         Height          =   732
         Index           =   7
         Left            =   2640
         TabIndex        =   14
         Top             =   1200
         Width           =   2052
      End
      Begin VB.OptionButton Opt 
         Caption         =   "Tip für Anfänger"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   3
         Left            =   480
         TabIndex        =   6
         Top             =   1440
         Width           =   1815
      End
      Begin VB.OptionButton Opt 
         Caption         =   "Ziel des Spiels"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   2
         Left            =   480
         TabIndex        =   5
         Top             =   1080
         Width           =   1815
      End
      Begin VB.OptionButton Opt 
         Caption         =   "Spielsteuerung"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   1
         Left            =   480
         TabIndex        =   4
         Top             =   720
         Value           =   -1  'True
         Width           =   1815
      End
      Begin VB.Frame Frame 
         Caption         =   "Hilfe"
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
         Height          =   1572
         Index           =   6
         Left            =   240
         TabIndex        =   3
         Top             =   360
         Width           =   2172
      End
   End
   Begin VB.Frame Frame 
      Caption         =   "Spielsteuerung"
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
      Height          =   2532
      Index           =   1
      Left            =   120
      TabIndex        =   0
      Top             =   2400
      Width           =   4932
      Begin VB.Image Img 
         Height          =   300
         Index           =   4
         Left            =   4170
         Picture         =   "Menu.frx":3397
         Top             =   555
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   3
         Left            =   2910
         Picture         =   "Menu.frx":3509
         Top             =   555
         Width           =   300
      End
      Begin VB.Image Img 
         Height          =   300
         Index           =   5
         Left            =   2130
         Picture         =   "Menu.frx":367B
         Top             =   825
         Width           =   300
      End
      Begin VB.Label Label 
         Caption         =   $"Menu.frx":37ED
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1932
         Index           =   0
         Left            =   240
         TabIndex        =   1
         Top             =   360
         Width           =   4452
      End
   End
End
Attribute VB_Name = "MenuForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False






Private Sub ClearBestButton_Click()
LabelName.Caption = "Mathias Nitzsche"
LabelZeit.Caption = "50"
End Sub

Private Sub ClearStatsButton_Click()
LabelGewonnen.Caption = "0"
LabelGesamt.Caption = "0"
End Sub


Private Sub Form_Load()
SmileForm.Enabled = False
LabelName.Caption = SmileForm.LabelName.Caption
LabelZeit.Caption = SmileForm.LabelZeit.Caption
LabelGewonnen.Caption = SmileForm.LabelGewonnen.Caption
LabelGesamt.Caption = SmileForm.LabelGesamt.Caption
End Sub


Private Sub Form_Unload(Cancel As Integer)
SmileForm.Enabled = True
SmileForm.LabelName.Caption = LabelName.Caption
SmileForm.LabelZeit.Caption = LabelZeit.Caption
SmileForm.LabelGewonnen.Caption = LabelGewonnen.Caption
SmileForm.LabelGesamt.Caption = LabelGesamt.Caption
End Sub










Private Sub LabelGesamt_Change()
If LabelGesamt.Caption <> "0" Then LabelProzent.Caption = LabelGewonnen.Caption / LabelGesamt.Caption * 100 Else LabelProzent.Caption = "0"
LabelProzent.Caption = Mid(LabelProzent.Caption, 1, 4)
End Sub


Private Sub Opt_Click(Index As Integer)
For a = 1 To 5
    Frame(a).Visible = Opt(a).Value
Next a
End Sub







