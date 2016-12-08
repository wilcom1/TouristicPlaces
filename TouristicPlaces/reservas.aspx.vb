Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class reservas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'al cargar la pagina 
        'tome el nombre del usuario autenticado y pongalo en el la caja
        'de texto de tbUserID
        tbUserID.Text = Context.User.Identity.Name.ToString

        'al cargar la pagina
        'tome el valor de ulr id_lugar y pongalo en
        tblugarID.Text = Request.QueryString("id_lugar").ToString

        If (IsPostBack) Then ' si la pagina esta siendo emitida con datos y no cargada por primera vez.



            'Try
            '    'definimos la variable de conexion y el string de conexion a utilizar dentro de ella
            '    Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("cs").ConnectionString)


            '    conn.Open() ' abrimos la conexion


            '    'definimos nuestro query: numero de usuarios en la base de datos que aparecen con el usuario ingresado en la pagina de registro
            '    Dim confirmarUsuario As String = "Select Count(*) from usuarios where usuario =  '" + tbUsuario.Text + "'"


            '    'definimos el commando a ejecutar y pasamos el query en el y la conexion a utiliar para ejecutar el comando
            '    Dim command As SqlCommand = New SqlCommand(confirmarUsuario, conn)


            '    'definimos una variable de entero para guardar el resultado del query
            '    Dim numDeUsuarios = Convert.ToInt32(command.ExecuteScalar.ToString())


            '    If (numDeUsuarios = 1) Then
            '        MsgBox("El usuario ya existe")
            '    End If


            '    conn.Close() 'cerramos la conexion
            'Catch ex As Exception
            '    MsgBox("error: " + ex.ToString())
            'End Try



        End If
    End Sub


    Protected Sub btnReservar_Click(sender As Object, e As EventArgs) Handles btnReservar.Click


        'Try
        '    Dim id As Guid = Guid.NewGuid()


        '    'definimos la variable de conexion y el string de conexion a utilizar dentro de ella
        '    Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("cs").ConnectionString)


        '    conn.Open() ' abrimos la conexion


        '    'definimos nuestro query: numero de usuarios en la base de datos que aparecen con el usuario ingresado en la pagina de registro
        '    Dim insertarUsuario As String = "Insert into usuarios (id,nombre,apellido,usuario,clave,nivel_ingles,estado_civil,email) values(@id, @nom, @ape, @usu, @cla, @niv, @est, @ema)"


        '    'definimos el commando a ejecutar y pasamos el query en el y la conexion a utiliar para ejecutar el comando
        '    Dim command As SqlCommand = New SqlCommand(insertarUsuario, conn)


        '    'pasamos los parametros con los valores de la pagina de registro
        '    command.Parameters.AddWithValue("@id", id.ToString)
        '    command.Parameters.AddWithValue("@nom", tbUserID.Text)
        '    command.Parameters.AddWithValue("@ape", tblugarID.Text)
        '    command.Parameters.AddWithValue("@usu", tbUsuario.Text)
        '    command.Parameters.AddWithValue("@cla", tbClave.Text)
        '    command.Parameters.AddWithValue("@niv", ddNivelIngles.SelectedValue.ToString)
        '    command.Parameters.AddWithValue("@est", ddEstadoCivil.SelectedValue.ToString)
        '    command.Parameters.AddWithValue("@ema", tbNumPersonas.Text)


        '    'ejecutados el query


        '    command.ExecuteNonQuery()


        '    MsgBox("el registro ha sido exitoso")
        '    Response.Redirect("ingreso.aspx")
        '    conn.Close() 'cerramos la conexion


        'Catch ex As Exception
        '    MsgBox("error: " + ex.ToString())
        'End Try



    End Sub

End Class