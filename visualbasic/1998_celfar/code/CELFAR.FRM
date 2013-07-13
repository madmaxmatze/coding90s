VERSION 4.00
Begin VB.Form Form1 
   Caption         =   "Celsius - Fahrenheit Umrechnungsprogramm"
   ClientHeight    =   1425
   ClientLeft      =   2490
   ClientTop       =   3075
   ClientWidth     =   5520
   Height          =   1830
   Left            =   2430
   LinkTopic       =   "Form1"
   ScaleHeight     =   1425
   ScaleWidth      =   5520
   Top             =   2730
   Width           =   5640
   Begin VB.TextBox TxtFahrenheit 
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   12
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   1680
      TabIndex        =   3
      Top             =   840
      Width           =   3735
   End
   Begin VB.TextBox TxtCelsius 
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   12
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   1680
      TabIndex        =   0
      Top             =   120
      Width           =   3735
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   5520
      Y1              =   720
      Y2              =   720
   End
   Begin VB.Label LabelFahrenheit 
      Caption         =   "Fahrenheit"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   12
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   840
      Width           =   1335
   End
   Begin VB.Label LabelCelsius 
      Caption         =   "Celsius"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   12
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False



Private Sub TxtCelsius_KeyPress(KeyAscii As Integer)
  If (KeyAscii = 13) Then
     TxtFahrenheit.TEXT = Val(TxtCelsius.TEXT * 9 / 5) + 32
  End If
End Sub


Private Sub TxtFahrenheit_KeyPress(KeyAscii As Integer)
If (KeyAscii = 13) Then
   TxtCelsius.TEXT = Val(TxtFahrenheit.TEXT - 32) * 5 / 9
End If
End Sub


