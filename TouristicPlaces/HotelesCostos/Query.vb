Public Class Query
    Private Const ALL = "SELECT [pais], [ciudad], [nombre], [costo_noche], [costo_persona] FROM [HotelesCostos]"
    Private Const ALLCOUNTRIES = "SELECT * FROM [paises]"
    Dim filter As String

    Public Sub setFilterQuery(country As String, city As String, cost As String)
        filter = "SELECT [pais], [ciudad], [nombre], [costo_noche], [costo_persona] " +
                    "FROM [HotelesCostos] " +
                    "WHERE [pais] = '" + country +
                    "' AND [ciudad] = '" + city +
                    "' AND [costo_persona] = " + cost
    End Sub

    Public Function getAllCountries()
        Return (Query.ALLCOUNTRIES)
    End Function

    Public Function getFilteredQuery()
        Return (Me.filter)
    End Function

    Public Function getAllQuery()
        Return (Query.ALL)
    End Function
End Class
