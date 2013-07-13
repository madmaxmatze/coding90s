VERSION 5.00
Begin VB.Form LogikForm 
   BorderStyle     =   0  'Kein
   Caption         =   "MASTER   BRAIN"
   ClientHeight    =   4215
   ClientLeft      =   1275
   ClientTop       =   1545
   ClientWidth     =   4500
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "BRAIN.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   4215
   ScaleWidth      =   4500
   Begin VB.PictureBox PicColor 
      BackColor       =   &H00FF0000&
      BorderStyle     =   0  'Kein
      Height          =   252
      Index           =   8
      Left            =   3150
      ScaleHeight     =   255
      ScaleWidth      =   450
      TabIndex        =   46
      TabStop         =   0   'False
      Top             =   0
      Width           =   450
   End
   Begin VB.PictureBox PicColor 
      BackColor       =   &H0000FF00&
      BorderStyle     =   0  'Kein
      Height          =   252
      Index           =   9
      Left            =   3600
      ScaleHeight     =   255
      ScaleWidth      =   450
      TabIndex        =   45
      TabStop         =   0   'False
      Top             =   0
      Width           =   450
   End
   Begin VB.PictureBox PicColor 
      BackColor       =   &H00008000&
      BorderStyle     =   0  'Kein
      Height          =   252
      Index           =   10
      Left            =   4050
      ScaleHeight     =   255
      ScaleWidth      =   450
      TabIndex        =   44
      TabStop         =   0   'False
      Top             =   0
      Width           =   450
   End
   Begin VB.PictureBox PicColor 
      BackColor       =   &H000080FF&
      BorderStyle     =   0  'Kein
      Height          =   252
      Index           =   2
      Left            =   450
      ScaleHeight     =   255
      ScaleWidth      =   450
      TabIndex        =   43
      TabStop         =   0   'False
      Top             =   0
      Width           =   450
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   29
      Left            =   3960
      Picture         =   "BRAIN.frx":030A
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   42
      Top             =   4200
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   28
      Left            =   3480
      Picture         =   "BRAIN.frx":0614
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   41
      Top             =   4200
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   27
      Left            =   3000
      Picture         =   "BRAIN.frx":091E
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   40
      Top             =   4200
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   30
      Left            =   4440
      Picture         =   "BRAIN.frx":0C28
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   39
      Top             =   4200
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox PicColor 
      BackColor       =   &H000000C0&
      BorderStyle     =   0  'Kein
      Height          =   252
      Index           =   5
      Left            =   1800
      ScaleHeight     =   255
      ScaleWidth      =   450
      TabIndex        =   38
      TabStop         =   0   'False
      Top             =   0
      Width           =   450
   End
   Begin VB.PictureBox PicColor 
      BackColor       =   &H000000FF&
      BorderStyle     =   0  'Kein
      Height          =   252
      Index           =   4
      Left            =   1350
      ScaleHeight     =   255
      ScaleWidth      =   450
      TabIndex        =   37
      TabStop         =   0   'False
      Top             =   0
      Width           =   450
   End
   Begin VB.PictureBox PicColor 
      BackColor       =   &H00FF00FF&
      BorderStyle     =   0  'Kein
      Height          =   252
      Index           =   3
      Left            =   900
      ScaleHeight     =   255
      ScaleWidth      =   450
      TabIndex        =   36
      TabStop         =   0   'False
      Top             =   0
      Width           =   450
   End
   Begin VB.PictureBox PicColor 
      BackColor       =   &H00FFFF00&
      BorderStyle     =   0  'Kein
      Height          =   252
      Index           =   7
      Left            =   2700
      ScaleHeight     =   255
      ScaleWidth      =   450
      TabIndex        =   35
      TabStop         =   0   'False
      Top             =   0
      Width           =   450
   End
   Begin VB.PictureBox PicColor 
      BackColor       =   &H00808080&
      BorderStyle     =   0  'Kein
      Height          =   252
      Index           =   6
      Left            =   2250
      ScaleHeight     =   255
      ScaleWidth      =   450
      TabIndex        =   34
      TabStop         =   0   'False
      Top             =   0
      Width           =   450
   End
   Begin VB.PictureBox PicColor 
      BackColor       =   &H0000FFFF&
      BorderStyle     =   0  'Kein
      Height          =   252
      Index           =   1
      Left            =   0
      ScaleHeight     =   255
      ScaleWidth      =   450
      TabIndex        =   33
      TabStop         =   0   'False
      Top             =   0
      Width           =   450
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   7
      Left            =   2040
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   31
      Top             =   1320
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   21
      Left            =   120
      Picture         =   "BRAIN.frx":0F32
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   30
      Top             =   4200
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   25
      Left            =   2040
      Picture         =   "BRAIN.frx":123C
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   29
      Top             =   4200
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   24
      Left            =   1560
      Picture         =   "BRAIN.frx":1546
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   28
      Top             =   4200
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   23
      Left            =   1080
      Picture         =   "BRAIN.frx":1850
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   27
      Top             =   4200
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   22
      Left            =   600
      Picture         =   "BRAIN.frx":1B5A
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   26
      Top             =   4200
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   26
      Left            =   2520
      Picture         =   "BRAIN.frx":1E64
      ScaleHeight     =   435
      ScaleWidth      =   435
      TabIndex        =   25
      Top             =   4200
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox PicColor 
      BackColor       =   &H000080FF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   732
      Index           =   0
      Left            =   3600
      ScaleHeight     =   675
      ScaleWidth      =   675
      TabIndex        =   24
      TabStop         =   0   'False
      Top             =   480
      Width           =   732
      Begin VB.CommandButton OKButton 
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "Comic Sans MS"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   492
         Left            =   120
         TabIndex        =   32
         Top             =   120
         Width           =   492
      End
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   20
      Left            =   2640
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   18
      Top             =   3480
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   19
      Left            =   2040
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   17
      Top             =   3480
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   18
      Left            =   1440
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   16
      Top             =   3480
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   17
      Left            =   840
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   15
      Top             =   3480
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   16
      Left            =   2640
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   14
      Top             =   2760
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   15
      Left            =   2040
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   13
      Top             =   2760
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   14
      Left            =   1440
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   12
      Top             =   2760
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   13
      Left            =   840
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   11
      Top             =   2760
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00A8A0A0&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   12
      Left            =   2640
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   10
      Top             =   2040
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   11
      Left            =   2040
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   9
      Top             =   2040
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   10
      Left            =   1440
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   8
      Top             =   2040
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   9
      Left            =   840
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   7
      Top             =   2040
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BackColor       =   &H00A8A0A0&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   8
      Left            =   2640
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   6
      Top             =   1320
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   6
      Left            =   1440
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   5
      Top             =   1320
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   5
      Left            =   840
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   4
      Top             =   1320
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   4
      Left            =   2640
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   3
      Top             =   600
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   3
      Left            =   2040
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   2
      Top             =   600
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   2
      Left            =   1440
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   1
      Top             =   600
      Width           =   492
   End
   Begin VB.PictureBox Pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   1
      Left            =   840
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   29
      TabIndex        =   0
      Top             =   600
      Width           =   492
   End
   Begin VB.Line Linie 
      Index           =   0
      X1              =   0
      X2              =   4560
      Y1              =   252
      Y2              =   252
   End
   Begin VB.Shape Rahmen 
      Height          =   3612
      Left            =   120
      Top             =   480
      Width           =   3252
   End
   Begin VB.Line Linie 
      Index           =   1
      X1              =   120
      X2              =   3360
      Y1              =   1200
      Y2              =   1200
   End
   Begin VB.Line Linie 
      Index           =   4
      Visible         =   0   'False
      X1              =   3360
      X2              =   120
      Y1              =   3360
      Y2              =   3360
   End
   Begin VB.Line Linie 
      Index           =   3
      Visible         =   0   'False
      X1              =   3360
      X2              =   120
      Y1              =   2640
      Y2              =   2640
   End
   Begin VB.Line Linie 
      Index           =   2
      Visible         =   0   'False
      X1              =   3360
      X2              =   120
      Y1              =   1920
      Y2              =   1920
   End
   Begin VB.Label Label 
      Alignment       =   2  'Zentriert
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   5
      Left            =   240
      TabIndex        =   23
      Top             =   3480
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.Label Label 
      Alignment       =   2  'Zentriert
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   4
      Left            =   240
      TabIndex        =   22
      Top             =   2760
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.Label Label 
      Alignment       =   2  'Zentriert
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   3
      Left            =   240
      TabIndex        =   21
      Top             =   2040
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.Label Label 
      Alignment       =   2  'Zentriert
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   2
      Left            =   240
      TabIndex        =   20
      Top             =   1320
      Visible         =   0   'False
      Width           =   492
   End
   Begin VB.Label Label 
      Alignment       =   2  'Zentriert
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   492
      Index           =   1
      Left            =   240
      TabIndex        =   19
      Top             =   600
      Width           =   492
   End
   Begin VB.Menu PopUp_Neu 
      Caption         =   "&Neu"
   End
   Begin VB.Menu PopUp_Info 
      Caption         =   "&Info"
   End
   Begin VB.Menu PopUp_Hilfe 
      Caption         =   "&Hilfe"
   End
