Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Data.DataTable
Public Class clasificación
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            obtenerdespecialidad()
            obtenercaracteristica()
        End If
    End Sub

    Public Sub obtenerdespecialidad()

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT id_especialidad, especialidad FROM especialidades")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Dropespecialidad.DataSource = cmd.ExecuteReader()
                Dropespecialidad.DataTextField = "especialidad"
                Dropespecialidad.DataValueField = "id_especialidad"
                Dropespecialidad.DataBind()
                con.Close()
            End Using
        End Using
        Dropespecialidad.Items.Insert(0, New ListItem("--Seleccione Especialidad--", "0"))

    End Sub
    Protected Sub BEspecialidad_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BEspecialidad.Click

        Dim especialidadid As String = Me.Dropespecialidad.SelectedValue.ToString
        Dim especialidadtext As String = Me.Dropespecialidad.SelectedItem.ToString()
        textconsulta.Text = "Hoteles y Lugares con ambiente " + especialidadtext
        GridResultados.DataSource = Resespecialidad(especialidadid)
        GridResultados.DataBind()
    End Sub
    Private Function Resespecialidad(ByVal id As String) As DataSet
        Dim ds As New DataSet
        Dim sqlConn As New SqlConnection
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        sqlConn.ConnectionString = constr

        'SELECT [id_lugar], [nombre], [direccion], [telefono], [pagina_web], [email], [clasificacion] FROM [lugares] WHERE ([id_especialidad] = @id_especialidad)

        Dim sqlCmd As New SqlCommand
        sqlCmd.CommandText = "SELECT [id_lugar], [nombre], [direccion], [telefono], [pagina_web], [email], [clasificacion] FROM [lugares] WHERE ([id_especialidad] = @id_especialidad)"
        sqlCmd.Parameters.AddWithValue("@id_especialidad", id)
        sqlCmd.CommandType = CommandType.Text
        sqlCmd.Connection = sqlConn
        Dim sqlAdp As New SqlDataAdapter
        sqlAdp.SelectCommand = sqlCmd
        sqlAdp.Fill(ds)
        Return ds
    End Function

    Public Sub obtenercaracteristica()

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT id_caracteristica, caracteristica FROM caracteristicas")
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                DropCaracteristica.DataSource = cmd.ExecuteReader()
                DropCaracteristica.DataTextField = "caracteristica"
                DropCaracteristica.DataValueField = "id_caracteristica"
                DropCaracteristica.DataBind()
                con.Close()
            End Using
        End Using
        DropCaracteristica.Items.Insert(0, New ListItem("--Seleccione Característica--", "0"))

    End Sub
    Protected Sub BCaracteristica_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BCaracteristica.Click

        Dim caracteristicaid As String = Me.DropCaracteristica.SelectedValue.ToString
        Dim caracteristicatext As String = Me.DropCaracteristica.SelectedItem.ToString()
        textconsulta.Text = "Hoteles y lugares con " + caracteristicatext
        GridResultados.DataSource = Rescaracteristica(caracteristicaid)
        GridResultados.DataBind()
    End Sub

    Private Function Rescaracteristica(ByVal id As String) As DataSet
        Dim ds As New DataSet
        Dim sqlConn As New SqlConnection
        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        sqlConn.ConnectionString = constr

        'SELECT [id_lugar], [nombre], [direccion], [telefono], [pagina_web], [email], [clasificacion] FROM [lugares] WHERE ([id_caracteristica] = @id_caracteristica)

        Dim sqlCmd As New SqlCommand
        sqlCmd.CommandText = "SELECT [id_lugar],[nombre], [direccion], [telefono], [pagina_web], [email], [clasificacion] FROM [lugares] WHERE ([id_caracteristica] = @id_caracteristica)"
        sqlCmd.Parameters.AddWithValue("@id_caracteristica", id)
        sqlCmd.CommandType = CommandType.Text
        sqlCmd.Connection = sqlConn
        Dim sqlAdp As New SqlDataAdapter
        sqlAdp.SelectCommand = sqlCmd
        sqlAdp.Fill(ds)
        Return ds
    End Function
   
    Protected Sub GridResultados_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles GridResultados.SelectedIndexChanged

    End Sub
End Class