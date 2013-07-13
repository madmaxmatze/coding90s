VERSION 5.00
Begin VB.Form TicForm 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Tic Tac Toe"
   ClientHeight    =   4890
   ClientLeft      =   1905
   ClientTop       =   3105
   ClientWidth     =   5010
   Icon            =   "TIC.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   326
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   334
   Begin VB.Timer GewonnenBlinker 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   4560
      Top             =   1560
   End
   Begin VB.Image Img 
      BorderStyle     =   1  'Fest Einfach
      Height          =   540
      Index           =   1
      Left            =   0
      Picture         =   "TIC.frx":030A
      Top             =   0
      Width           =   540
   End
   Begin VB.Image Img 
      BorderStyle     =   1  'Fest Einfach
      Height          =   540
      Index           =   2
      Left            =   480
      Picture         =   "TIC.frx":0614
      Top             =   0
      Width           =   540
   End
   Begin VB.Image Img 
      BorderStyle     =   1  'Fest Einfach
      Height          =   540
      Index           =   3
      Left            =   960
      Picture         =   "TIC.frx":091E
      Top             =   0
      Width           =   540
   End
   Begin VB.Image Img 
      BorderStyle     =   1  'Fest Einfach
      Height          =   540
      Index           =   4
      Left            =   0
      Picture         =   "TIC.frx":0C28
      Top             =   480
      Width           =   540
   End
   Begin VB.Image Img 
      BorderStyle     =   1  'Fest Einfach
      Height          =   540
      Index           =   5
      Left            =   480
      Picture         =   "TIC.frx":0F32
      Top             =   480
      Width           =   540
   End
   Begin VB.Image Img 
      BorderStyle     =   1  'Fest Einfach
      Height          =   540
      Index           =   6
      Left            =   960
      Picture         =   "TIC.frx":123C
      Top             =   480
      Width           =   540
   End
   Begin VB.Image Img 
      BorderStyle     =   1  'Fest Einfach
      Height          =   540
      Index           =   7
      Left            =   0
      Picture         =   "TIC.frx":1546
      Top             =   960
      Width           =   540
   End
   Begin VB.Image Img 
      BorderStyle     =   1  'Fest Einfach
      Height          =   540
      Index           =   8
      Left            =   480
      Picture         =   "TIC.frx":1850
      Top             =   960
      Width           =   540
   End
   Begin VB.Image Img 
      BorderStyle     =   1  'Fest Einfach
      Height          =   540
      Index           =   9
      Left            =   960
      Picture         =   "TIC.frx":1B5A
      Top             =   960
      Width           =   540
   End
   Begin VB.Image Img 
      Height          =   480
      Index           =   10
      Left            =   3600
      Picture         =   "TIC.frx":1E64
      Top             =   480
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Img 
      Height          =   480
      Index           =   11
      Left            =   3960
      Picture         =   "TIC.frx":216E
      Top             =   480
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image Img 
      Height          =   480
      Index           =   12
      Left            =   4320
      Picture         =   "TIC.frx":2478
      Top             =   480
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Menu PopUp_Datei 
      Caption         =   "&Datei"
      Begin VB.Menu PopUp_Datei_Neu 
         Caption         =   "&Neu"
         Shortcut        =   {F2}
      End
      Begin VB.Menu PopUp_Datei_Beenden 
         Caption         =   "&Beenden"
      End
   End
End
Attribute VB_Name = "TicForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Aktiv As Byte
Public a As Byte
Public b As Byte
Public c As Byte
Public Blinker As Byte




Private Sub Form_Load()


For r = 1 To 9
Img(r).Picture = LoadPicture()
Next r
End Sub


Private Sub GewonnenBlinker_Timer()

If Blinker = 1 Then d = Aktiv: Blinker = 0 Else d = 12: Blinker = 1

Img(a).Picture = Img(d).Picture
Img(b).Picture = Img(d).Picture
Img(c).Picture = Img(d).Picture

End Sub

Private Sub Img_Click(Index As Integer)
a = 0
If Img(Index).Picture = LoadPicture() Then
   If Aktiv = 10 Then Aktiv = 11 Else Aktiv = 10
   Img(Index).Picture = Img(Aktiv).Picture
   For Sp = 10 To 11
       For T = 1 To 3
           If Img(T * 3 - 2).Picture = Img(Sp).Picture And Img(T * 3 - 1).Picture = Img(Sp).Picture And Img(T * 3).Picture = Img(Sp).Picture Then a = T * 3 - 2: b = T * 3 - 1: c = T * 3
           If Img(T).Picture = Img(Sp).Picture And Img(T + 3).Picture = Img(Sp).Picture And Img(T + 6).Picture = Img(Sp).Picture Then a = T: b = T + 3: c = T + 6
       Next T
       If Img(1).Picture = Img(Sp).Picture And Img(5).Picture = Img(Sp).Picture And Img(9).Picture = Img(Sp).Picture Then a = 1: b = 5: c = 9
       If Img(3).Picture = Img(Sp).Picture And Img(5).Picture = Img(Sp).Picture And Img(7).Picture = Img(Sp).Picture Then a = 3: b = 5: c = 7
   Next Sp
   If a <> 0 Then
      For r = 1 To 9: Img(r).Enabled = False: Next r
      GewonnenBlinker.Enabled = True
   End If
End If
End Sub

Private Sub Picture1_Click()

End Sub

Private Sub Picture1_DblClick()

End Sub


Private Sub Picture1_DragDrop(Source As Control, X As Single, Y As Single)

End Sub


Private Sub Picture1_DragOver(Source As Control, X As Single, Y As Single, State As Integer)

End Sub


Private Sub Picture1_KeyUp(KeyCode As Integer, Shift As Integer)

End Sub

Private Sub Picture1_LinkNotify()

End Sub

Private Sub Picture1_LinkOpen(Cancel As Integer)

End Sub

Private Sub Picture1_LostFocus()

End Sub

Private Sub Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)

End Sub

Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

End Sub

Private Sub Picture1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)

End Sub


Private Sub Picture1_Paint()

End Sub


Private Sub Picture1_Resize()

End Sub


Private Sub PopUp_Datei_Beenden_Click()
Unload Me
End Sub





Private Sub PopUp_Datei_Neu_Click()
GewonnenBlinker.Enabled = False
For r = 1 To 9
    Img(r).Enabled = True
    Img(r).Picture = LoadPicture()
Next r
End Sub


