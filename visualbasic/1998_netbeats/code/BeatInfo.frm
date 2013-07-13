VERSION 5.00
Begin VB.Form InfoForm 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Info..."
   ClientHeight    =   3105
   ClientLeft      =   2565
   ClientTop       =   1890
   ClientWidth     =   3195
   Icon            =   "BEATINFO.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   3105
   ScaleWidth      =   3195
   Begin VB.Timer Timer1 
      Interval        =   50
      Left            =   2400
      Top             =   2520
   End
   Begin VB.Label Datum 
      Alignment       =   1  'Rechts
      BackStyle       =   0  'Transparent
      Height          =   195
      Left            =   1440
      TabIndex        =   5
      Top             =   2820
      Width           =   855
   End
   Begin VB.Label Uhrzeit 
      Alignment       =   1  'Rechts
      BackStyle       =   0  'Transparent
      Height          =   195
      Left            =   1440
      TabIndex        =   4
      Top             =   2460
      Width           =   855
   End
   Begin VB.Label Netbeats 
      Alignment       =   1  'Rechts
      BackStyle       =   0  'Transparent
      Height          =   195
      Left            =   1440
      TabIndex        =   3
      Top             =   2640
      Width           =   855
   End
   Begin VB.Line Line1 
      X1              =   120
      X2              =   3120
      Y1              =   960
      Y2              =   960
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Rechts
      Caption         =   "created by Mathias Nitzsche"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   420
      TabIndex        =   2
      Top             =   600
      Width           =   2655
   End
   Begin VB.Label Label2 
      Caption         =   $"BEATINFO.frx":0442
      Height          =   2055
      Left            =   120
      TabIndex        =   1
      Top             =   1080
      Width           =   3015
   End
   Begin VB.Label Label1 
      Caption         =   "Die Netbeat-Clock"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3135
   End
End
Attribute VB_Name = "InfoForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Test As String
Private Sub Form_Unload(Cancel As Integer)
Load BeatsForm
BeatsForm.Enabled = True
End Sub


Private Sub Timer1_Timer()
Netbeats.Caption = BeatsForm.Test
Uhrzeit.Caption = Time
Datum = Date
End Sub


