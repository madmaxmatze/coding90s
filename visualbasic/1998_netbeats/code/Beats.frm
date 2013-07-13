VERSION 5.00
Begin VB.Form BeatsForm 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'Kein
   Caption         =   "NetBeats: "
   ClientHeight    =   1995
   ClientLeft      =   2040
   ClientTop       =   2295
   ClientWidth     =   3195
   Icon            =   "BEATS.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   133
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   213
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   720
      Top             =   480
   End
   Begin VB.Image PunktInaktiv 
      Height          =   75
      Left            =   3000
      Picture         =   "BEATS.frx":030A
      Top             =   2520
      Visible         =   0   'False
      Width           =   75
   End
   Begin VB.Image PunktAktiv 
      Height          =   75
      Left            =   2760
      Picture         =   "BEATS.frx":0774
      Top             =   2520
      Visible         =   0   'False
      Width           =   75
   End
   Begin VB.Image Punkt 
      Height          =   75
      Left            =   1755
      Picture         =   "BEATS.frx":0BDE
      Top             =   1410
      Width           =   75
   End
   Begin VB.Image HauptBild 
      Height          =   1950
      Left            =   480
      Picture         =   "BEATS.frx":1048
      Top             =   2880
      Visible         =   0   'False
      Width           =   3195
   End
   Begin VB.Image SetupAktiv 
      Height          =   1440
      Left            =   240
      Picture         =   "BEATS.frx":823A
      Top             =   2880
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Image InfoAktiv 
      Height          =   1440
      Left            =   0
      Picture         =   "BEATS.frx":8DFC
      Top             =   2880
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Image SetupLeiste 
      Height          =   1455
      Left            =   2940
      Top             =   255
      Width           =   255
   End
   Begin VB.Image InfoLeiste 
      Height          =   1455
      Left            =   0
      Top             =   255
      Width           =   255
   End
   Begin VB.Image BeendenAktiv 
      Height          =   255
      Left            =   0
      Picture         =   "BEATS.frx":99BE
      Top             =   2640
      Visible         =   0   'False
      Width           =   2685
   End
   Begin VB.Image TitelleisteAktiv 
      Height          =   255
      Left            =   0
      Picture         =   "BEATS.frx":A9F4
      Top             =   2400
      Visible         =   0   'False
      Width           =   2685
   End
   Begin VB.Image Zeitanzeige 
      Height          =   330
      Index           =   5
      Left            =   525
      Top             =   1155
      Width           =   285
   End
   Begin VB.Image Zeitanzeige 
      Height          =   330
      Index           =   4
      Left            =   930
      Top             =   1155
      Width           =   285
   End
   Begin VB.Image Zeitanzeige 
      Height          =   330
      Index           =   3
      Left            =   1365
      Top             =   1155
      Width           =   285
   End
   Begin VB.Image Zeitanzeige 
      Height          =   330
      Index           =   2
      Left            =   1920
      Top             =   1155
      Width           =   285
   End
   Begin VB.Image Zeitanzeige 
      Height          =   330
      Index           =   1
      Left            =   2325
      Top             =   1155
      Width           =   285
   End
   Begin VB.Image Zahlen 
      Height          =   330
      Index           =   9
      Left            =   2160
      Picture         =   "BEATS.frx":BA2A
      Top             =   2040
      Visible         =   0   'False
      Width           =   285
   End
   Begin VB.Image Zahlen 
      Height          =   330
      Index           =   8
      Left            =   1920
      Picture         =   "BEATS.frx":C024
      Top             =   2040
      Visible         =   0   'False
      Width           =   285
   End
   Begin VB.Image Zahlen 
      Height          =   330
      Index           =   7
      Left            =   1680
      Picture         =   "BEATS.frx":C61E
      Top             =   2040
      Visible         =   0   'False
      Width           =   285
   End
   Begin VB.Image Zahlen 
      Height          =   330
      Index           =   6
      Left            =   1440
      Picture         =   "BEATS.frx":CC18
      Top             =   2040
      Visible         =   0   'False
      Width           =   285
   End
   Begin VB.Image Zahlen 
      Height          =   330
      Index           =   5
      Left            =   1200
      Picture         =   "BEATS.frx":D212
      Top             =   2040
      Visible         =   0   'False
      Width           =   285
   End
   Begin VB.Image Zahlen 
      Height          =   330
      Index           =   4
      Left            =   960
      Picture         =   "BEATS.frx":D80C
      Top             =   2040
      Visible         =   0   'False
      Width           =   285
   End
   Begin VB.Image Zahlen 
      Height          =   330
      Index           =   3
      Left            =   720
      Picture         =   "BEATS.frx":DE06
      Top             =   2040
      Visible         =   0   'False
      Width           =   285
   End
   Begin VB.Image Zahlen 
      Height          =   330
      Index           =   2
      Left            =   480
      Picture         =   "BEATS.frx":E400
      Top             =   2040
      Visible         =   0   'False
      Width           =   285
   End
   Begin VB.Image Zahlen 
      Height          =   330
      Index           =   1
      Left            =   240
      Picture         =   "BEATS.frx":E9FA
      Top             =   2040
      Visible         =   0   'False
      Width           =   285
   End
   Begin VB.Image Zahlen 
      Height          =   330
      Index           =   0
      Left            =   0
      Picture         =   "BEATS.frx":EFF4
      Top             =   2040
      Visible         =   0   'False
      Width           =   285
   End
   Begin VB.Image Titelleiste 
      Height          =   255
      Left            =   255
      Top             =   0
      Width           =   2670
   End
   Begin VB.Image BeendenLeiste 
      Height          =   255
      Left            =   255
      Top             =   1695
      Width           =   2700
   End
