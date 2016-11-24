<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="hotelescostos.aspx.vb" Inherits="TouristicPlaces.hotelescostos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="tipo_lugar" HeaderText="tipo_lugar" 
                SortExpression="tipo_lugar" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" 
            SortExpression="nombre" />
            <asp:BoundField DataField="costo_persona" HeaderText="costo_persona" 
            SortExpression="costo_persona" />
            <asp:BoundField DataField="costo_noche" HeaderText="costo_noche" 
            SortExpression="costo_noche" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    
        SelectCommand="SELECT [tipo_lugar], [nombre], [costo_persona], [costo_noche] FROM [lugares]">
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
