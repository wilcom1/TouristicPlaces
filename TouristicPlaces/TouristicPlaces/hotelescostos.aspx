<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="hotelescostos.aspx.vb" Inherits="TouristicPlaces.hotelescostos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Encontrar hotel por costos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Encontrar Hoteles por Precio</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True" 
        AllowSorting="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="pais" HeaderText="pais" SortExpression="pais" />
            <asp:BoundField DataField="ciudad" HeaderText="ciudad" 
                SortExpression="ciudad" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="costo_noche" HeaderText="costo_noche" 
                SortExpression="costo_noche" />
            <asp:BoundField DataField="costo_persona" HeaderText="costo_persona" 
                SortExpression="costo_persona" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [pais], [ciudad], [nombre], [costo_noche], [costo_persona] FROM [HotelesCostos]"></asp:SqlDataSource>
    <asp:ObjectDataSource ID="act8_u3_db" runat="server"></asp:ObjectDataSource>
    <asp:Label Text="Encontrar Hoteles por Precio"></asp:Label>
</asp:Content>