End
Attribute VB_Name = "BeatsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public MouseD As Byte
Public MouseX As Single
Public MouseY As Single
Public Zeit As Long
Public Grosse As Byte
Public Test As String
Private Sub BeendenLeiste_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Unload Me
End Sub


Private Sub BeendenLeiste_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
BeendenLeiste.Picture = BeendenAktiv.Picture
Titelleiste.Picture = LoadPicture()
InfoLeiste.Picture = LoadPicture()
SetupLeiste.Picture = LoadPicture()
End Sub


Private Sub Form_Load()
BeatsForm.Picture = HauptBild.Picture
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Titelleiste.Picture = LoadPicture()
BeendenLeiste.Picture = LoadPicture()
InfoLeiste.Picture = LoadPicture()
SetupLeiste.Picture = LoadPicture()
Punkt.Picture = PunktInaktiv.Picture
End Sub


Private Sub InfoLeiste_Click()
Load InfoForm
InfoForm.Visible = True
BeatsForm.Enabled = False
End Sub

Private Sub InfoLeiste_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
MouseD = 1
End Sub

Private Sub InfoLeiste_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
BeendenLeiste.Picture = LoadPicture()
Titelleiste.Picture = LoadPicture()
InfoLeiste.Picture = InfoAktiv.Picture
SetupLeiste.Picture = LoadPicture()
End Sub


Private Sub InfoLeiste_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
MouseD = 0
End Sub

Private Sub Punkt_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
MouseD = 1

If Grosse = 0 Then
Grosse = 1
BeatsForm.Picture = LoadPicture()
InfoLeiste.Enabled = False
BeendenLeiste.Enabled = False
SetupLeiste.Enabled = False
Titelleiste.Enabled = False
BeatsForm.Height = 440
BeatsForm.Width = 2100
Zeitanzeige(1).Top = 3
Zeitanzeige(1).Left = 118
Zeitanzeige(2).Top = 3
Zeitanzeige(2).Left = 90
Zeitanzeige(3).Top = 3
Zeitanzeige(3).Left = 58
Zeitanzeige(4).Top = 3
Zeitanzeige(4).Left = 30
Zeitanzeige(5).Top = 3
Zeitanzeige(5).Left = 3
Punkt.Top = 20
Punkt.Left = 81
ElseIf Grosse = 1 Then
Grosse = 0
BeatsForm.Picture = HauptBild.Picture
InfoLeiste.Enabled = True
BeendenLeiste.Enabled = True
SetupLeiste.Enabled = True
Titelleiste.Enabled = True
BeatsForm.Height = 1950
BeatsForm.Width = 3200
Zeitanzeige(1).Top = 77
Zeitanzeige(1).Left = 155
Zeitanzeige(2).Top = 77
Zeitanzeige(2).Left = 128
Zeitanzeige(3).Top = 77
Zeitanzeige(3).Left = 91
Zeitanzeige(4).Top = 77
Zeitanzeige(4).Left = 62
Zeitanzeige(5).Top = 77
Zeitanzeige(5).Left = 35
Punkt.Top = 94
Punkt.Left = 117
End If
End Sub

Private Sub Punkt_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Punkt.Picture = PunktAktiv.Picture
End Sub


Private Sub Punkt_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
MouseD = 0
End Sub


Private Sub SetupLeiste_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
MouseD = 1
End Sub

Private Sub SetupLeiste_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
BeendenLeiste.Picture = LoadPicture()
Titelleiste.Picture = LoadPicture()
InfoLeiste.Picture = LoadPicture()
SetupLeiste.Picture = SetupAktiv.Picture

End Sub


Private Sub SetupLeiste_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
MouseD = 0
End Sub

Private Sub Timer1_Timer()

Zeit = Timer * 1.157407407
Lange = Len(Str(Zeit)) - 1

Zeitanzeige(1).Picture = Zahlen(Right(Zeit, 1))
If Lange > 1 Then Zeitanzeige(2).Picture = Zahlen(Left(Right(Zeit, 2), 1)) Else Zeitanzeige(2).Picture = Zahlen(0)
If Lange > 2 Then Zeitanzeige(3).Picture = Zahlen(Left(Right(Zeit, 3), 1)) Else Zeitanzeige(3).Picture = Zahlen(0)
If Lange > 3 Then Zeitanzeige(4).Picture = Zahlen(Left(Right(Zeit, 4), 1)) Else Zeitanzeige(4).Picture = LoadPicture()
If Lange > 4 Then Zeitanzeige(5).Picture = Zahlen(Left(Zeit, 1)) Else Zeitanzeige(5).Picture = LoadPicture()

Test = Zeit / 100

If Left(Right(Test, 3), 1) <> "," Then Test = Test + "0"

BeatsForm.Caption = "NetBeats:" + Test

End Sub

Private Sub Titelleiste_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
MouseD = 1
MouseX = X
MouseY = Y
End Sub


Private Sub Titelleiste_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If MouseD = 1 Then
BeatsForm.Top = BeatsForm.Top + Y - MouseY
BeatsForm.Left = BeatsForm.Left + X - MouseX
End If
Titelleiste.Picture = TitelleisteAktiv.Picture
BeendenLeiste.Picture = LoadPicture()
InfoLeiste.Picture = LoadPicture()
SetupLeiste.Picture = LoadPicture()
End Sub


Private Sub Titelleiste_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
MouseD = 0
End Sub



