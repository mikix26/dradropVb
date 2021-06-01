

Imports System.IO

Public Class DrapDrop
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim httpFileCollection As HttpFileCollection = Request.Files
            cargar(httpFileCollection)
        End If

    End Sub


    Public Function cargar(httpFileCollection As HttpFileCollection)
        Dim i As Integer = 0
        Dim fileName As String = ""
        For Each filenam As String In httpFileCollection
            Dim file As HttpPostedFile = httpFileCollection.Get(filenam)
            fileName = file.FileName
            If file IsNot Nothing And file.ContentLength > 0 Then
                Dim extension As String = System.IO.Path.GetExtension(file.FileName)
                Dim fname As String = System.IO.Path.GetFileName(file.FileName)
                Dim dt As String = DateTime.Now.ToString("M/d/yyyy")

                Dim folder = Path.GetFullPath("D:\\Descargas_pruebas_drop\\")
                Dim isExist As Boolean = Directory.Exists(folder)
                If isExist = False Then
                    Directory.CreateDirectory(folder)
                End If
                Dim filePath As String = String.Format("{0}\\{1}", folder, file.FileName)
                file.SaveAs(filePath)
            End If

        Next
        Return True
    End Function
End Class