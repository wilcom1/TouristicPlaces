<%@ Page Title="Página principal" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="TouristicPlaces._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 601px;
            font-size: large;
            color: #000099;
        }
        .style3
        {
            font-size: large;
            color: #000099;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        SITIOS TURÍSTICOS Y HOTELES</h2>
    <table class="style1">
        <tr>
            <td class="style2">
                <p>
                    Bienvenidos a nuestra pagina de sitios turisticos<br />
                    en esta pagina encontraras:</p>
                <p>
                    <br />
                    - hoteles y sitios turisticos<br />
                    - costos por lugar u hotel<br />
                    - especialidades y
                    <br />
                    - clasificacion</p>
                <p>
                    Tendras todo lo que necesitas para saber tu proximo destino en vacaciones<br />
                    <br />
                    Felices Vacaciones!!<br />
                </p>
            </td>
            <td class="style3">
                <p>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/homepage.png" 
                        Width="594px" />
                </p>
            </td>
        </tr>
    </table>
</asp:Content>
