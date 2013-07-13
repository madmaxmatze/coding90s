VERSION 5.00
Begin VB.Form SmileForm 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "SmileWeeper"
   ClientHeight    =   3645
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   2745
   Icon            =   "SMILE.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   Picture         =   "SMILE.frx":030A
   ScaleHeight     =   3645
   ScaleWidth      =   2745
   StartUpPosition =   3  'Windows-Standard
   Begin VB.Timer Uhr 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   3360
      Top             =   1680
   End
   Begin VB.Label LabelGesamt 
      BackColor       =   &H0000FF00&
      Height          =   255
      Left            =   3360
      TabIndex        =   5
      Top             =   1200
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.Label LabelGewonnen 
      BackColor       =   &H00FF00FF&
      Height          =   255
      Left            =   3360
      TabIndex        =   4
      Top             =   840
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.Label LabelZeit 
      BackColor       =   &H00FFFF00&
      Height          =   255
      Left            =   3360
      TabIndex        =   3
      Top             =   480
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.Label LabelName 
      BackColor       =   &H000000FF&
      Height          =   255
      Left            =   3360
      TabIndex        =   2
      Top             =   120
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   75
      Left            =   3000
      Picture         =   "SMILE.frx":5A28
      Top             =   240
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   76
      Left            =   3000
      Picture         =   "SMILE.frx":5B9A
      Top             =   480
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   78
      Left            =   3000
      Picture         =   "SMILE.frx":5D0C
      Top             =   960
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Label LabelMinenAnz 
      Alignment       =   2  'Zentriert
      BackColor       =   &H00E0E0E0&
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   525
      TabIndex        =   1
      Top             =   550
      Width           =   375
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   56
      Left            =   2250
      Top             =   2850
      Width           =   300
   End
   Begin VB.Label LabelZeitAnz 
      Alignment       =   2  'Zentriert
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   1590
      TabIndex        =   0
      Top             =   555
      Width           =   855
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   79
      Left            =   555
      Picture         =   "SMILE.frx":5E7E
      Top             =   240
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   74
      Left            =   3000
      Picture         =   "SMILE.frx":5FF0
      Top             =   0
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   77
      Left            =   3000
      Picture         =   "SMILE.frx":6162
      Top             =   720
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   65
      Left            =   2760
      Picture         =   "SMILE.frx":62D4
      Top             =   0
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   73
      Left            =   2760
      Picture         =   "SMILE.frx":6446
      Top             =   1920
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   72
      Left            =   2760
      Picture         =   "SMILE.frx":65B8
      Top             =   1680
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   71
      Left            =   2760
      Picture         =   "SMILE.frx":672A
      Top             =   1440
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   70
      Left            =   2760
      Picture         =   "SMILE.frx":689C
      Top             =   1200
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   69
      Left            =   2760
      Picture         =   "SMILE.frx":6A0E
      Top             =   960
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   68
      Left            =   2760
      Picture         =   "SMILE.frx":6B80
      Top             =   720
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   67
      Left            =   2760
      Picture         =   "SMILE.frx":6CF2
      Top             =   480
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   60
      Left            =   1050
      Top             =   3150
      Width           =   300
   End
   Begin VB.Image Img 
      Height          =   300
      Index           =   66
      Left            =   2760
      Picture         =   "SMILE.frx":6E64
      Top             =   240
      Visible         =   0   'False
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   1
      Left            =   150
      Top             =   1050
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   3
      Left            =   750
      Top             =   1050
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   4
      Left            =   1050
      Top             =   1050
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   2
      Left            =   450
      Top             =   1050
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   14
      Left            =   1650
      Top             =   1350
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   13
      Left            =   1350
      Top             =   1350
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   10
      Left            =   450
      Top             =   1350
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   12
      Left            =   1050
      Top             =   1350
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   11
      Left            =   750
      Top             =   1350
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   9
      Left            =   150
      Top             =   1350
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   15
      Left            =   1950
      Top             =   1350
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   16
      Left            =   2250
      Top             =   1350
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   22
      Left            =   1650
      Top             =   1650
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   21
      Left            =   1350
      Top             =   1650
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   18
      Left            =   450
      Top             =   1650
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   20
      Left            =   1050
      Top             =   1650
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   19
      Left            =   750
      Top             =   1650
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   17
      Left            =   150
      Top             =   1650
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   23
      Left            =   1950
      Top             =   1650
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   24
      Left            =   2250
      Top             =   1650
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   30
      Left            =   1650
      Top             =   1950
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   29
      Left            =   1350
      Top             =   1950
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   26
      Left            =   450
      Top             =   1950
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   28
      Left            =   1050
      Top             =   1950
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   27
      Left            =   750
      Top             =   1950
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   25
      Left            =   150
      Top             =   1950
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   31
      Left            =   1950
      Top             =   1950
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   32
      Left            =   2250
      Top             =   1950
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   38
      Left            =   1650
      Top             =   2250
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   37
      Left            =   1350
      Top             =   2250
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   34
      Left            =   450
      Top             =   2250
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   36
      Left            =   1050
      Top             =   2250
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   35
      Left            =   750
      Top             =   2250
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   33
      Left            =   150
      Top             =   2250
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   39
      Left            =   1950
      Top             =   2250
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   40
      Left            =   2250
      Top             =   2250
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   46
      Left            =   1650
      Top             =   2550
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   45
      Left            =   1350
      Top             =   2550
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   42
      Left            =   450
      Top             =   2550
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   44
      Left            =   1050
      Top             =   2550
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   43
      Left            =   750
      Top             =   2550
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   41
      Left            =   150
      Top             =   2550
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   47
      Left            =   1950
      Top             =   2550
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   48
      Left            =   2250
      Top             =   2550
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   54
      Left            =   1650
      Top             =   2850
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   53
      Left            =   1350
      Top             =   2850
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   50
      Left            =   450
      Top             =   2850
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   52
      Left            =   1050
      Top             =   2850
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   51
      Left            =   750
      Top             =   2850
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   49
      Left            =   150
      Top             =   2850
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   55
      Left            =   1950
      Top             =   2850
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   62
      Left            =   1650
      Top             =   3150
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   61
      Left            =   1350
      Top             =   3150
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   58
      Left            =   450
      Top             =   3150
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   59
      Left            =   750
      Top             =   3150
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   57
      Left            =   150
      Top             =   3150
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   63
      Left            =   1950
      Top             =   3150
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   64
      Left            =   2250
      Top             =   3150
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   8
      Left            =   2250
      Top             =   1050
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   5
      Left            =   1350
      Top             =   1050
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   7
      Left            =   1950
      Top             =   1050
      Width           =   300
   End
   Begin VB.Image Img 
      Enabled         =   0   'False
      Height          =   300
      Index           =   6
      Left            =   1650
      Top             =   1050
      Width           =   300
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
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Feld(-10 To 75) As Integer
Public Minen As Integer
Public I As Byte

