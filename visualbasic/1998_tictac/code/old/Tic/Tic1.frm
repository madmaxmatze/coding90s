VERSION 4.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Tic Tac Toe"
   ClientHeight    =   3864
   ClientLeft      =   780
   ClientTop       =   1740
   ClientWidth     =   2436
   Height          =   4416
   Icon            =   "TIC1.frx":0000
   Left            =   732
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "TIC1.frx":030A
   ScaleHeight     =   3864
   ScaleWidth      =   2436
   Top             =   1236
   Width           =   2532
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   732
      Index           =   1
      Left            =   120
      ScaleHeight     =   684
      ScaleWidth      =   684
      TabIndex        =   8
      Top             =   1800
      Width           =   732
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   732
      Index           =   4
      Left            =   120
      ScaleHeight     =   684
      ScaleWidth      =   684
      TabIndex        =   7
      Top             =   2520
      Width           =   732
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   732
      Index           =   2
      Left            =   840
      ScaleHeight     =   684
      ScaleWidth      =   684
      TabIndex        =   6
      Top             =   1800
      Width           =   732
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   732
      Index           =   5
      Left            =   840
      ScaleHeight     =   684
      ScaleWidth      =   684
      TabIndex        =   5
      Top             =   2520
      Width           =   732
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   732
      Index           =   7
      Left            =   120
      ScaleHeight     =   684
      ScaleWidth      =   684
      TabIndex        =   4
      Top             =   3240
      Width           =   732
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   732
      Index           =   3
      Left            =   1560
      ScaleHeight     =   684
      ScaleWidth      =   684
      TabIndex        =   3
      Top             =   1800
      Width           =   732
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   732
      Index           =   6
      Left            =   1560
      ScaleHeight     =   684
      ScaleWidth      =   684
      TabIndex        =   2
      Top             =   2520
      Width           =   732
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   732
      Index           =   8
      Left            =   840
      ScaleHeight     =   684
      ScaleWidth      =   684
      TabIndex        =   1
      Top             =   3240
      Width           =   732
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      Height          =   732
      Index           =   9
      Left            =   1560
      ScaleHeight     =   684
      ScaleWidth      =   684
      TabIndex        =   0
      Top             =   3240
      Width           =   732
   End
   Begin VB.Menu PopUp_Datei 
      Caption         =   "&Datei"
      Begin VB.Menu PopUp_Datei_Beenden 
         Caption         =   "&Beenden"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Image11_Click()

End Sub


Private Sub Form_Load()

End Sub


Private Sub Pic_Click(Index As Integer)

End Sub

Private Sub PopUp_Datei_Beenden_Click()
Unload Me
End Sub


Private Sub PopUp_Datei_Click()

End Sub


