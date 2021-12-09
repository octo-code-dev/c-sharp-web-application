<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="O_BEBUM.LOGADO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>O Bebum</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Bootstrap theme -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet"/>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="theme.css" rel="stylesheet"/>

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
                    <asp:HyperLink ID="hyperlink_home" runat="server" NavigateUrl="~/Default.aspx" CssClass="navbar-brand">
                        <span class="tituloSite">Store</span>
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
                            <asp:Button ID="button_sair" runat="server" CssClass="btn btn-sm btn-primary" Text="Sair"  OnClick="button_sair_Click" />
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

    </form>
    <!-- fim do menu -->


    <section id="conteudo" class="col-md-12">
        <article>






            <div id="ultimaNoticia" class="panel">
                <ul class="media-list noticias">
                    <li class="media">
                        <a href="#">
                            <div class="media-left">

                                <img class="media-object" src="img/Noticias/3.png" alt="Desc">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">Notícias</h4>
                                Descrição de 150 caracteres.....
                            </div>
                        </a>
                    </li>
                </ul>

            </div>
            <div id="produtos">
                <div class="menuProdutos col-md-2">
                    <div class="list-group">
                        <button type="button" class="list-group-item">Cras justo odio</button>
                        <button type="button" class="list-group-item">Dapibus ac facilisis in</button>
                        <button type="button" class="list-group-item">Morbi leo risus</button>
                        <button type="button" class="list-group-item">Porta ac consectetur ac</button>
                        <button type="button" class="list-group-item">Vestibulum at eros</button>
                    </div>
                </div>
                <div class="listaProdutos col-md-10">

                    <div class="row">
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <img src="img/Produtos/1.png" alt="...">
                                <div class="caption ItemDesc">
                                    <h3>MackBook</h3>
                                    <p>Descrição do produto</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <img src="img/Produtos/2.png" alt="...">
                                <div class="caption ItemDesc">
                                    <h3>iPhone</h3>
                                    <p>Descrição do produto</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <img src="img/Produtos/3.png" alt="...">
                                <div class="caption ItemDesc">
                                    <h3>iPad</h3>
                                    <p>Descrição do produto</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <img src="img/Produtos/4.png" alt="...">
                                <div class="caption ItemDesc">
                                    <h3>Moto G4</h3>
                                    <p>Descrição do produto</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <img src="img/Produtos/5.png" alt="...">
                                <div class="caption ItemDesc">
                                    <h3>Galaxy S5</h3>
                                    <p>Descrição do produto</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <img src="img/Produtos/6.png" alt="..." style="height:153px;">
                                <div class="caption ItemDesc">
                                    <h3>Surface Duo</h3>
                                    <p>Descrição do produto</p>
                                </div>
                            </div>
                        </div>


                    </div>

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
</body>
</html>
