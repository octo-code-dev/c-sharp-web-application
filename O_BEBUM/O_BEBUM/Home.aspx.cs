using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace O_BEBUM
{
    public partial class HOME : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button_entrar_Click(object sender, EventArgs e)
        {
            O_BEBUMEntities entidades = new O_BEBUMEntities();
            TB_PESSOA LOGIN = entidades.TB_PESSOA.SingleOrDefault(p => p.PESS_EMAIL == textbox_email.Text && p.PESS_SENHA == textbox_senha.Text);

            if (LOGIN != null)
            {
                FormsAuthentication.RedirectFromLoginPage(LOGIN.PESS_NOME, false);
            }
            else
            {
                label_retorno_login.Text = "Usuário e/ou senha inválidos!";
            }
        }
    }
}