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
            width: 469px;
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
            <td class="style2" colspan="2">
                <asp:GridView ID="dgvResultados" runat="server" Height="139px" 
                    style="text-align: center" Width="934px">
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
