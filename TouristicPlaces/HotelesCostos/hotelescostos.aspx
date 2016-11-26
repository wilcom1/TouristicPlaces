<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="hotelescostos.aspx.vb" Inherits="TouristicPlaces.hotelescostos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Encontrar hotel por costos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Encontrar Hoteles por Precio</h2>

    <form>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" Text="Seleccione país" runat="server"></asp:Label>
                </td>
                <td>    
                    <asp:DropDownList ID="DropDownListCountry" runat="server" 
                        DataSourceID="SqlDataSourcePaises" DataTextField="pais" 
                        DataValueField="pais">
                        <asp:ListItem Value="null">Seleccione...</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcePaises" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [paises]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator id="RequiredFieldValidatorCountry" runat="server"
                        ControlToValidate="DropDownListCountry"
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" Text="Seleccione ciudad" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListCities" runat="server" 
                        DataSourceID="SqlDataSourceCiudad" DataTextField="ciudad" 
                        DataValueField="ciudad">
                        <asp:ListItem Value="null">Seleccione...</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCiudad" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [id_ciudad], [ciudad], [region], [id_pais] FROM [ciudades]">
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                        ControlToValidate="DropDownListCountry"
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" Text="Seleccione Precio" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxCost" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="RequiredFieldValidatorCost" runat="server"
                        ControlToValidate="TextBoxCost"
                        ErrorMessage="Debe diligenciar un valor"
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Button ID="Button2" Text="Buscar" runat="server"/>
                </td>
            </tr>
        </table>
    </form>
    

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
        SelectCommand=
        "SELECT [pais], [ciudad], [nombre], [costo_noche], [costo_persona] FROM [HotelesCostos]"></asp:SqlDataSource>
    <asp:ObjectDataSource ID="act8_u3_db" runat="server"></asp:ObjectDataSource>
    <asp:Label Text="Encontrar Hoteles por Precio"></asp:Label>
</asp:Content>
