<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inserir_Noticia.aspx.cs" Inherits="O_BEBUM.Inserir_Noticia" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="hyperlink2" runat="server" NavigateUrl="~/ITEM_CLIENTE.aspx">Produtos Cliente</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ITEM_FUNCIONARIO.aspx">Produtos Funcionários</asp:HyperLink>
            <asp:HyperLink ID="hyperlink4" runat="server" NavigateUrl="~/CLIENTE.aspx">Clientes</asp:HyperLink>
            <asp:HyperLink ID="hyperlink5" runat="server" NavigateUrl="~/PAGAMENTO.aspx">Formas de Pagamento</asp:HyperLink>
            <asp:HyperLink ID="hyperlink6" runat="server" NavigateUrl="~/PLANO_PAGAMENTO.aspx">Planos de Pagamento</asp:HyperLink>
            <asp:Label ID="label_nome_cliente" runat="server" Text=""></asp:Label>
            <asp:Button ID="button_sair" runat="server" CssClass="btn btn-sm btn-primary" Text="Sair" OnClick="button_sair_Click" />
            <p>
                <asp:Label ID="Label1" runat="server" Text="Título"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label2" runat="server" Text="Subtítulo"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </p>
            <p>
                <textarea id="TextArea1" cols="20" rows="2"></textarea>
            </p>
        </div>
    </form>
</body>
</html>
