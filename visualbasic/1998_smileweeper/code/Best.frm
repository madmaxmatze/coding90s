VERSION 5.00
Begin VB.Form BestForm 
   Caption         =   "Neue Bestzeit..."
   ClientHeight    =   1515
   ClientLeft      =   1770
   ClientTop       =   2085
   ClientWidth     =   4080
   Icon            =   "BEST.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   1515
   ScaleWidth      =   4080
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
      Left            =   2760
      TabIndex        =   2
      Top             =   960
      Width           =   1092
   End
   Begin VB.TextBox TxtBestName 
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
      Left            =   240
      MaxLength       =   20
      TabIndex        =   0
      Top             =   960
      Width           =   2292
   End
   Begin VB.Label LabelFrage 
      Caption         =   "Sie haben eine neue Bestzeit aufgestellt                                                             Geben sie ihren Namen ein:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   612
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   3612
   End
End
Attribute VB_Name = "BestForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
SmileForm.Enabled = False
End Sub


Private Sub Form_Unload(Cancel As Integer)
SmileForm.Enabled = True
SmileForm.LabelName.Caption = TxtBestName.Text
End Sub


Private Sub OKButton_Click()
Unload Me
End Sub


