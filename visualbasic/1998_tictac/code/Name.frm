VERSION 5.00
Begin VB.Form NameForm 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Namen..."
   ClientHeight    =   2535
   ClientLeft      =   2070
   ClientTop       =   2325
   ClientWidth     =   3855
   Icon            =   "NAME.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   2535
   ScaleWidth      =   3855
   Begin VB.TextBox TxtName 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Index           =   2
      Left            =   1320
      TabIndex        =   1
      Top             =   1320
      Width           =   2292
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
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
      Left            =   240
      TabIndex        =   2
      Top             =   1920
      Width           =   3372
   End
   Begin VB.TextBox TxtName 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Index           =   1
      Left            =   1320
      MaxLength       =   20
      TabIndex        =   0
      Top             =   720
      Width           =   2292
   End
   Begin VB.Label Label 
      Caption         =   "Spieler 1:                Spieler 2:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   972
      Index           =   0
      Left            =   240
      TabIndex        =   4
      Top             =   720
      Width           =   1092
   End
   Begin VB.Label Label 
      Caption         =   "Geben sie ihre Namen ein:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   372
      Index           =   1
      Left            =   240
      TabIndex        =   3
      Top             =   180
      Width           =   2892
   End
End
Attribute VB_Name = "NameForm"
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


Private Sub OKButton_Click()
TicForm.Img(0).Visible = True
TicForm.Img(1).Visible = False
TicForm.LabelName(1).Caption = TxtName(1).Text
TicForm.LabelName(2).Caption = TxtName(2).Text
TicForm.Label(0).Visible = True
TicForm.Label(1).Visible = True
TicForm.LabelPunkte(1).Caption = "0"
TicForm.LabelPunkte(2).Caption = "0"
TicForm.ClearNew
Unload Me
End Sub


