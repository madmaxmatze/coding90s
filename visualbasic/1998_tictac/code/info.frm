VERSION 5.00
Begin VB.Form InfoForm 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Info..."
   ClientHeight    =   2790
   ClientLeft      =   765
   ClientTop       =   1305
   ClientWidth     =   5175
   Icon            =   "INFO.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   2790
   ScaleWidth      =   5175
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
      TabIndex        =   0
      Top             =   120
      Width           =   4932
      Begin VB.Label Label 
         Caption         =   "Weitere Spiele:"
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
         TabIndex        =   3
         Top             =   1200
         Width           =   1932
      End
      Begin VB.Image Img 
         Height          =   384
         Index           =   8
         Left            =   240
         Picture         =   "INFO.frx":0442
         Stretch         =   -1  'True
         Top             =   360
         Width           =   384
      End
      Begin VB.Label Label 
         Caption         =   "Tic Tac Toe"
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
         TabIndex        =   2
         Top             =   360
         Width           =   1932
      End
      Begin VB.Label Label 
         Caption         =   $"INFO.frx":074C
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
         TabIndex        =   1
         Top             =   720
         Width           =   4092
      End
      Begin VB.Image Img 
         Height          =   480
         Index           =   7
         Left            =   840
         Picture         =   "INFO.frx":0890
         Top             =   1920
         Width           =   480
      End
      Begin VB.Image Img 
         Height          =   480
         Index           =   6
         Left            =   2115
         Picture         =   "INFO.frx":0B9A
         Top             =   1920
         Width           =   480
      End
      Begin VB.Image Img 
         Height          =   480
         Index           =   0
         Left            =   3360
         Picture         =   "INFO.frx":0EA4
         Top             =   1920
         Width           =   480
      End
   End
End
Attribute VB_Name = "InfoForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
TicForm.Enabled = False
End Sub


Private Sub Form_Unload(Cancel As Integer)
TicForm.Enabled = True
End Sub