End
Attribute VB_Name = "LogikForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Farbe As Byte
Public Aktiv As Byte
Dim Feld(1 To 4) As Byte
Dim FeldTest(1 To 4) As Byte

Private Sub Form_Load()
Randomize
Farbe = 1
PicColor(0).BackColor = &HFFFFF
Neu
End Sub




Private Sub OKButton_Click()

Aktiv = Aktiv + 1: C = 0

For A = 1 To 4
    For B = 1 To 4
        If Pic((Aktiv - 2) * 4 + A).Picture = Pic(20 + Feld(B)) Then Pic((Aktiv - 2) * 4 + A).BackColor = &HFFFFFF
    Next B
    If Pic((Aktiv - 2) * 4 + A).Picture = Pic(20 + Feld(A)).Picture Then Pic((Aktiv - 2) * 4 + A).BackColor = H0: FeldTest(A) = Feld(A): C = C + 1 Else FeldTest(A) = 0
Next A

If C = 4 Then
   For A = 1 To 4
       Pic((Aktiv - 2) * 4 + A).Enabled = False
   Next A
   PicColor(0).Visible = False
   MsgBox "Sie haben die Kombination geknackt !!!", vbExclamation, "Master-Brain"
Else
   For A = 1 To 4
       If Aktiv < 6 Then Pic((Aktiv - 1) * 4 + A).Visible = True
       If Aktiv < 6 Then If FeldTest(A) > 0 Then Pic((Aktiv - 1) * 4 + A).Picture = Pic(20 + FeldTest(A)).Picture
       Pic((Aktiv - 2) * 4 + A).Enabled = False
   Next A
   If Aktiv < 6 Then
      If Aktiv < 5 Then Linie(Aktiv).Visible = True
      PicColor(0).Top = PicColor(0).Top + 720
      Label(Aktiv).Visible = True
   Else
      PicColor(0).Visible = False
   End If
