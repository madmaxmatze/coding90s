VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Uhr"
   ClientHeight    =   5430
   ClientLeft      =   1470
   ClientTop       =   2160
   ClientWidth     =   5430
   Icon            =   "UHR.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   5430
   ScaleWidth      =   5430
   Begin VB.Timer Timer 
      Interval        =   100
      Left            =   0
      Top             =   0
   End
   Begin VB.PictureBox Picture1 
      Height          =   5172
      Left            =   120
      ScaleHeight     =   5115
      ScaleWidth      =   5115
      TabIndex        =   0
      Top             =   120
      Width           =   5172
      Begin VB.Shape Shape2 
         BackColor       =   &H00A8A0A0&
         BorderColor     =   &H00FF0000&
         BorderWidth     =   4
         Height          =   4095
         Left            =   480
         Shape           =   3  'Kreis
         Top             =   480
         Width           =   4095
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "11"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   375
         Index           =   11
         Left            =   1260
         TabIndex        =   12
         Top             =   360
         Width           =   375
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "10"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   375
         Index           =   10
         Left            =   360
         TabIndex        =   11
         Top             =   1200
         Width           =   375
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "9"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   372
         Index           =   9
         Left            =   180
         TabIndex        =   10
         Top             =   2380
         Width           =   252
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "8"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   375
         Index           =   8
         Left            =   480
         TabIndex        =   9
         Top             =   3480
         Width           =   255
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "7"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   7
         Left            =   1240
         TabIndex        =   8
         Top             =   4360
         Width           =   165
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "5"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   375
         Index           =   5
         Left            =   3540
         TabIndex        =   7
         Top             =   4400
         Width           =   255
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "6"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   372
         Index           =   6
         Left            =   2460
         TabIndex        =   6
         Top             =   4680
         Width           =   192
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   372
         Index           =   4
         Left            =   4380
         TabIndex        =   5
         Top             =   3540
         Width           =   252
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   372
         Index           =   3
         Left            =   4680
         TabIndex        =   4
         Top             =   2380
         Width           =   252
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "2"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   375
         Index           =   2
         Left            =   4440
         TabIndex        =   3
         Top             =   1320
         Width           =   255
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   375
         Index           =   1
         Left            =   3660
         TabIndex        =   2
         Top             =   420
         Width           =   255
      End
      Begin VB.Line Houre 
         BorderColor     =   &H00FF0000&
         X1              =   2520
         X2              =   2520
         Y1              =   1440
         Y2              =   2520
      End
      Begin VB.Line Sec 
         BorderColor     =   &H00FF0000&
         X1              =   4200
         X2              =   2520
         Y1              =   2520
         Y2              =   2520
      End
      Begin VB.Line Min 
         BorderColor     =   &H00FF0000&
         X1              =   840
         X2              =   2520
         Y1              =   2520
         Y2              =   2520
      End
      Begin VB.Shape Shape 
         BackColor       =   &H00FFFF00&
         BackStyle       =   1  'Undurchsichtig
         BorderColor     =   &H00FF0000&
         Height          =   252
         Index           =   0
         Left            =   2460
         Top             =   480
         Width           =   132
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H00FFFF00&
         BackStyle       =   1  'Undurchsichtig
         BorderColor     =   &H00FF0000&
         Height          =   132
         Left            =   4320
         Top             =   2460
         Width           =   252
      End
      Begin VB.Shape Shape3 
         BackColor       =   &H00FFFF00&
         BackStyle       =   1  'Undurchsichtig
         BorderColor     =   &H00FF0000&
         Height          =   252
         Left            =   2460
         Top             =   4320
         Width           =   132
      End
      Begin VB.Shape Shape4 
         BackColor       =   &H00FFFF00&
         BackStyle       =   1  'Undurchsichtig
         BorderColor     =   &H00FF0000&
         Height          =   132
         Left            =   480
         Top             =   2460
         Width           =   252
      End
      Begin VB.Label Zahlen 
         BackStyle       =   0  'Transparent
         Caption         =   "12"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   252
         Index           =   12
         Left            =   2400
         TabIndex        =   1
         Top             =   60
         Width           =   372
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public SaveS As Integer

Private Sub Timer_Timer()

S = Val(Mid$(Time$, 7, 2))

If SaveS <> S Then
   Form1.Caption = "Uhr - " + Time$
    
   H = Val(Mid$(Time$, 1, 2))
   m = Val(Mid$(Time$, 4, 2))

   Houre.X1 = 2520 - Cos(((H * 30 + 90) + (m * 0.5)) * 0.0174532) * 1200
   Houre.Y1 = 2520 - Sin(((H * 30 + 90) + (m * 0.5)) * 0.0174532) * 1200

   Sec.X1 = 2520 - Cos((S * 6 + 90) * 0.0174532) * 1680
   Sec.Y1 = 2520 - Sin((S * 6 + 90) * 0.0174532) * 1680

   Min.X1 = 2520 - Cos((m * 6 + 90) * 0.0174532) * 1680
   Min.Y1 = 2520 - Sin((m * 6 + 90) * 0.0174532) * 1680

   SaveS = S
End If

End Sub


