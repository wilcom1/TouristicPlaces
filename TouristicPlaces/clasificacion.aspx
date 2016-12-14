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
    &nbsp;&nbsp;<asp:DropDownList ID="DropCaracteristica" runat="server">
    </asp:DropDownList>
&nbsp;
    <asp:Button ID="BCaracteristica" runat="server" 
        Text="Buscar por Características " />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Buscar por especialidad del lugar."></asp:Label>

    &nbsp;<asp:DropDownList ID="Dropespecialidad" runat="server">
    </asp:DropDownList>
&nbsp;&nbsp;
    <asp:Button ID="BEspecialidad" runat="server" 
        Text="Buscar por Especialidades " />

    <br />
    <br />

        <asp:Label ID="textconsulta" runat="server"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridResultados" runat="server" Height="139px" 
                    style="text-align: center" Width="711px" CellPadding="4" 
                    ForeColor="#D8D8D8" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="id_lugar" 
                            DataNavigateUrlFormatString="~/reservas.aspx?id_lugar={0}" 
                            DataTextField="id_lugar" DataTextFormatString="Reservar Ahora" 
                            HeaderText="Reservar" />                        
                    </Columns>
                              
                    <EditRowStyle BackColor="#5D6D7E" />                                        
                    <FooterStyle BackColor="#848484" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#848484" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                       </asp:GridView>
    <br />
    <br />
    
    <br />
    <br />
        </asp:Content>
