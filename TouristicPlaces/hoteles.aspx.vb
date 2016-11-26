Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Data.DataTable
Public Class hoteles
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            obtenerpaises()
            obtenerciudades()
        End If

    End Sub

    Public Sub obtenerpaises()

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT id_pais, pais FROM paises")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                ddpaises.DataSource = cmd.ExecuteReader()
                ddpaises.DataTextField = "pais"
                ddpaises.DataValueField = "id_pais"
                ddpaises.DataBind()
                con.Close()
            End Using
        End Using
        ddpaises.Items.Insert(0, New ListItem("--Seleccione pais--", "0"))

    End Sub

    Public Sub obtenerciudades()

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT id_ciudad, ciudad FROM ciudades")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                ddciudades.DataSource = cmd.ExecuteReader()
                ddciudades.DataTextField = "ciudad"
                ddciudades.DataValueField = "id_ciudad"
                ddciudades.DataBind()
                con.Close()
            End Using
        End Using
        ddciudades.Items.Insert(0, New ListItem("--Seleccione ciudad--", "0"))

    End Sub

    Protected Sub btnBuscarXPais_Click(sender As Object, e As EventArgs) Handles btnBuscarXPais.Click
        'tome el id del pais seleccionado
        Dim paisid As String = Me.ddpaises.SelectedValue.ToString
        Dim paistext As String = Me.ddpaises.SelectedItem.ToString
        'muestre el titulo de la busquedad en la etiqueta
        lblPaisOCiudad.Text = "Hoteles en " + paistext
        'obtenga los resultados de la funcion y muestrelos en el gridview
        dgvResultados.DataSource = obtengalatablacondatosxPais(paisid)
        dgvResultados.DataBind()

    End Sub

    Private Function obtengalatablacondatosxPais(id As String) As DataSet

        'datos de conexion
        Dim ds As New DataSet
        Dim sqlConn As New SqlConnection
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        sqlConn.ConnectionString = constr

        'comando de base de datos a ejecutar
        Dim sqlCmd As New SqlCommand
        sqlCmd.CommandText = "SELECT nombre, pagina_web as www, telefono, direccion, ciudad FROM lugares " &
                                "JOIN ciudades " &
                                "ON ciudades.id_ciudad = lugares.id_ciudad " &
                                "WHERE " &
                                "tipo_lugar = 'H' AND " &
                                "ciudades.id_pais = @id; "
        sqlCmd.Parameters.AddWithValue("@id", id)
        sqlCmd.CommandType = CommandType.Text
        sqlCmd.Connection = sqlConn

        'adaptador para pasar resultado de comando de base de datos al dataset
        Dim sqlAdp As New SqlDataAdapter
        sqlAdp.SelectCommand = sqlCmd

        'pase el resultado de base de datos al dataset
        sqlAdp.Fill(ds)


        Return ds
    End Function

    Protected Sub btnBuscarXCiudad_Click(sender As Object, e As EventArgs) Handles btnBuscarXCiudad.Click
        'tome el id del pais seleccionado
        Dim ciudadid As String = Me.ddciudades.SelectedValue.ToString
        Dim ciudadtext As String = Me.ddciudades.SelectedItem.ToString()
        'muestre el titulo de la busquedad en la etiqueta
        lblPaisOCiudad.Text = "Hoteles en " + ciudadtext
        'obtenga los resultados de la funcion y muestrelos en el gridview
        dgvResultados.DataSource = obtengalatablacondatosxCiudad(ciudadid)
        dgvResultados.DataBind()
    End Sub

    Private Function obtengalatablacondatosxCiudad(id As String) As DataSet
        'datos de conexion
        Dim ds As New DataSet
        Dim sqlConn As New SqlConnection
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        sqlConn.ConnectionString = constr

        'comando de base de datos a ejecutar
        Dim sqlCmd As New SqlCommand
        sqlCmd.CommandText = "SELECT nombre, pagina_web as www, telefono, direccion, ciudad FROM lugares " &
                                "JOIN ciudades " &
                                "ON ciudades.id_ciudad = lugares.id_ciudad " &
                                "WHERE " &
                                "tipo_lugar = 'H' AND " &
                                "ciudades.id_ciudad = @id; "
        sqlCmd.Parameters.AddWithValue("@id", id)
        sqlCmd.CommandType = CommandType.Text
        sqlCmd.Connection = sqlConn

        'adaptador para pasar resultado de comando de base de datos al dataset
        Dim sqlAdp As New SqlDataAdapter
        sqlAdp.SelectCommand = sqlCmd

        'pase el resultado de base de datos al dataset
        sqlAdp.Fill(ds)


        Return ds
    End Function
End Class