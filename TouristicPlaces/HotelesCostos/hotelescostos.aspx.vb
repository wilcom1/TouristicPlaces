Public Class hotelescostos
    Inherits System.Web.UI.Page

    Dim query As New Query
    Dim all As String
    Dim allCountries As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        all = query.getAllQuery
        allCountries = query.getAllCountries

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        query.setFilterQuery(DropDownListCountry.SelectedValue, TextBoxCity.Text, CDbl(TextBoxCost.Text))
        SqlDataSource1.SelectCommand = query.getFilteredQuery
    End Sub
End Class