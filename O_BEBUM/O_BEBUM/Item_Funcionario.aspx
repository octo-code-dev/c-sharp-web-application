<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Item_Funcionario.aspx.cs" Inherits="O_BEBUM.ITEM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>O Bebum - Produtos</title>

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
                            <asp:Button ID="button1" runat="server" CssClass="btn btn-sm btn-primary" Text="Sair" OnClick="button_sair_Click" />
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
                        <h2 class="text-center">Cadastro de Produtos</h2>
                    </div>
                    <div class="panel-body">
                        <div class=" col-md-4 col-md-offset-2">
                            <div class="input-group">
                                <asp:Label ID="label_item_nome" CssClass="input-group-addon" runat="server" Text="Nome: "></asp:Label>
                                <asp:TextBox ID="textbox_item_nome" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br>
                            <div class="input-group">
                                <asp:Label ID="label_item_valor" CssClass="input-group-addon" runat="server" Text="Valor: "></asp:Label>
                                <asp:TextBox ID="textbox_item_valor" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br>
                            <div class="input-group">
                                <asp:Label ID="label_item_peralc" CssClass="input-group-addon" runat="server" Text="Álcool (%): "></asp:Label>
                                <asp:TextBox ID="textbox_item_peralc" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br>
                        </div>


                        <div class=" col-md-4">
                            <div class="input-group">
                                <asp:Label ID="label_item_unmedi" CssClass="input-group-addon" runat="server" Text="Un. Medida: "></asp:Label>
                                <asp:TextBox ID="textbox_item_unmedi" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br>
                            <div class="input-group">
                                <asp:Label ID="label_item_estoqu" CssClass="input-group-addon" runat="server" Text="Estoque: "></asp:Label>
                                <asp:TextBox ID="textbox_item_estoqu" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br>

                            <asp:Label ID="label_retorno" runat="server" Text=""></asp:Label>
                        </div>
                        <br />
                        <div>
                            <div class="col-md-12 text-center">
                                <asp:Button ID="button_inserir_item" runat="server" CssClass="btn btn-lg btn-primary col-md-2 col-md-offset-2" Text="Inserir" OnClick="button_inserir_item_Click" />
                                <asp:Button ID="button_atualizar_item" runat="server" CssClass="btn btn-lg btn-warning col-md-2 col-md-offset-1" Text="Atualizar" OnClick="button_atualizar_item_Click" />
                                <asp:Button ID="button_remover_item" runat="server" CssClass="btn btn-lg btn-danger col-md-2 col-md-offset-1" Text="Remover" OnClick="button_remover_item_Click" />
                            </div>
                        </div>

                        <br />
                        <br />

                        <p>
                            <asp:GridView ID="GridViewITEM" runat="server" DataSourceID="EntityDataSourceITEM" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" OnSelectedIndexChanged="GridViewITEM_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="ITEM_ID" HeaderText="Código" SortExpression="ITEM_ID" />
                                    <asp:BoundField DataField="ITEM_NOME" HeaderText="Nome" SortExpression="ITEM_NOME" />
                                    <asp:BoundField DataField="ITEM_VALOR" HeaderText="Valor" SortExpression="ITEM_VALOR" />
                                    <asp:BoundField DataField="ITEM_PERALC" HeaderText="Valor Alcoólico (%)" SortExpression="ITEM_PERALC" />
                                    <asp:BoundField DataField="ITEM_UNMEDI" HeaderText="Unidade de Medida" SortExpression="ITEM_UNMEDI" />
                                    <asp:BoundField DataField="ITEM_ESTOQU" HeaderText="Quantidade em Estoque" SortExpression="ITEM_ESTOQU" />
                                    <asp:CommandField ShowSelectButton="True" HeaderText="Selecionar" SelectText="Selecionar" />
                                </Columns>
                            </asp:GridView>
                            <asp:EntityDataSource ID="EntityDataSourceITEM" runat="server" ConnectionString="name=O_BEBUMEntities" DefaultContainerName="O_BEBUMEntities" EnableFlattening="False" EntitySetName="TB_ITEM">
                            </asp:EntityDataSource>
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
