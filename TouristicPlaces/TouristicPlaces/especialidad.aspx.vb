Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Data.DataTable

Public Class especialidad
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            obtenerpaises1()
            obtenerciudades1()
            obtenerdespecialidad()
        End If
    End Sub


    Public Sub obtenerpaises1()

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


    Public Sub obtenerciudades1()

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT id_ciudad, ciudad FROM ciudades")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                ddciudades1.DataSource = cmd.ExecuteReader()
                ddciudades1.DataTextField = "ciudad"
                ddciudades1.DataValueField = "id_ciudad"
                ddciudades1.DataBind()
                con.Close()
            End Using
        End Using
        ddciudades1.Items.Insert(0, New ListItem("--Seleccione ciudad--", "0"))

    End Sub

    Public Sub obtenerdespecialidad()

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT id_especialidad, especialidad FROM especialidades")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                ddespecialidad.DataSource = cmd.ExecuteReader()
                ddespecialidad.DataTextField = "especialidad"
                ddespecialidad.DataValueField = "id_especialidad"
                ddespecialidad.DataBind()
                con.Close()
            End Using
        End Using
        ddespecialidad.Items.Insert(0, New ListItem("--Seleccione Especialidad--", "0"))

    End Sub

    Protected Sub btnBuscarXPais_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBuscarXPais.Click
        'tome el id del pais seleccionado
        Dim paisid As String = Me.ddpaises.SelectedValue.ToString
        Dim paistext As String = Me.ddpaises.SelectedItem.ToString
        'muestre el titulo de la busquedad en la etiqueta
        lblPaisOCiudad.Text = "Hoteles en " + paistext
        'obtenga los resultados de la funcion y muestrelos en el gridview
        dgvResultados1.DataSource = obtengalatablacondatosxPais(paisid)
        dgvResultados1.DataBind()
    End Sub

    Private Function obtengalatablacondatosxPais(ByVal id As String) As DataSet

        'datos de conexion
        Dim ds As New DataSet
        Dim sqlConn As New SqlConnection
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        sqlConn.ConnectionString = constr

        'comando de base de datos a ejecutar
        Dim sqlCmd As New SqlCommand
        sqlCmd.CommandText = "SELECT nombre, pagina_web as Correo, telefono, direccion, ciudad FROM lugares " &
                                "JOIN ciudades " &
                                "ON ciudades.id_ciudad = lugares.id_ciudad " &
                                "WHERE " &
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

    Protected Sub btnBuscarXCiudad_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBuscarXCiudad.Click
        'tome el id del pais seleccionado
        Dim ciudadid As String = Me.ddciudades1.SelectedValue.ToString
        Dim ciudadtext As String = Me.ddciudades1.SelectedItem.ToString()
        'muestre el titulo de la busquedad en la etiqueta
        lblPaisOCiudad.Text = "Hoteles en " + ciudadtext
        'obtenga los resultados de la funcion y muestrelos en el gridview
        dgvResultados1.DataSource = obtengalatablacondatosxCiudad(ciudadid)
        dgvResultados1.DataBind()

    End Sub

    Private Function obtengalatablacondatosxCiudad(ByVal id As String) As DataSet
        'datos de conexion
        Dim ds As New DataSet
        Dim sqlConn As New SqlConnection
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        sqlConn.ConnectionString = constr

        'comando de base de datos a ejecutar
        Dim sqlCmd As New SqlCommand
        sqlCmd.CommandText = "SELECT nombre, pagina_web as Correo, telefono, direccion, ciudad FROM lugares " &
                                "JOIN ciudades " &
                                "ON ciudades.id_ciudad = lugares.id_ciudad " &
                                "WHERE " &
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

    Protected Sub btnBuscarXEspecialidad_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBuscarXEspecialidad.Click

        'tome el id del pais seleccionado
        Dim especialidadid As String = Me.ddespecialidad.SelectedValue.ToString
        Dim especialidadtext As String = Me.ddespecialidad.SelectedItem.ToString()
        'muestre el titulo de la busquedad en la etiqueta
        lblPaisOCiudad.Text = "Hoteles en " + especialidadtext
        'obtenga los resultados de la funcion y muestrelos en el gridview
        dgvResultados1.DataSource = obtengalatablacondatosxespecialidad(especialidadid)
        dgvResultados1.DataBind()
    End Sub


    Private Function obtengalatablacondatosxespecialidad(ByVal id As String) As DataSet

        'datos de conexion
        Dim ds As New DataSet
        Dim sqlConn As New SqlConnection
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        sqlConn.ConnectionString = constr


        'SELECT [nombre], [direccion], [telefono], [pagina_web], [email], [clasificacion] FROM [lugares] WHERE ([id_especialidad] = @id_especialidad)


        'comando de base de datos a ejecutar
        Dim sqlCmd As New SqlCommand
        sqlCmd.CommandText = "SELECT [nombre], [direccion], [telefono], [id_ciudad], [costo_persona], [pagina_web], [email], [clasificacion] FROM [lugares] WHERE ([id_especialidad] = @id_especialidad)"
        sqlCmd.Parameters.AddWithValue("@id_especialidad", id)
        sqlCmd.CommandType = CommandType.Text
        sqlCmd.Connection = sqlConn


        'adaptador para pasar resultado de comando de base de datos al dataset
        Dim sqlAdp As New SqlDataAdapter
        sqlAdp.SelectCommand = sqlCmd

        'pase el resultado de base de datos al dataset
        sqlAdp.Fill(ds)


        Return ds
    End Function

    Protected Sub dgvResultados1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles dgvResultados1.SelectedIndexChanged

    End Sub
End Class