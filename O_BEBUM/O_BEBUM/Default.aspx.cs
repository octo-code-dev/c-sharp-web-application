using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace O_BEBUM
{
    public partial class LOGADO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            label_nome_cliente.Text = Context.User.Identity.Name;
        }

        protected void button_sair_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("HOME.aspx");
        }
    }
}