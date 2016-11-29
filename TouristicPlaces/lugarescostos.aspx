<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="lugarescostos.aspx.vb" Inherits="TouristicPlaces.lugarescostos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Costa de lugares turisticos"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Selecionar el lugar"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="listalugares" runat="server" AutoPostBack="True" 
        DataSourceID="conexionlugares" DataTextField="nombre" 
        DataValueField="id_lugar">
    </asp:DropDownList>
    <asp:SqlDataSource ID="conexionlugares" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [lugares]"></asp:SqlDataSource>
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="Relacion de lugares"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="lugares" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="id_lugar" 
        DataSourceID="conexondatospedidos">
        <Columns>
            <asp:BoundField DataField="id_lugar" HeaderText="id_lugar" ReadOnly="True" 
                SortExpression="id_lugar" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="direccion" HeaderText="direccion" 
                SortExpression="direccion" />
            <asp:BoundField DataField="telefono" HeaderText="telefono" 
                SortExpression="telefono" />
            <asp:BoundField DataField="pagina_web" HeaderText="pagina_web" 
                SortExpression="pagina_web" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="costo_persona" HeaderText="costo_persona" 
                SortExpression="costo_persona" />
            <asp:BoundField DataField="costo_noche" HeaderText="costo_noche" 
                SortExpression="costo_noche" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="conexondatospedidos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [id_lugar], [nombre], [direccion], [telefono], [pagina_web], [email], [costo_persona], [costo_noche] FROM [lugares] WHERE ([id_lugar] = @id_lugar)">
        <SelectParameters>
            <asp:ControlParameter ControlID="listalugares" Name="id_lugar" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
</asp:Content>
