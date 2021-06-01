Imports System.Web.Services
Imports System.Web.Script.Serialization
Imports System.Data.SqlClient
Imports Microsoft.Ajax.Utilities
Imports System.Web.Script.Services
Imports GeoJSON.Net.Feature
Imports Newtonsoft.Json
Imports GeoJSON.Net.Geometry

Public Class Mapas
    Inherits Page
    Public geoSonUbi As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim dt As New DataTable()
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("ConString").ConnectionString
        Dim con As New SqlConnection(connectionString)
        Dim cmd As New SqlCommand("SELECT * FROM UBICACIONES where LATITUD IS NOT NULL", con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
        Dim rows As New List(Of Dictionary(Of String, Object))()
        Dim row As Dictionary(Of String, Object)
        For Each dr As DataRow In dt.Rows
            row = New Dictionary(Of String, Object)
            For Each colu As DataColumn In dt.Columns
                row.Add(colu.ColumnName, dr(colu))
            Next
            rows.Add(row)
            'Dim items As New ListItem
            'items = New ListItem(dr("DES_UNIDAD"), dr("COD_UNIDAD"))
            'selecunidad.Items.Add(items)
        Next
        json.InnerText = serializer.Serialize(rows)


        'Dim dtu As DataTable = New DataTable()

        'Dim cadena As String = "SELECT * FROM UNIDADES"
        'Dim comando As SqlCommand = New SqlCommand(cadena, con)
        'da = New SqlDataAdapter(comando)
        'da.Fill(dtu)
        'con.Close()
        'listunidades.Items.Add(New ListItem("", "-1"))
        'For Each dr As DataRow In dtu.Rows
        '    Dim newListItem As ListItem
        '    newListItem = New ListItem(dr("DES_UNIDAD"), dr("COD_UNIDAD"))
        '    listunidades.Items.Add(newListItem)
        'Next







        'Dim dtT As DataTable = New DataTable()

        'Dim cadena As String = "SELECT * FROM TELEFONOS"
        'Dim comando As SqlCommand = New SqlCommand(cadena, con)
        'da = New SqlDataAdapter(comando)
        'da.Fill(dtT)
        'con.Close()
        'serializer = New System.Web.Script.Serialization.JavaScriptSerializer()
        'rows = New List(Of Dictionary(Of String, Object))()
        'row = New Dictionary(Of String, Object)
        'For Each dr As DataRow In dtT.Rows
        '    row = New Dictionary(Of String, Object)()
        '    For Each col As DataColumn In dtT.Columns
        '        row.Add(col.ColumnName, dr(col))
        '    Next
        '    rows.Add(row)
        'Next
        'jsonT.InnerText = serializer.Serialize(rows)

        'Dim Features As FeatureCollection = New FeatureCollection

        'For Each dr As DataRow In dt.Rows
        '    Dim position As Position = New Position(CDbl(dr("LATITUD")), CDbl(dr("LONGITUD")))
        '    Dim Point As Point = New Point(position)
        '    Dim FE As Feature = New Feature(Point)
        '    Dim par As KeyValuePair(Of String, Object)
        '    par = New KeyValuePair(Of String, Object)("direccion", CStr(dr("DIRECCION")))
        '    FE.Properties.Add(par)
        '    par = New KeyValuePair(Of String, Object)("descripcion", CStr(dr("DESCRIPCION")))
        '    FE.Properties.Add(par)
        '    par = New KeyValuePair(Of String, Object)("codunidad", CStr(dr("COD_UNIDAD")))
        '    FE.Properties.Add(par)
        '    Features.Features.Add(FE)
        'Next

        'geoSonUbi = JsonConvert.SerializeObject(Features)



    End Sub


    '<ScriptMethod(UseHttpGet:=True, ResponseFormat:=ResponseFormat.Json)>
    <WebMethod()>
    Public Shared Function GetCurrentTime(q As String) As String

        Dim connectionString As String = ConfigurationManager.ConnectionStrings("ConString").ConnectionString
        Dim conexion As SqlConnection
        Dim dt As DataTable = New DataTable()
        Dim em As DataTable = New DataTable()
        conexion = New SqlConnection(connectionString)
        Dim cadena As String = "SELECT * FROM UBICACIONES WHERE DESCRIPCION LIKE('%" & q & "%')"
        Dim comando As SqlCommand = New SqlCommand(cadena, conexion)
        'comando.Parameters.Add("@UNIDAD", SqlDbType.VarChar).Value = TEXTO
        conexion.Open()
        Dim da As New SqlDataAdapter(comando)
        da.Fill(dt)
        cadena = "SELECT * FROM UBICACIONES u  inner join dbo.EMAILS e on(u.ID = e.ID_UBICACION) where e.EMAIL LIKE('%" & q & "%')"
        comando = New SqlCommand(cadena, conexion)
        da = New SqlDataAdapter(comando)
        da.Fill(em)
        conexion.Close()
        Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
        Dim rows As New List(Of Dictionary(Of String, Object))()
        Dim row As Dictionary(Of String, Object)
        For Each dr As DataRow In dt.Rows
            row = New Dictionary(Of String, Object)()
            For Each col As DataColumn In dt.Columns
                row.Add(col.ColumnName, dr(col))
            Next
            rows.Add(row)
        Next
        For Each dr As DataRow In em.Rows
            row = New Dictionary(Of String, Object)()
            For Each col As DataColumn In em.Columns
                row.Add(col.ColumnName, dr(col))
            Next
            rows.Add(row)
        Next

        Return serializer.Serialize(rows)
    End Function
    <WebMethod()>
    Public Shared Function DatosUnidad(ByVal codunidad As String) As String
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("ConString").ConnectionString
        Dim conexion As SqlConnection
        Dim dt As DataTable = New DataTable()
        conexion = New SqlConnection(connectionString)
        Dim cadena As String = "SELECT * FROM UNIDADES WHERE COD_UNIDAD=@UNIDAD"
        Dim comando As SqlCommand = New SqlCommand(cadena, conexion)
        comando.Parameters.Add("@UNIDAD", SqlDbType.Int).Value = codunidad
        conexion.Open()
        Dim da As New SqlDataAdapter(comando)
        da.Fill(dt)
        conexion.Close()


        'Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
        'Dim rows As New List(Of Dictionary(Of String, Object))()
        'Dim row As Dictionary(Of String, Object)
        'For Each dr As DataRow In dt.Rows
        '    row = New Dictionary(Of String, Object)()
        '    For Each col As DataColumn In dt.Columns
        '        row.Add(col.ColumnName, dr(col))
        '    Next
        '    rows.Add(row)
        'Next
        'Return serializer.Serialize(rows)
        Return True
    End Function
    <WebMethod()>
    Public Shared Function telefonos(ByVal id As String) As String
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("ConString").ConnectionString
        Dim conexion As SqlConnection
        Dim dt As DataTable = New DataTable()
        conexion = New SqlConnection(connectionString)
        Dim cadena As String = "SELECT * FROM TELEFONOS WHERE ID_UBICACION=@id"
        Dim comando As SqlCommand = New SqlCommand(cadena, conexion)
        comando.Parameters.Add("@id", SqlDbType.Int).Value = id
        conexion.Open()
        Dim da As New SqlDataAdapter(comando)
        da.Fill(dt)
        conexion.Close()
        Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
        Dim rows As New List(Of Dictionary(Of String, Object))()
        Dim row As Dictionary(Of String, Object)
        For Each dr As DataRow In dt.Rows
            row = New Dictionary(Of String, Object)()
            For Each col As DataColumn In dt.Columns
                row.Add(col.ColumnName, dr(col))
            Next
            rows.Add(row)
        Next
        Dim RESP As String = serializer.Serialize(rows)
        Return RESP
    End Function

    Protected Sub veerdatos_Click(sender As Object, e As EventArgs)
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("ConString").ConnectionString
        Dim conexion As SqlConnection
        Dim dt As DataTable = New DataTable()
        conexion = New SqlConnection(connectionString)
        Dim cadena As String = "SELECT *,U.DES_UNIDAD FROM UBICACIONES UB inner JOIN DBO.UNIDADES U ON(U.COD_UNIDAD = UB.COD_UNIDAD) WHERE UB.COD_UNIDAD=@UNIDAD"
        Dim comando As SqlCommand = New SqlCommand(cadena, conexion)
        comando.Parameters.Add("@UNIDAD", SqlDbType.Int).Value = counidad.Value
        conexion.Open()
        Dim da As New SqlDataAdapter(comando)
        da.Fill(dt)
        conexion.Close()
        Repeater2.DataSource = dt
        Repeater2.DataBind()

        unidadSelect.InnerText = dt.Rows(0).Item("DES_UNIDAD")


    End Sub

    Protected Sub Repeater2_ItemDataBound(sender As Object, e As RepeaterItemEventArgs)
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            'Reference the Repeater Item.
            Dim iubicacion As HtmlGenericControl = e.Item.FindControl("datosdesubic")
            Dim re As DataTable = Repeater2.DataSource
            If re.Rows.Count = 1 Then
                iubicacion.Visible = False
            Else
                iubicacion.Visible = True
            End If
            Dim item As DataRowView = e.Item.DataItem
            Dim UBI As Integer = item(0)
            Dim repeemail As Repeater = e.Item.FindControl("RePEmail")
            Dim repeTEL As Repeater = e.Item.FindControl("RepTel")
            Dim connectionString As String = ConfigurationManager.ConnectionStrings("ConString").ConnectionString
            Dim conexion As SqlConnection
            Dim dt As DataTable = New DataTable()
            Dim dtT As DataTable = New DataTable()
            conexion = New SqlConnection(connectionString)
            Dim cadena As String = "SELECT * FROM emails WHERE ID_UBICACION=@UNIDAD"
            Dim comando As SqlCommand = New SqlCommand(cadena, conexion)
            comando.Parameters.Add("@UNIDAD", SqlDbType.Int).Value = UBI
            conexion.Open()
            Dim da As New SqlDataAdapter(comando)
            da.Fill(dt)
            conexion.Close()
            repeemail.DataSource = dt
            repeemail.DataBind()


            cadena = "SELECT * FROM TELEFONOS WHERE ID_UBICACION=@UNIDAD"
            comando = New SqlCommand(cadena, conexion)
            comando.Parameters.Add("@UNIDAD", SqlDbType.Int).Value = UBI
            conexion.Open()
            da = New SqlDataAdapter(comando)
            da.Fill(dtT)
            conexion.Close()
            repeTEL.DataSource = dtT
            repeTEL.DataBind()

            'Reference the Controls.
        End If
    End Sub
End Class