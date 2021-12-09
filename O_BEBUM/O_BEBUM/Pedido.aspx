<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pedido.aspx.cs" Inherits="O_BEBUM.PEDIDO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>O Bebum - Pedido</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="theme.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    <link href="css/estilos.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <!-- Menu -->
    <form id="form1" runat="server">
        <nav class="navbar navbar-default navbar-fixed-top" id="menu">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <asp:HyperLink ID="hyperlink1" runat="server" NavigateUrl="~/Default.aspx" CssClass="navbar-brand">
                        <span class="tituloSite">O Bebum</span>
                    </asp:HyperLink>

                    </a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <asp:HyperLink ID="hyperlink2" runat="server" NavigateUrl="~/ITEM_CLIENTE.aspx">Produtos Cliente</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ITEM_FUNCIONARIO.aspx">Produtos Funcionários</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="hyperlink4" runat="server" NavigateUrl="~/CLIENTE.aspx">Clientes</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="hyperlink5" runat="server" NavigateUrl="~/PAGAMENTO.aspx">Formas de Pagamento</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="hyperlink6" runat="server" NavigateUrl="~/PLANO_PAGAMENTO.aspx">Planos de Pagamento</asp:HyperLink></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <asp:Label ID="label_nome_cliente" runat="server" Text=""></asp:Label>

                        </li>


                        <li>
                            <asp:Button ID="button_sair" runat="server" CssClass="btn btn-sm btn-primary" Text="Sair" OnClick="button_sair_Click" />
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- fim do menu -->

        <section id="conteudo" class="col-md-12">
            <article>
                <div id="relatorios" class="panel">

                    <div class="panel-heading">
                        <h2 class="text-center">Pedidos</h2>
                    </div>
                    <div class="panel-body">
                        <p>
                            <asp:GridView ID="GridViewPEDIDOS" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="ITEP_ID" OnSelectedIndexChanged="GridViewPEDIDOS_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="ITEP_ID" HeaderText="Código" ReadOnly="True" SortExpression="ITEP_ID" />
                                    <asp:TemplateField HeaderText="Data" SortExpression="pedi_data">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TB_PEDIDO.PEDI_DATA") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Produto">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("TB_ITEM.ITEM_NOME") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ITEP_QTDITE" HeaderText="Quantidade" SortExpression="ITEP_QTDITE" />
                                    <asp:TemplateField HeaderText="Valor Unitário">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("TB_ITEM.ITEM_VALOR") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ITEP_VLRITE" HeaderText="Valor Total" SortExpression="ITEP_VLRITE" />
                                    <asp:TemplateField HeaderText="Forma de Pagamento">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSourcePAGA_ID" SelectedValue='<%# Bind("TB_PEDIDO.PAGA_ID") %>'>
                                            </asp:DropDownList>
                                            <asp:EntityDataSource ID="EntityDataSourcePAGA_ID" runat="server" ConnectionString="name=O_BEBUMEntities" DefaultContainerName="O_BEBUMEntities" EnableFlattening="False" EntitySetName="TB_PAGAME">
                                            </asp:EntityDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("TB_PEDIDO.TB_PAGAME.PAGA_NOME") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Parcelas">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="EntityDataSourcePLPA_ID" SelectedValue='<%# Bind("TB_PEDIDO.PLPA_ID") %>'>
                                            </asp:DropDownList>
                                            <asp:EntityDataSource ID="EntityDataSourcePLPA_ID" runat="server" ConnectionString="name=O_BEBUMEntities" DefaultContainerName="O_BEBUMEntities" EnableFlattening="False" EntitySetName="TB_PLPAGA">
                                            </asp:EntityDataSource>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("TB_PEDIDO.TB_PLPAGA.PLPA_NOME") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField SelectText="Remover" ShowSelectButton="True" />
                                </Columns>
                            </asp:GridView>
                            <asp:EntityDataSource ID="EntityDataSourceITEPED" runat="server" ConnectionString="name=O_BEBUMEntities" DefaultContainerName="O_BEBUMEntities" EnableFlattening="False" EntitySetName="TB_ITEPED" Include="">
                            </asp:EntityDataSource>
                        </p>

                        <p>
                            <asp:Label ID="label_retorno" runat="server" Text=""></asp:Label>
                        </p>
                    </div>


                </div>

            </article>
        </section>


        </div>
        <!-- /container -->


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="js/mask/jquery.mask.js" type="text/javascript"></script>
        <script src="js/jquery.validate.js" type="text/javascript"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

    </form>

</body>
</html>



