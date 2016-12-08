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
                <asp:GridView ID="dgvResultados1" runat="server" Height="139px" 
                    style="text-align: center" Width="711px" CellPadding="4" 
                    ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <EmptyDataTemplate>
                        <asp:SqlDataSource ID="conexionlugares" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:cadenaderelaciones %>" 
                            SelectCommand="SELECT [id_especialidad], [id_lugar], [tipo_lugar], [nombre], [direccion], [telefono], [id_ciudad], [costo_persona], [pagina_web], [email], [costo_noche], [clasificacion] FROM [lugares] WHERE (([id_especialidad] = @id_especialidad) AND ([id_ciudad] = @id_ciudad))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddespecialidad" Name="id_especialidad" 
                                    PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="ddciudades1" Name="id_ciudad" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>