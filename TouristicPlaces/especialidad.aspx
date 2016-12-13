<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="especialidad.aspx.vb" Inherits="TouristicPlaces.especialidad" %>


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
    <h2>HOTELES  POR ESPECIALIDADES</h2>
    <table class="style1">
        <tr>
            <td class="style4">
                Pais
                <asp:DropDownList ID="ddpaises" runat="server">
                </asp:DropDownList>
            </td>
            <td class="style4">
                ciudad<asp:DropDownList ID="ddciudades1" runat="server">
                </asp:DropDownList>
            </td>
            <td class="style3">
                Especialidad 
                <asp:DropDownList ID="ddespecialidad" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Button ID="btnBuscarXPais" runat="server" Text="Buscar por Pais" />
            </td>
            <td class="style4">
                <asp:Button ID="btnBuscarXCiudad" runat="server" Text="Buscar por Ciudad" />
            </td>
            <td class="style3">
                <asp:Button ID="btnBuscarXEspecialidad" runat="server" 
                    Text="Buscar por especialidad" />
            </td>
        </tr>
        <tr>
            <td class="style4" colspan="3">
                <asp:Label ID="lblPaisOCiudad" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="3">
                <asp:GridView ID="dgvResultados1" runat="server" Height="98px" 
                    style="text-align: center" Width="883px" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">

                   

                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="id_lugar" 
                            DataNavigateUrlFormatString="~/reservas.aspx?id_lugar={0}" 
                            DataTextField="id_lugar" DataTextFormatString="Reserva YA" 
                            HeaderText="Reservar" />
                        <asp:BoundField DataField="nombre" HeaderText="nombre" />
                        <asp:BoundField DataField="direccion" HeaderText="direccion" />
                        <asp:BoundField DataField="telefono" HeaderText="telefono" />
                        <asp:BoundField DataField="pagina_web" HeaderText="pagina_web" />
                        <asp:BoundField DataField="email" HeaderText="email" />
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:SqlDataSource ID="conexionlugares" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:cadenaderelaciones %>" 
                            SelectCommand="SELECT [id_lugar], [id_especialidad], [tipo_lugar], [nombre], [direccion], [telefono], [pagina_web], [email], [clasificacion] FROM [lugares] WHERE (([id_especialidad] = @id_especialidad) AND ([id_ciudad] = @id_ciudad))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddespecialidad" Name="id_especialidad" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="ddciudades1" Name="id_ciudad" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>