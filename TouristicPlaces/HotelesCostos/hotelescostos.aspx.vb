Public Class hotelescostos
    Inherits System.Web.UI.Page

    Dim query As New Query
    Dim all As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        all = query.getAllQuery
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        Dim consulta As String
        query.setFilterQuery(TextBoxCountry.Text, TextBoxCity.Text, CDbl(TextBoxCost.Text))
        consulta = query.getFilteredQuery
    End Sub
End Class