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

        dgvResultados.DataSource = obtengalatablacondatos(paisid)
        dgvResultados.DataBind()

    End Sub

    Private Function obtengalatablacondatos(id As String) As DataTable
        Dim dtTable As New DataTable
        Dim sqlConn As New SqlConnection
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        sqlConn.ConnectionString = constr

        '
        'MyCommand = New SqlCommand("UPDATE SeansMessage SET Message = @TicBoxText WHERE Number = 1", dbConn)
        'MyCommand.Parameters.AddWithValue("@TicBoxText", TicBoxText.Text)
        '
        Dim sqlCmd As New SqlCommand
        sqlCmd.CommandText = "SELECT id_lugar, tipo_lugar, nombre, pagina_web, id_pais FROM lugares " &
                                "INNER JOIN ciudades " &
                                "ON ciudades.id_ciudad = lugares.id_ciudad " &
                                "INNER JOIN paises " &
                                "ON paises.id_pais = ciudad.id_ciudad " &
                                "WHERE " &
                                "tipo_lugar = H" &
                                "AND" &
                                "id_pais = @id"
        sqlCmd.Parameters.AddWithValue("@id", id)
        sqlCmd.CommandType = CommandType.Text
        sqlCmd.Connection = sqlConn

        Dim sqlAdp As New SqlDataAdapter
        sqlAdp.SelectCommand = sqlCmd

        'Now fill that datatable:
        sqlAdp.Fill(dtTable)


        Return dtTable
    End Function

    Protected Sub btnBuscarXCiudad_Click(sender As Object, e As EventArgs) Handles btnBuscarXCiudad.Click

    End Sub
End Class