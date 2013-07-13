VERSION 5.00
Begin VB.Form HauptForm 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Gaintsoft - Umrechner"
   ClientHeight    =   2295
   ClientLeft      =   930
   ClientTop       =   1560
   ClientWidth     =   3975
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   10.5
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "RECHNER.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   2295
   ScaleWidth      =   3975
   Begin VB.Frame Frame2 
      ForeColor       =   &H00C0E0FF&
      Height          =   612
      Left            =   1980
      TabIndex        =   22
      Top             =   0
      Width           =   1872
      Begin VB.Label Anzeige 
         Alignment       =   1  'Rechts
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   1  'Fest Einfach
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   10.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   252
         Left            =   240
         TabIndex        =   23
         Top             =   240
         Width           =   1452
         WordWrap        =   -1  'True
      End
   End
   Begin VB.Frame Frame3 
      Height          =   612
      Left            =   120
      TabIndex        =   20
      Top             =   0
      Width           =   1872
      Begin VB.OptionButton Dez 
         Caption         =   "Dez"
         Height          =   390
         Left            =   240
         TabIndex        =   0
         Top             =   180
         Value           =   -1  'True
         Width           =   735
      End
      Begin VB.OptionButton Hez 
         Caption         =   "Hex"
         Height          =   252
         Left            =   960
         TabIndex        =   21
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1692
      Left            =   120
      TabIndex        =   19
      Top             =   480
      Width           =   3732
      Begin VB.CommandButton Zahl 
         Caption         =   "F"
         Enabled         =   0   'False
         Height          =   372
         Index           =   15
         Left            =   3120
         TabIndex        =   16
         Top             =   1200
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "E"
         Enabled         =   0   'False
         Height          =   372
         Index           =   14
         Left            =   2520
         TabIndex        =   15
         Top             =   1200
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "D"
         Enabled         =   0   'False
         Height          =   372
         Index           =   13
         Left            =   1920
         TabIndex        =   14
         Top             =   1200
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "C"
         Enabled         =   0   'False
         Height          =   372
         Index           =   12
         Left            =   1320
         TabIndex        =   13
         Top             =   1200
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "B"
         Enabled         =   0   'False
         Height          =   372
         Index           =   11
         Left            =   720
         TabIndex        =   12
         Top             =   1200
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "A"
         Enabled         =   0   'False
         Height          =   372
         Index           =   10
         Left            =   120
         TabIndex        =   11
         Top             =   1200
         Width           =   492
      End
      Begin VB.CommandButton Neu 
         Caption         =   "Neu"
         Height          =   375
         Left            =   3075
         TabIndex        =   17
         TabStop         =   0   'False
         Top             =   240
         Width           =   555
      End
      Begin VB.CommandButton Del 
         Caption         =   "Del"
         Height          =   375
         Left            =   3120
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   720
         Width           =   495
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "0"
         Height          =   372
         Index           =   0
         Left            =   120
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   240
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "3"
         Height          =   372
         Index           =   3
         Left            =   1920
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   240
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "2"
         Height          =   372
         Index           =   2
         Left            =   1320
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   240
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "1"
         Height          =   372
         Index           =   1
         Left            =   720
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   240
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "6"
         Height          =   372
         Index           =   6
         Left            =   720
         TabIndex        =   7
         TabStop         =   0   'False
         Top             =   720
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "5"
         Height          =   372
         Index           =   5
         Left            =   120
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   720
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "4"
         Height          =   372
         Index           =   4
         Left            =   2520
         TabIndex        =   5
         TabStop         =   0   'False
         Top             =   240
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "9"
         Height          =   372
         Index           =   9
         Left            =   2520
         TabIndex        =   10
         TabStop         =   0   'False
         Top             =   720
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "8"
         Height          =   372
         Index           =   8
         Left            =   1920
         TabIndex        =   9
         TabStop         =   0   'False
         Top             =   720
         Width           =   492
      End
      Begin VB.CommandButton Zahl 
         Caption         =   "7"
         Height          =   372
         Index           =   7
         Left            =   1320
         TabIndex        =   8
         TabStop         =   0   'False
         Top             =   720
         Width           =   492
      End
   End
End
Attribute VB_Name = "HauptForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public RZahl As String




Private Sub Del_Click()
If Len(RZahl) = 1 Then RZahl = "0"
If RZahl <> "0" Then RZahl = Left(RZahl, Len(RZahl) - 1)
Anzeigen
End Sub



Private Sub Dez_Click()
For X = 10 To 15
    Zahl(X).Enabled = False
Next X
n = Len(RZahl)
For l = 1 To n
    X = Asc(Mid(RZahl, l, 1))
    X = X - 48
    If X > 9 Then X = X - 7
    testzahl = testzahl + X * 16 ^ (n - l)
Next l
RZahl = testzahl
Anzeigen
End Sub

Private Sub Form_Load()
RZahl = "0"
End Sub




Private Sub Hez_Click()
For X = 10 To 15
    Zahl(X).Enabled = True
Next X
RZahl = Hex(RZahl)
Anzeigen
End Sub

Private Sub Neu_Click()
RZahl = "0"
Anzeigen
End Sub




Private Sub Zahl_Click(Index As Integer)
If RZahl = "0" Then RZahl = ""
If Len(RZahl) < 7 Then RZahl = RZahl + Right(Zahl(Index).Caption, 1)
Anzeigen
End Sub

Public Sub Anzeigen()
X = Len(RZahl)

If Dez.Value = True Then
   A = ""
   If X > 6 Then B = Right(RZahl, 9): B = Left(B, Len(B) - 6)
   If X > 3 Then C = Right(RZahl, 6): C = Left(C, Len(C) - 3)
   D = Right(RZahl, 3)
End If

If Hez.Value = True Then
   If X > 6 Then A = Left(RZahl, 1)
   If X > 4 Then B = Right(RZahl, 6): B = Left(B, Len(B) - 4)
   If X > 2 Then C = Right(RZahl, 4): C = Left(C, Len(C) - 2)
   D = Right(RZahl, 2)
End If

Anzeige.Caption = A + " " + B + " " + C + " " + D
End Sub
