<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="clasificacion.aspx.vb" Inherits="TouristicPlaces.clasificación" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" 
        Text="Búsqueda de hoteles y lugares por características y Especialidad ."></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" 
        Text="Buscar por características del lugar."></asp:Label>
    &nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="caracteristica">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conexionclasificacion %>" 
        SelectCommand="SELECT [caracteristica] FROM [caracteristicas]">
    </asp:SqlDataSource>
    <asp:Button ID="Button2" runat="server" Text="Buscar por Características " />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Buscar por especialidad del lugar."></asp:Label>

    &nbsp;
    <asp:DropDownList ID="listaespecialidad" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="especialidad" 
        DataValueField="especialidad" style="margin-bottom: 0px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:act8_u3_dbConnectionString %>" 
        SelectCommand="SELECT [especialidad] FROM [especialidades]">
    </asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" Text="Buscar por Especialidades " />

    <br />
    <br />

        <asp:Label ID="Label4" runat="server" Text="Resultado de sitios y Hoteles "></asp:Label>
    <br />
    <br />
    <asp:GridView ID="Resultados" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource3" Visible="False" Width="723px">
        <Columns>
            <asp:BoundField DataField="tipo_lugar" HeaderText="tipo_lugar" 
                SortExpression="tipo_lugar" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="direccion" HeaderText="direccion" 
                SortExpression="direccion" />
            <asp:BoundField DataField="telefono" HeaderText="telefono" 
                SortExpression="telefono" />
            <asp:BoundField DataField="pagina_web" HeaderText="pagina_web" 
                SortExpression="pagina_web" />
            <asp:BoundField DataField="clasificacion" HeaderText="clasificacion" 
                SortExpression="clasificacion" />
            <asp:BoundField DataField="id_especialidad" HeaderText="id_especialidad" 
                SortExpression="id_especialidad" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:act8_u3_dbConnectionString %>" 
        SelectCommand="SELECT [tipo_lugar], [nombre], [direccion], [telefono], [pagina_web], [clasificacion], [id_especialidad] FROM [lugares]">
    </asp:SqlDataSource>
    <br />
    <br />
    
    <br />
    <br />
        </asp:Content>
