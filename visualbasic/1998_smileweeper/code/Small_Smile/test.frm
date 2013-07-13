VERSION 4.00
Begin VB.Form SmileForm 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "SmileWeeper"
   ClientHeight    =   2892
   ClientLeft      =   1284
   ClientTop       =   1284
   ClientWidth     =   2172
   Height          =   3444
   Icon            =   "TEST.frx":0000
   Left            =   1236
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2892
   ScaleWidth      =   2172
   Top             =   780
   Width           =   2268
   Begin VB.PictureBox Picture1 
      Height          =   1970
      Left            =   120
      ScaleHeight     =   1920
      ScaleWidth      =   1920
      TabIndex        =   8
      Top             =   840
      Width           =   1970
      Begin VB.Image Img 
         Height          =   240
         Index           =   6
         Left            =   1200
         Picture         =   "TEST.frx":030A
         Top             =   0
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   7
         Left            =   1440
         Picture         =   "TEST.frx":047C
         Top             =   0
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   5
         Left            =   960
         Picture         =   "TEST.frx":05EE
         Top             =   0
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   8
         Left            =   1680
         Picture         =   "TEST.frx":0760
         Top             =   0
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   64
         Left            =   1680
         Picture         =   "TEST.frx":08D2
         Top             =   1680
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   63
         Left            =   1440
         Picture         =   "TEST.frx":0A44
         Top             =   1680
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   57
         Left            =   0
         Picture         =   "TEST.frx":0BB6
         Top             =   1680
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   59
         Left            =   480
         Picture         =   "TEST.frx":0D28
         Top             =   1680
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   58
         Left            =   240
         Picture         =   "TEST.frx":0E9A
         Top             =   1680
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   61
         Left            =   960
         Picture         =   "TEST.frx":100C
         Top             =   1680
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   62
         Left            =   1200
         Picture         =   "TEST.frx":117E
         Top             =   1680
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   55
         Left            =   1440
         Picture         =   "TEST.frx":12F0
         Top             =   1440
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   49
         Left            =   0
         Picture         =   "TEST.frx":1462
         Top             =   1440
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   51
         Left            =   480
         Picture         =   "TEST.frx":15D4
         Top             =   1440
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   52
         Left            =   720
         Picture         =   "TEST.frx":1746
         Top             =   1440
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   50
         Left            =   240
         Picture         =   "TEST.frx":18B8
         Top             =   1440
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   53
         Left            =   960
         Picture         =   "TEST.frx":1A2A
         Top             =   1440
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   54
         Left            =   1200
         Picture         =   "TEST.frx":1B9C
         Top             =   1440
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   48
         Left            =   1680
         Picture         =   "TEST.frx":1D0E
         Top             =   1200
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   47
         Left            =   1440
         Picture         =   "TEST.frx":1E80
         Top             =   1200
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   41
         Left            =   0
         Picture         =   "TEST.frx":1FF2
         Top             =   1200
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   43
         Left            =   480
         Picture         =   "TEST.frx":2164
         Top             =   1200
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   44
         Left            =   720
         Picture         =   "TEST.frx":22D6
         Top             =   1200
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   42
         Left            =   240
         Picture         =   "TEST.frx":2448
         Top             =   1200
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   45
         Left            =   960
         Picture         =   "TEST.frx":25BA
         Top             =   1200
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   46
         Left            =   1200
         Picture         =   "TEST.frx":272C
         Top             =   1200
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   40
         Left            =   1680
         Picture         =   "TEST.frx":289E
         Top             =   960
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   39
         Left            =   1440
         Picture         =   "TEST.frx":2A10
         Top             =   960
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   33
         Left            =   0
         Picture         =   "TEST.frx":2B82
         Top             =   960
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   35
         Left            =   480
         Picture         =   "TEST.frx":2CF4
         Top             =   960
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   36
         Left            =   720
         Picture         =   "TEST.frx":2E66
         Top             =   960
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   34
         Left            =   240
         Picture         =   "TEST.frx":2FD8
         Top             =   960
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   37
         Left            =   960
         Picture         =   "TEST.frx":314A
         Top             =   960
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   38
         Left            =   1200
         Picture         =   "TEST.frx":32BC
         Top             =   960
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   32
         Left            =   1680
         Picture         =   "TEST.frx":342E
         Top             =   720
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   31
         Left            =   1440
         Picture         =   "TEST.frx":35A0
         Top             =   720
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   25
         Left            =   0
         Picture         =   "TEST.frx":3712
         Top             =   720
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   27
         Left            =   480
         Picture         =   "TEST.frx":3884
         Top             =   720
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   28
         Left            =   720
         Picture         =   "TEST.frx":39F6
         Top             =   720
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   26
         Left            =   240
         Picture         =   "TEST.frx":3B68
         Top             =   720
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   29
         Left            =   960
         Picture         =   "TEST.frx":3CDA
         Top             =   720
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   30
         Left            =   1200
         Picture         =   "TEST.frx":3E4C
         Top             =   720
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   24
         Left            =   1680
         Picture         =   "TEST.frx":3FBE
         Top             =   480
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   23
         Left            =   1440
         Picture         =   "TEST.frx":4130
         Top             =   480
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   17
         Left            =   0
         Picture         =   "TEST.frx":42A2
         Top             =   480
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   19
         Left            =   480
         Picture         =   "TEST.frx":4414
         Top             =   480
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   20
         Left            =   720
         Picture         =   "TEST.frx":4586
         Top             =   480
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   18
         Left            =   240
         Picture         =   "TEST.frx":46F8
         Top             =   480
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   21
         Left            =   960
         Picture         =   "TEST.frx":486A
         Top             =   480
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   22
         Left            =   1200
         Picture         =   "TEST.frx":49DC
         Top             =   480
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   16
         Left            =   1680
         Picture         =   "TEST.frx":4B4E
         Top             =   240
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   15
         Left            =   1440
         Picture         =   "TEST.frx":4CC0
         Top             =   240
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   9
         Left            =   0
         Picture         =   "TEST.frx":4E32
         Top             =   240
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   11
         Left            =   480
         Picture         =   "TEST.frx":4FA4
         Top             =   240
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   12
         Left            =   720
         Picture         =   "TEST.frx":5116
         Top             =   240
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   10
         Left            =   240
         Picture         =   "TEST.frx":5288
         Top             =   240
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   13
         Left            =   960
         Picture         =   "TEST.frx":53FA
         Top             =   240
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   14
         Left            =   1200
         Picture         =   "TEST.frx":556C
         Top             =   240
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   2
         Left            =   240
         Picture         =   "TEST.frx":56DE
         Top             =   0
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   4
         Left            =   720
         Picture         =   "TEST.frx":5850
         Top             =   0
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   3
         Left            =   480
         Picture         =   "TEST.frx":59C2
         Top             =   0
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   1
         Left            =   0
         Picture         =   "TEST.frx":5B34
         Top             =   0
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   60
         Left            =   720
         Picture         =   "TEST.frx":5CA6
         Top             =   1680
         Width           =   240
      End
      Begin VB.Image Img 
         Height          =   240
         Index           =   56
         Left            =   1680
         Picture         =   "TEST.frx":5E18
         Top             =   1440
         Width           =   240
      End
   End
   Begin VB.PictureBox Pic 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      DrawMode        =   6  'Mask Pen Not
      DrawStyle       =   5  'Transparent
      FontTransparent =   0   'False
      Height          =   612
      Index           =   1
      Left            =   1200
      Negotiate       =   -1  'True
      ScaleHeight     =   47
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   67
      TabIndex        =   5
      Top             =   120
      Width           =   852
      Begin VB.Timer Uhr 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   0
         Top             =   0
      End
      Begin VB.Label LabelZeitAnz 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   400
            size            =   9.6
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   288
         Left            =   0
         TabIndex        =   6
         Top             =   240
         Width           =   852
      End
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00C0C0C0&
      Height          =   612
      Index           =   0
      Left            =   120
      ScaleHeight     =   564
      ScaleWidth      =   804
      TabIndex        =   4
      Top             =   120
      Width           =   852
      Begin VB.Image Img 
         Height          =   240
         Index           =   80
         Left            =   312
         Picture         =   "TEST.frx":5F8A
         Top             =   0
         Visible         =   0   'False
         Width           =   240
      End
      Begin VB.Label LabelMinenAnz 
         Alignment       =   2  'Center
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   400
            size            =   9.6
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   312
         Left            =   240
         TabIndex        =   7
         Top             =   240
         Width           =   372
      End
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   79
      Left            =   2520
      Picture         =   "TEST.frx":60FC
      Top             =   1200
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Label LabelGesamt 
      BackColor       =   &H0000FF00&
      Caption         =   "0"
      Height          =   252
      Left            =   2880
      TabIndex        =   3
      Top             =   1200
      Visible         =   0   'False
      Width           =   2052
   End
   Begin VB.Label LabelGewonnen 
      BackColor       =   &H00FF00FF&
      Caption         =   "0"
      Height          =   252
      Left            =   2880
      TabIndex        =   2
      Top             =   840
      Visible         =   0   'False
      Width           =   2052
   End
   Begin VB.Label LabelZeit 
      BackColor       =   &H00FFFF00&
      Height          =   252
      Left            =   2880
      TabIndex        =   1
      Top             =   480
      Visible         =   0   'False
      Width           =   2052
   End
   Begin VB.Label LabelName 
      BackColor       =   &H000000FF&
      Height          =   252
      Left            =   2880
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   2052
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   75
      Left            =   2520
      Picture         =   "TEST.frx":626E
      Top             =   240
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   76
      Left            =   2520
      Picture         =   "TEST.frx":63E0
      Top             =   480
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   78
      Left            =   2520
      Picture         =   "TEST.frx":6552
      Top             =   960
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   74
      Left            =   2520
      Picture         =   "TEST.frx":66C4
      Top             =   0
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   77
      Left            =   2520
      Picture         =   "TEST.frx":6836
      Top             =   720
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   65
      Left            =   2280
      Picture         =   "TEST.frx":69A8
      Top             =   0
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   73
      Left            =   2280
      Picture         =   "TEST.frx":6B1A
      Top             =   1920
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   72
      Left            =   2280
      Picture         =   "TEST.frx":6C8C
      Top             =   1680
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   71
      Left            =   2280
      Picture         =   "TEST.frx":6DFE
      Top             =   1440
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   70
      Left            =   2280
      Picture         =   "TEST.frx":6F70
      Top             =   1200
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   69
      Left            =   2280
      Picture         =   "TEST.frx":70E2
      Top             =   960
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   68
      Left            =   2280
      Picture         =   "TEST.frx":7254
      Top             =   720
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   67
      Left            =   2280
      Picture         =   "TEST.frx":73C6
      Top             =   480
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image Img 
      Height          =   240
      Index           =   66
      Left            =   2280
      Picture         =   "TEST.frx":7538
      Top             =   240
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Menu PopUp_Neu 
      Caption         =   "&Neu"
   End
   Begin VB.Menu PopUp_Menu 
      Caption         =   "&Menu"
   End
   Begin VB.Menu PopUp_Beenden 
      Caption         =   "&Beenden"
   End
