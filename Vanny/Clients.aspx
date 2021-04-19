<%@ Page Title="" Language="C#" MasterPageFile="~/Vanny.Master" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="Vanny.Clients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <div>
        <h2>Clients</h2>
        <hr />
        <ul class="list-group">
            <li class="list-group-item">Llista clients</li>
            <li class="list-group-item">Afegir, eliminar, modificar clients</li>
            <li class="list-group-item">...</li>
        </ul>
        <hr />
    </div>--%>


    <div id="contenido">
  
        <div class="panel panel-primary">
            <asp:Button runat="server" ID="nuevoCliente" CssClass="btn btn-primary" OnClick="nuevoCliente_Click" Text="Nuevo Cliente" />
            
            <div class="panel-heading">
                <h3 class="panel-title">Lista de Clientes</h3>
            </div>

            <asp:GridView ID="gridClientes" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="1051px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="idCli" HeaderText="#" />
                    <asp:BoundField DataField="nom" HeaderText="Nombre" />
                    <asp:BoundField DataField="nif" HeaderText="NIF" />
                    <asp:BoundField DataField="direccio" HeaderText="Dirección" />
                    <asp:BoundField DataField="poblacio" HeaderText="Población" />
                    <asp:BoundField DataField="provincia" HeaderText="Provincia" />
                    <asp:BoundField DataField="telefon" HeaderText="Teléfono" />
                    <asp:BoundField DataField="mobil" HeaderText="Móvil" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:ButtonField HeaderText="Editar" Text="Botón" />
                    <asp:ButtonField HeaderText="Eliminar" Text="Botón" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
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

        </div>
    </div>

</asp:Content>
