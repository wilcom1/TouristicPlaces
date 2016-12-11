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

        
        Try
            'al cargar la pagina
            'tome el valor de ulr id_lugar y pongalo en    
            tblugarID.Text = Request.QueryString("id_lugar").ToString
        Catch ex As Exception
            tblugarID.Text = ""
        End Try


        'If (IsPostBack) Then ' si la pagina esta siendo emitida con datos y no cargada por primera vez.

        'Try
        '    'definimos la variable de conexion y el string de conexion a utilizar dentro de ella
        'Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString)


        'conn.Open() ' abrimos la conexion


        '    'definimos nuestro query: numero de usuarios en la base de datos que aparecen con el usuario ingresado en la pagina de registro


        'Dim confirmarUsuario As String = "Select Count(*) from usuarios where UserId =  '" + tbUserID.Text + "'"


        '    'definimos el commando a ejecutar y pasamos el query en el y la conexion a utiliar para ejecutar el comando
        'Dim command As SqlCommand = New SqlCommand(confirmarUsuario, conn)


        '    'definimos una variable de entero para guardar el resultado del query
        'Dim numDeUsuarios = Convert.ToInt32(command.ExecuteScalar.ToString())


        'If (numDeUsuarios = 1) Then
        'MsgBox("El usuario ya existe")
        'End If
        '

        'conn.Close() 'cerramos la conexion
        'Catch ex As Exception
        '        MsgBox("error: " + ex.ToString())
        'End Try



        '    End If
    End Sub


    Protected Sub btnReservar_Click(sender As Object, e As EventArgs) Handles btnReservar.Click


        Try
            Dim id As Guid = Guid.NewGuid()
            'definimos la variable de conexion y el string de conexion a utilizar dentro de ella

            Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings.Item("ConnectionString").ToString)
            conn.Open() ' abrimos la conexion

            'definimos nuestro query: numero de usuarios en la base de datos que aparecen con el usuario ingresado en la pagina de registro
            Dim crearReservacion As String = "Insert into reservaciones (id_reservations, userId, id_lugar, check_in, check_out, num_personas) values (@idres, @idus, @idlug,@chin,@chout,@pers)"

            'definimos el commando a ejecutar y pasamos el query en el y la conexion a utiliar para ejecutar el comando
            Dim command As SqlCommand = New SqlCommand(crearReservacion, conn)


            'pasamos los parametros con los valores de la pagina de registro
            command.Parameters.AddWithValue("@idres", id.ToString)
            command.Parameters.AddWithValue("@idus", tbUserID.Text)
            command.Parameters.AddWithValue("@idlug", tblugarID.Text)
            command.Parameters.AddWithValue("@chin", calCheckIN.SelectedDate)
            command.Parameters.AddWithValue("@chout", calCheckOUT.SelectedDate)
            command.Parameters.AddWithValue("@pers", tbNumPersonas.Text)


            'ejecutados el query
            command.ExecuteNonQuery()

            MsgBox("el registro ha sido exitoso")
            conn.Close() 'cerramos la conexion
            'Server.Transfer("Default.aspx", True)
            Response.BufferOutput = True
            Response.Redirect("~\Default.aspx")

        Catch ex As Exception
            'MsgBox("error: " + ex.ToString())
        End Try

    End Sub

End Class