End
Attribute VB_Name = "SmileForm"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Dim Feld(1 To 64) As Byte
Public Minen As Integer
Public N As Byte





Private Sub Form_Load()
Open "SMILE.TXT" For Input As #1
     Input #1, MyString: LabelName.Caption = MyString
     Input #1, MyString: LabelZeit.Caption = MyString
     Input #1, MyString: LabelGewonnen.Caption = MyString
     Input #1, MyString: LabelGesamt.Caption = MyString
Close #1
Minen = 10
Randomize
NeuAufbau
End Sub

Public Sub NeuAufbau()

LabelZeitAnz.Caption = 0
LabelMinenAnz.Caption = Minen

SmileForm.picture = SmileForm.picture

Img(80).Visible = False

For a = 1 To 64
    Feld(a) = 0
    Img(a).Enabled = True
    Img(a).picture = Img(79).picture
Next a
N = 1

End Sub

Private Sub Form_Unload(Cancel As Integer)
Open "SMILE.TXT" For Append Access Write As #1
     Seek #1, 1
     Print #1, LabelName.Caption
     Print #1, LabelZeit.Caption
     Print #1, LabelGewonnen.Caption
     Print #1, LabelGesamt.Caption
Close #1
End Sub

Private Sub Img_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

If Button = 1 And Img(Index).picture = Img(79).picture Then
   If N = 1 Then
      Uhr.Enabled = True
      'LabelGesamt.Caption = LabelGesamt.Caption + 1
      For a = 1 To Minen
          Zufi = Int(Rnd * 64) + 1
          If Feld(Zufi) <> 9 And Index <> Zufi Then Feld(Zufi) = 9 Else a = a - 1
      Next a
      For Y = 0 To 7
          For X = 1 To 8
              a = Y * 8 + X
              M = 0
              If Feld(a) <> 9 Then
                 If Y - 1 >= 0 And X - 1 > 0 Then If Feld(a - 9) = 9 Then M = M + 1
                 If Y - 1 >= 0 Then If Feld(a - 8) = 9 Then M = M + 1
                 If Y - 1 >= 0 And X + 1 < 9 Then If Feld(a - 7) = 9 Then M = M + 1
                 If X + 1 < 9 Then If Feld(a + 1) = 9 Then M = M + 1
                 If Y + 1 < 8 And X + 1 < 9 Then If Feld(a + 9) = 9 Then M = M + 1
                 If Y + 1 < 8 Then If Feld(a + 8) = 9 Then M = M + 1
                 If Y + 1 < 8 And X - 1 > 0 Then If Feld(a + 7) = 9 Then M = M + 1
                 If X - 1 > 0 Then If Feld(a - 1) = 9 Then M = M + 1
                 Feld(a) = M
              End If
          Next X
       Next Y
   N = 0
   End If
   Img(Index).picture = Img(Feld(Index) + 65).picture
   If Feld(Index) = 9 Then
      Uhr.Enabled = False
      For a = 1 To 64
          If Feld(a) <> 9 And Img(a).picture = Img(77).picture Then Img(a).picture = Img(78).picture
          If Feld(a) = 9 Then Img(a).picture = Img(74).picture
          Img(a).Enabled = False
      Next a
      Img(Index).picture = Img(75).picture
   End If
