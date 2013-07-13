VERSION 5.00
Begin VB.Form InfoForm 
   BorderStyle     =   1  'Fest Einfach
   Caption         =   "Info..."
   ClientHeight    =   4575
   ClientLeft      =   930
   ClientTop       =   1485
   ClientWidth     =   4470
   Icon            =   "INFO.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'ZReihenfolge
   ScaleHeight     =   4575
   ScaleWidth      =   4470
End
Attribute VB_Name = "InfoForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
SimonForm.Enabled = False
End Sub


Private Sub Form_Unload(Cancel As Integer)
SimonForm.Enabled = True
End Sub


