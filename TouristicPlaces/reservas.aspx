<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="reservas.aspx.vb" Inherits="TouristicPlaces.reservas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Reservas</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {            text-align: center;
        }
        .style3
        {
            text-align: center;
            width: 235px;
        }
        .style4
        {
            text-align: center;
            font-weight: 700;
        }
        .style5
        {
            width: 350px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Reservas</h2>
   <table class="style1">
            <tr>
                <td class="style4" colspan="3">
                    Registro de Reservacion</td>
            </tr>
            <tr>
                <td class="style5">
                    ID de Usuario</td>
                <td class="style3">
                    <asp:TextBox ID="tbUserID" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="tbUserID" ErrorMessage="id de usuario es requerido"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Codigo del Sitio</td>
                <td class="style3">
                    <asp:TextBox ID="tblugarID" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tblugarID" ErrorMessage="codigo del sitio es requerido"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Fecha Entrada</td>
                <td class="style3">
                    &nbsp;&nbsp;
                    <asp:Calendar ID="calCheckIN" runat="server" BackColor="White" 
                        BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                        Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="136px" 
                        style="text-align: center" Width="228px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    Fecha Salida</td>
                <td class="style3">
                    <asp:Calendar ID="calCheckOUT" runat="server" Height="136px"></asp:Calendar>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                    Numero de personas</td>
                <td class="style3">
                    <asp:TextBox ID="tbNumPersonas" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="tbNumPersonas" 
                        ErrorMessage="el numero de personas es requerido"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="tbNumPersonas" ErrorMessage="Enteros positivos unicamente" 
                        ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="3">
                    <asp:Button ID="btnReservar" runat="server" Text="Reservar" />
&nbsp;&nbsp;
                    <input id="Reset1" type="reset" value="reset" /></td>
            </tr>
        </table>
</asp:Content>