Private Sub Form_Load()
For a = -10 To 75
    Feld(a) = 100
Next a

Open "C:\SMILE.TXT" For Input As #1
     Input #1, MyString: LabelName.Caption = MyString
     Input #1, MyString: LabelZeit.Caption = MyString
     Input #1, MyString: LabelGewonnen.Caption = MyString
     Input #1, MyString: LabelGesamt.Caption = MyString
Close #1
Minen = 10
Randomize
End Sub


Private Sub Form_Unload(Cancel As Integer)
Open "C:\SMILE.TXT" For Append Access Write As #1
     Seek #1, 1
     Print #1, LabelName.Caption
     Print #1, LabelZeit.Caption
     Print #1, LabelGewonnen.Caption
     Print #1, LabelGesamt.Caption
Close #1
End Sub

Private Sub Img_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)

If Button = 1 And Img(Index).Picture = LoadPicture() Then
   If I = 1 Then
      Uhr.Enabled = True
      LabelGesamt.Caption = LabelGesamt.Caption + 1
      For a = 1 To Minen
          zufi = Int(Rnd * 64) + 1
          If Feld(zufi) <> 9 And Index <> zufi Then Feld(zufi) = 9 Else a = a - 1
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
   I = 0
   End If
   Img(Index).Picture = Img(Feld(Index) + 65).Picture
   I = Index
   If Feld(I) = 0 Then
    SaveI = I
   
   For a = 0 To 7
       If I - a * 8 > 0 Then AY = a + 1
   Next a
   AX = I - (AY - 1) * 8
   
   saveX = AX
   
   For a = 1 To 500
     If I > 8 Then Img(I - 8).Picture = Img(Feld(I - 8) + 65).Picture
     If I > 8 And AX < 8 Then Img(I - 7).Picture = Img(Feld(I - 7) + 65).Picture
     If AX < 8 Then Img(I + 1).Picture = Img(Feld(I + 1) + 65).Picture
     If I < 56 And AX < 8 Then Img(I + 9).Picture = Img(Feld(I + 9) + 65).Picture
     If I < 57 Then Img(I + 8).Picture = Img(Feld(I + 8) + 65).Picture
     If I < 56 And AX > 1 Then Img(I + 7).Picture = Img(Feld(I + 7) + 65).Picture
     If AX > 1 Then Img(I - 1).Picture = Img(Feld(I - 1) + 65).Picture
     If I > 9 And AX > 1 Then Img(I - 9).Picture = Img(Feld(I - 9) + 65).Picture
   
     ok = 0
     anz = 0
     Do
       zufi = Int(Rnd * 8)
       
       Select Case zufi
              Case 0
                   If I > 8 And Feld(I - 8) = 0 Then I = I - 8: ok = 1: anz = anz + 1
              Case 1
                   If I > 8 And AX < 8 And Feld(I - 7) = 0 Then I = I - 7: ok = 1: AX = AX + 1: anz = anz + 1
              Case 2
                   If AX < 8 And Feld(I + 1) = 0 Then I = I + 1: AX = AX + 1: ok = 1: anz = anz + 1
              Case 3
                   If I < 56 And AX < 8 And Feld(I + 9) = 0 Then I = I + 9: AX = AX + 1: ok = 1: anz = anz + 1
              Case 4
                   If I < 57 And Feld(I + 8) = 0 Then I = I + 8: ok = 1: anz = anz + 1
              Case 5
                   If I < 57 And AX > 1 And Feld(I + 7) = 0 Then I = I + 7: AX = AX - 1: ok = 1: anz = anz + 1
              Case 6
                   If AX > 1 And Feld(I - 1) = 0 Then I = I - 1: AX = AX - 1: ok = 1: anz = anz + 1
              Case 7
                   If I > 9 And AX > 1 And Feld(I - 9) = 0 Then I = I - 9: AX = AX - 1: ok = 1: anz = anz + 1
       End Select
     Loop Until ok = 1
     If anz = 6 Then I = SaveI: AX = saveX
   Next a
   End If
   If Feld(Index) = 9 Then
      Uhr.Enabled = False
      For a = 1 To 64
          If Feld(a) <> 9 And Img(a).Picture = Img(77).Picture Then Img(a).Picture = Img(78).Picture
          If Feld(a) = 9 Then Img(a).Picture = Img(74).Picture
          Img(a).Enabled = False
      Next a
      Img(Index).Picture = Img(75).Picture
   End If
