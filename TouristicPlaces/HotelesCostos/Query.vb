Public Class Query
    Private Const ALL = "SELECT [pais], [ciudad], [nombre], [costo_noche], [costo_persona] FROM [HotelesCostos]"
    Dim filter As String

    Public Sub setFilterQuery(country As String, city As String, cost As String)
        filter = "SELECT [pais], [ciudad], [nombre], [costo_noche], [costo_persona] " +
                    "FROM [HotelesCostos] " +
                    "WHERE [pais] = '" + country +
                    "' AND [ciudad] = '" + city +
                    "' AND [costo_persona] = " + cost
    End Sub

    Public Function getFilteredQuery()
        Return (Me.filter)
    End Function

    Public Function getAllQuery()
        Return (Query.ALL)
    End Function
End Class