Else
   If Img(Index).picture = Img(79).picture Then
      LabelMinenAnz.Caption = LabelMinenAnz.Caption - 1
      Img(Index).picture = Img(77).picture
   ElseIf Img(Index).picture = Img(77).picture Then
      LabelMinenAnz.Caption = LabelMinenAnz.Caption + 1
      Img(Index).picture = Img(79).picture
   End If
End If

For a = 1 To 64
    If Img(a).picture <> Img(79).picture Then Test = Test + 1
    If Img(a).picture = Img(77).picture Then Test1 = Test1 + 1
Next a
If Test = 64 And LabelMinenAnz.Caption = 0 And Test1 = Minen Then
   Uhr.Enabled = False
   For a = 1 To 64
       If Img(a).picture = Img(77).picture Then Img(a).picture = Img(76).picture
       Img(a).Enabled = False
   Next a
  ' LabelGewonnen.Caption = LabelGewonnen.Caption + 1
 '  If LabelGesamt.Caption = 0 Then LabelGesamt.Caption = 1
   Img(80).Visible = True
  ' If LabelZeitAnz.Caption < LabelZeit.Caption Then
  '    LabelZeit.Caption = LabelZeitAnz.Caption
  '    Load BestForm
  '    BestForm.Visible = True
  ' End If
End If

End Sub



Private Sub PopUp_Beenden_Click()
Unload Me
End Sub




Private Sub PopUp_Menu_Click()
Load MenuForm
MenuForm.Visible = True
End Sub


Private Sub PopUp_Neu_Click()
NeuAufbau
End Sub

Private Sub Uhr_Timer()
LabelZeitAnz = LabelZeitAnz + 1
End Sub


