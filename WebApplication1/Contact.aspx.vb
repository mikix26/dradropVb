

Public Class Contact
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim httpFileCollection As HttpFileCollection = Request.Files
            cargar(httpFileCollection)
        End If

    End Sub


    Public Function cargar(httpFileCollection As HttpFileCollection)
        Dim i As Integer = 0
        For Each filenam As String In httpFileCollection
            Dim file As HttpPostedFile = httpFileCollection.Get(filenam)
            Dim fileSizeInBytes As Integer = file.ContentLength
            Dim fileName As String = file.FileName
            i = i + 1
        Next
        Return i
    End Function
End Class