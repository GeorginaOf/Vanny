<%@ Page Title="" Language="C#" MasterPageFile="~/Vanny.Master" AutoEventWireup="true" CodeBehind="Agenda.aspx.cs" Inherits="Vanny.Agenda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>Agenda</h2>
        <hr />
        <ul class="list-group">
            <li class="list-group-item">Calendari</li>
            <li class="list-group-item">Afegir, eliminar, modificar cites</li>
            <li class="list-group-item">...</li>
        </ul>
        <hr />

     

        <%--<h4>
                <asp:LoginName ID="LoginName2" runat="server" Font-Bold="true" />
            </h4>
            <br />
            <asp:LoginStatus ID="LoginStatus2" runat="server" CssClass="btn btn-warning" />--%>
    </div>

</asp:Content>
