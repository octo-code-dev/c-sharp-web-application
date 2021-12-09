L<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="O_BEBUM.PESSOA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>O Bebum - Clientes</title>

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
                        <h2 class="text-center">Cadastro de Clientes</h2>
                    </div>
                    <div class="panel-body">
                        <div class=" col-md-4 col-md-offset-2">
                            <div class="input-group">
                                <asp:Label ID="label_pess_nome" CssClass="input-group-addon" runat="server" Text="Nome: "></asp:Label>
                                <asp:TextBox ID="textbox_pess_nome" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_pess_dtnasc" CssClass="input-group-addon" runat="server" Text="Data de Nascimento: "></asp:Label>
                                <asp:TextBox ID="textbox_pess_dtnasc" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_pess_cpf" CssClass="input-group-addon" runat="server" Text="CPF: "></asp:Label>
                                <asp:TextBox ID="textbox_pess_cpf" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_pess_email" CssClass="input-group-addon" runat="server" Text="E-mail: "></asp:Label>
                                <asp:TextBox ID="textbox_pess_email" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_pess_senha" CssClass="input-group-addon" runat="server" Text="Senha: "></asp:Label>
                                <asp:TextBox ID="textbox_pess_senha" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_pess_fone" CssClass="input-group-addon" runat="server" Text="Telefone: "></asp:Label>
                                <asp:TextBox ID="textbox_pess_fone" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_ende_lograd" CssClass="input-group-addon" runat="server" Text="Logradouro: "></asp:Label>
                                <asp:TextBox ID="textbox_ende_lograd" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                        </div>


                        <div class=" col-md-4">
                            
                            <div class="input-group">
                                <asp:Label ID="label_ende_numero" CssClass="input-group-addon" runat="server" Text="Número: "></asp:Label>
                                <asp:TextBox ID="textbox_ende_numero" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_ende_cep" CssClass="input-group-addon" runat="server" Text="CEP: "></asp:Label>
                                <asp:TextBox ID="textbox_ende_cep" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_ende_comple" CssClass="input-group-addon" runat="server" Text="Complemento: "></asp:Label>
                                <asp:TextBox ID="textbox_ende_comple" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_ende_bairro" CssClass="input-group-addon" runat="server" Text="Bairro: "></asp:Label>
                                <asp:TextBox ID="textbox_ende_bairro" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_ende_cidade" CssClass="input-group-addon" runat="server" Text="Cidade: "></asp:Label>
                                <asp:TextBox ID="textbox_ende_cidade" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_ende_estado" CssClass="input-group-addon" runat="server" Text="Estado: "></asp:Label>
                                <asp:TextBox ID="textbox_ende_estado" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />
                            <div class="input-group">
                                <asp:Label ID="label_ende_refere" CssClass="input-group-addon" runat="server" Text="Referência: "></asp:Label>
                                <asp:TextBox ID="textbox_ende_refere" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <br />

                            <asp:Label ID="label2" runat="server" Text=""></asp:Label>
                        </div>
                        <br />
                        <div>
                            <div class="col-md-12 text-center">
                                <asp:Button ID="button_inserir_pessoa" CssClass="btn btn-lg btn-primary col-md-2 col-md-offset-2" runat="server" Text="Inserir" OnClick="button_inserir_pessoa_Click" />
                                <asp:Button ID="button_atualizar_pessoa" CssClass="btn btn-lg btn-warning col-md-2 col-md-offset-1" runat="server" Text="Atualizar" OnClick="button_atualizar_pessoa_Click" />
                                <asp:Button ID="button_remover_pessoa" CssClass="btn btn-lg btn-danger col-md-2 col-md-offset-1" runat="server" Text="Remover" OnClick="button_remover_pessoa_Click" />
                            </div>
                        </div>

                        <br />
                        <br />

                        <p>
                            <asp:GridView ID="GridViewPESSOA" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="PESS_ID" DataSourceID="EntityDataSourcePESSOA" OnSelectedIndexChanged="GridViewPESSOA_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="PESS_ID" HeaderText="Código" ReadOnly="True" SortExpression="PESS_ID" />
                                    <asp:BoundField DataField="PESS_NOME" HeaderText="Nome Completo" SortExpression="PESS_NOME" />
                                    <asp:BoundField DataField="PESS_DTNASC" HeaderText="Data de Nascimento" SortExpression="PESS_DTNASC" />
                                    <asp:BoundField DataField="PESS_CPF" HeaderText="CPF" SortExpression="PESS_CPF" />
                                    <asp:BoundField DataField="PESS_EMAIL" HeaderText="E-mail" SortExpression="PESS_EMAIL" />
                                    <asp:BoundField DataField="PESS_SENHA" HeaderText="Senha" SortExpression="PESS_SENHA" />
                                    <asp:BoundField DataField="PESS_FONE" HeaderText="Telefone" SortExpression="PESS_FONE" />
                                    <asp:BoundField DataField="PESS_TIPO" HeaderText="Tipo" SortExpression="PESS_TIPO" />
                                    <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                                </Columns>
                            </asp:GridView>
                            <asp:EntityDataSource ID="EntityDataSource1" runat="server">
                            </asp:EntityDataSource>
                            <asp:EntityDataSource ID="EntityDataSourcePESSOA" runat="server" ConnectionString="name=O_BEBUMEntities" DefaultContainerName="O_BEBUMEntities" EnableFlattening="False" EntitySetName="TB_PESSOA">
                            </asp:EntityDataSource>
                        </p>
                        <p>
                            <asp:GridView ID="GridViewENDERECO" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="ENDE_ID" DataSourceID="EntityDataSourceENDERECO" OnSelectedIndexChanged="GridViewENDERECO_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="ENDE_ID" HeaderText="Código" ReadOnly="True" SortExpression="ENDE_ID" />
                                    <asp:BoundField DataField="PESS_ID" HeaderText="Código do Cliente" SortExpression="PESS_ID" />
                                    <asp:BoundField DataField="ENDE_LOGRAD" HeaderText="Logradouro" SortExpression="ENDE_LOGRAD" />
                                    <asp:BoundField DataField="ENDE_NUMERO" HeaderText="Número" SortExpression="ENDE_NUMERO" />
                                    <asp:BoundField DataField="ENDE_CEP" HeaderText="CEP" SortExpression="ENDE_CEP" />
                                    <asp:BoundField DataField="ENDE_COMPLE" HeaderText="Complemento" SortExpression="ENDE_COMPLE" />
                                    <asp:BoundField DataField="ENDE_BAIRRO" HeaderText="Bairro" SortExpression="ENDE_BAIRRO" />
                                    <asp:BoundField DataField="ENDE_CIDADE" HeaderText="Cidade" SortExpression="ENDE_CIDADE" />
                                    <asp:BoundField DataField="ENDE_ESTADO" HeaderText="Estado" SortExpression="ENDE_ESTADO" />
                                    <asp:BoundField DataField="ENDE_REFERE" HeaderText="Referência" SortExpression="ENDE_REFERE" />
                                    <asp:CommandField SelectText="Selecionar" ShowSelectButton="True" />
                                </Columns>
                            </asp:GridView>
                            <asp:EntityDataSource ID="EntityDataSourceENDERECO" runat="server" ConnectionString="name=O_BEBUMEntities" DefaultContainerName="O_BEBUMEntities" EnableFlattening="False" EntitySetName="TB_ENDERE">
                            </asp:EntityDataSource>
                        </p>
                        <p>

                            <asp:Label ID="label_retorno" runat="server" Text=""></asp:Label>

                        </p>


                    </div>


                </div>

            </article>
        </section>



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
