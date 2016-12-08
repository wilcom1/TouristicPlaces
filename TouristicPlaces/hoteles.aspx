<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="hoteles.aspx.vb" Inherits="TouristicPlaces.hoteles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Encontrar hotel por pais o ciudad</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            text-align: center;
        }
        .style4
        {
            text-align: center;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>hoteles</h2>
    <table class="style1">
        <tr>
            <td class="style4">
                Pais
                <asp:DropDownList ID="ddpaises" runat="server">
                </asp:DropDownList>
            </td>
            <td class="style3">
                ciudad
                <asp:DropDownList ID="ddciudades" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Button ID="btnBuscarXPais" runat="server" Text="Buscar por Pais" />
            </td>
            <td class="style3">
                <asp:Button ID="btnBuscarXCiudad" runat="server" Text="Buscar por Ciudad" />
            </td>
        </tr>
        <tr>
            <td class="style4" colspan="2">
                <asp:Label ID="lblPaisOCiudad" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:GridView ID="dgvResultados" runat="server" Height="139px" 
                    style="text-align: center" Width="934px" AutoGenerateColumns="false">
                    <Columns>
                            
                        <asp:HyperLinkField HeaderText="Reservar" DataTextField="id_lugar" DataNavigateUrlFields="id_lugar" DataTextFormatString="Reserva ahora" 
                             DataNavigateUrlFormatString="~/reservas.aspx?id_lugar={0}" 
                             />
                        <asp:BoundField DataField="nombre" HeaderText="nombre" />
                        <asp:BoundField DataField="www" HeaderText="www"/>
                        <asp:BoundField DataField="telefono" HeaderText="telefono" />
                        <asp:BoundField DataField="direccion" HeaderText="direccion"/>
                        <asp:BoundField DataField="ciudad" HeaderText="ciudad" />  
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