Else
   If Img(Index).Picture = LoadPicture() Then
      LabelMinenAnz.Caption = LabelMinenAnz.Caption - 1
      Img(Index).Picture = Img(77).Picture
   ElseIf Img(Index).Picture = Img(77).Picture Then
      LabelMinenAnz.Caption = LabelMinenAnz.Caption + 1
      Img(Index).Picture = LoadPicture()
   End If
End If

For a = 1 To 64
    If Img(a).Picture <> LoadPicture() Then Test = Test + 1
    If Img(a).Picture = Img(77).Picture Then Test1 = Test1 + 1
Next a
If Test = 64 And LabelMinenAnz.Caption = 0 And Test1 = Minen Then
   Uhr.Enabled = False
   For a = 1 To 64
       If Img(a).Picture = Img(77).Picture Then Img(a).Picture = Img(76).Picture
       Img(a).Enabled = False
   Next a
   LabelGewonnen.Caption = LabelGewonnen.Caption + 1
   If LabelGesamt.Caption = 0 Then LabelGesamt.Caption = 1
   Img(79).Visible = True
   If LabelZeitAnz.Caption < LabelZeit.Caption Then
      LabelZeit.Caption = LabelZeitAnz.Caption
      Load BestForm
      BestForm.Visible = True
   End If
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

SmileForm.Height = 4275

LabelZeitAnz.Caption = 0
LabelMinenAnz.Caption = Minen

SmileForm.Picture = SmileForm.Picture

Img(79).Visible = False

For a = 1 To 64
    Feld(a) = 0
    Img(a).Enabled = True
    Img(a).Picture = LoadPicture()
Next a
I = 1

End Sub

Private Sub Uhr_Timer()
LabelZeitAnz = LabelZeitAnz + 1
End Sub


