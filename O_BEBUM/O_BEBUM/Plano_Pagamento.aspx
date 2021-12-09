<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Plano_Pagamento.aspx.cs" Inherits="O_BEBUM.PLANO_PAGAMENTO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>O Bebum - Pagamento</title>

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
    <form id="form2" runat="server">
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
                            <asp:Button ID="button1" runat="server" CssClass="btn btn-sm btn-primary" Text="Sair" OnClick="button_sair_Click" />
                        </li>

                        <!--<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Login <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Consumidor</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Administração</a></li>
                        </ul>
                    </li>-->
                    </ul>
                </div>
            </div>
        </nav>

        <!-- fim do menu -->



        <section id="conteudo" class="col-md-12">
            <article>
                <div id="relatorios" class="panel">

                    <div class="panel-heading">
                        <h2 class="text-center">Cadastro de Planos de Pagamento</h2>
                    </div>
                    <div class="panel-body">
                        <div class=" col-md-4 col-md-offset-4">
                            <div class="input-group">
                                <asp:Label ID="label_plpa_nome" CssClass="input-group-addon" runat="server" Text="Nome: "></asp:Label>
                                <asp:TextBox ID="textbox_plpa_nome" CssClass="form-control" runat="server"></asp:TextBox>

                            </div>
                            <br>
                        </div>

                        <br />
                        <div>
                            <div class="col-md-12 text-center">
                                <asp:Button ID="button_inserir_plano_pagamento" CssClass="btn btn-lg btn-primary col-md-2 col-md-offset-2" runat="server" Text="Inserir" OnClick="button_inserir_plano_pagamento_Click" />
                                <asp:Button ID="button_atualizar_plano_pagamento" CssClass="btn btn-lg btn-warning col-md-2 col-md-offset-1" runat="server" Text="Atualizar" OnClick="button_atualizar_plano_pagamento_Click" />
                                <asp:Button ID="button_remover_plano_pagamento" CssClass="btn btn-lg btn-danger col-md-2 col-md-offset-1" runat="server" Text="Remover" OnClick="button_remover_plano_pagamento_Click" />
                            </div>
                        </div>

                        <br />
                        <br />

                        <p>
                            <asp:GridView ID="GridViewPLANO_PAGAMENTO" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSourcePLANO_PAGAMENTO" OnSelectedIndexChanged="GridViewPLANO_PAGAMENTO_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="PLPA_ID" HeaderText="Código" ReadOnly="True" SortExpression="PLPA_ID" />
                                    <asp:BoundField DataField="PLPA_NOME" HeaderText="Nome" ReadOnly="True" SortExpression="PLPA_NOME" />
                                    <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                                </Columns>
                            </asp:GridView>
                            <asp:EntityDataSource ID="EntityDataSourcePLANO_PAGAMENTO" runat="server" ConnectionString="name=O_BEBUMEntities" DefaultContainerName="O_BEBUMEntities" EnableFlattening="False" EntitySetName="TB_PLPAGA" Select="it.[PLPA_ID], it.[PLPA_NOME]">
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