End If
End Sub

Private Sub Pic_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 1 Then
   Pic(Index).Picture = Pic(20 + Farbe)
End If
End Sub


Public Sub Neu()

Aktiv = 1

PicColor(0).Visible = True
PicColor(0).Top = 480

For A = 1 To 4
    Feld(A) = Int(Rnd * 10) + 1
    FeldTest(A) = 0
    Pic(A).Enabled = True
Next A

For A = 5 To 20
    Pic(A).Visible = False
    Pic(A).Enabled = True
Next A

For A = 1 To 20
    Pic(A).Picture = LoadPicture()
    Pic(A).BackColor = Pic(21).BackColor
Next A

For A = 2 To 5
    Label(A).Visible = False
    If A < 5 Then Linie(A).Visible = False
Next A

End Sub

Private Sub PicColor_Click(Index As Integer)
If Index > 0 Then Farbe = Index: PicColor(0).BackColor = PicColor(Index).BackColor
End Sub

Private Sub PopUp_Hilfe_Click()
MsgBox "Master Brain ist ein Logikspiel bei dem sich der Computer eine 4er Kombination aus 10 Farben ausdenkt, welche sie erraten sollen. Setzten sie die richtige Farbe an die richtige Stelle, wird ihnen das durch einen schwarzen Hintergrund mitgeteilt. Ist die richtige Farbe nur an der falschen Stelle erscheint ihr Hintergrund weiß. Mit ein bischen Übung dürfte es für sie kein Problem sein die richtige Kombination schnell herauszufinden.                                                                                                   Also dann viel Spaß bei      M  A  S  T  E  R     B  R  A  I  N   !  !  !", vbQuestion, "Hilfe von Master Brain"
End Sub

Private Sub PopUp_Info_Click()
MsgBox "Master Brain" & Chr(13) & "Copyright 1998 by Mathias Nitzsche", vbInformation, "Info..."
End Sub

Private Sub PopUp_Neu_Click()
Neu
End Sub


