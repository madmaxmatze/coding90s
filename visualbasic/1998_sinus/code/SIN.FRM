VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2835
   ClientLeft      =   1440
   ClientTop       =   2745
   ClientWidth     =   4470
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   2835
   ScaleWidth      =   4470
   Begin VB.CommandButton Command1 
      Caption         =   "Sin, Cos zeichnen"
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   2400
      Width           =   1935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

For A = 1 To 360
    Line (A * 12, 1200)-(A * 12, 1200), QBColor(0), BF
    Line (A * 12, 1200 - Sin(A * 0.0174532) * 1000)-(A * 12, 1200 - Sin(A * 0.0174532) * 1000), QBColor(1), BF
    Line (A * 12, 1200 - Cos(A * 0.0174532) * 1000)-(A * 12, 1200 - Cos(A * 0.0174532) * 1000), QBColor(2), BF
'   Line (A * 12, 1200 - Tan(A * 0.0174532) * 10)-(A * 12, 1200 - Tan(A * 0.0174532) * 10), QBColor(4), BF
Next A

End Sub



