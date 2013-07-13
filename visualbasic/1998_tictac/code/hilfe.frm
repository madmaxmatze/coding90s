VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form HilfeForm 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Tic Tac Toe - Hilfe"
   ClientHeight    =   3045
   ClientLeft      =   750
   ClientTop       =   1890
   ClientWidth     =   5160
   ForeColor       =   &H00FF0000&
   Icon            =   "HILFE.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "HILFE.frx":030A
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   3045
   ScaleWidth      =   5160
   Begin TabDlg.SSTab HilfeTab 
      Height          =   2775
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   4895
      _Version        =   327680
      Tab             =   1
      TabHeight       =   423
      TabCaption(0)   =   "Spielsteuerung"
      TabPicture(0)   =   "HILFE.frx":0614
      Tab(0).ControlCount=   1
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "Label1"
      Tab(0).Control(0).Enabled=   0   'False
      TabCaption(1)   =   "Tips und Tricks"
      TabPicture(1)   =   "HILFE.frx":0630
      Tab(1).ControlCount=   2
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "Label2"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "Icons(8)"
      Tab(1).Control(1).Enabled=   0   'False
      TabCaption(2)   =   "Ziel des Spiels"
      Tab(2).ControlCount=   1
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Label3"
      Tab(2).Control(0).Enabled=   0   'False
      Begin VB.Timer IconTimer 
         Interval        =   800
         Left            =   -74760
         Top             =   480
      End
      Begin VB.Image Icons 
         Height          =   480
         Index           =   8
         Left            =   240
         Picture         =   "HILFE.frx":064C
         Top             =   480
         Width           =   480
      End
      Begin VB.Label Label2 
         Caption         =   $"HILFE.frx":0956
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2055
         Left            =   240
         TabIndex        =   3
         Top             =   480
         Width           =   4455
      End
      Begin VB.Label Label3 
         Caption         =   $"HILFE.frx":0B3D
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2052
         Left            =   -74760
         TabIndex        =   2
         Top             =   480
         Width           =   4452
      End
      Begin VB.Label Label1 
         Caption         =   $"HILFE.frx":0BC6
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2052
         Left            =   -74760
         TabIndex        =   1
         Top             =   480
         Width           =   4452
      End
   End
   Begin VB.Image Icons 
      Height          =   480
      Index           =   7
      Left            =   3600
      Picture         =   "HILFE.frx":0DBA
      Top             =   4320
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Icons 
      Height          =   480
      Index           =   6
      Left            =   3120
      Picture         =   "HILFE.frx":10C4
      Top             =   4320
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Icons 
      Height          =   480
      Index           =   5
      Left            =   2640
      Picture         =   "HILFE.frx":13CE
      Top             =   4320
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Icons 
      Height          =   480
      Index           =   4
      Left            =   2160
      Picture         =   "HILFE.frx":16D8
      Top             =   4320
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Icons 
      Height          =   480
      Index           =   3
      Left            =   1680
      Picture         =   "HILFE.frx":19E2
      Top             =   4320
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Icons 
      Height          =   480
      Index           =   2
      Left            =   1200
      Picture         =   "HILFE.frx":1CEC
      Top             =   4320
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Icons 
      Height          =   480
      Index           =   1
      Left            =   720
      Picture         =   "HILFE.frx":1FF6
      Top             =   4320
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Icons 
      Height          =   480
      Index           =   0
      Left            =   240
      Picture         =   "HILFE.frx":2300
      Top             =   4320
      Visible         =   0   'False
      Width           =   480
   End
End
Attribute VB_Name = "HilfeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Ico As Byte



Private Sub Form_Load()
TicForm.Enabled = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
TicForm.Enabled = True
End Sub


Private Sub IconTimer_Timer()
Icons(8).Picture = Icons(Ico).Picture
Ico = Ico + 1
If Ico = 8 Then Ico = 0
End Sub
