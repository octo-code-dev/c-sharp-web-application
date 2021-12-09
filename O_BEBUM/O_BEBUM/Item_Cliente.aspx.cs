using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace O_BEBUM
{
    public partial class ITEM_CLIENTE : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            label_nome_cliente.Text = Context.User.Identity.Name;
        }



        protected void GridViewITEM_CLIENTE_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (GridViewITEM_CLIENTE.SelectedIndex > -1)
            {

                TB_ITEM TB_ITEM;
                int id = int.Parse(GridViewITEM_CLIENTE.Rows[GridViewITEM_CLIENTE.SelectedIndex].Cells[0].Text);
                O_BEBUMEntities entidades = new O_BEBUMEntities();
                TB_ITEM = entidades.TB_ITEM.SingleOrDefault(i => i.ITEM_ID == id);

                List<TB_ITEM> lista = (List<TB_ITEM>)Session["TB_ITEM"];

                if (lista != null)
                {
                    lista.Add(TB_ITEM);
                }
                else
                {
                    lista = new List<TB_ITEM>();
                    lista.Add(TB_ITEM);
                }

                Session["TB_ITEM"] = lista;


                TextBox textbox = (TextBox)GridViewITEM_CLIENTE.Rows[GridViewITEM_CLIENTE.SelectedIndex].Cells[6].FindControl("TextBox1_quantidade_item");

                int quantidade_item = int.Parse(textbox.Text);

                List<int> lista_quantidade_item = (List<int>)Session["itep_qtdite"];

                if (lista_quantidade_item != null)
                {
                    lista_quantidade_item.Add(quantidade_item);
                }
                else
                {
                    lista_quantidade_item = new List<int>();
                    lista_quantidade_item.Add(quantidade_item);
                }

                Session["itep_qtdite"] = lista_quantidade_item;
            }
        }

        protected void Button_finalizar_compra_Click(object sender, EventArgs e)
        {
            Session["paga_id"] = DropDownListPAGA_ID.SelectedValue;
            Session["plpa_id"] = DropDownListPLPA_ID.SelectedValue;

            O_BEBUMEntities entidadespedido = new O_BEBUMEntities();
            TB_PEDIDO TB_PEDIDO = new TB_PEDIDO();
            TB_PESSOA TB_PESSOA = entidadespedido.TB_PESSOA.SingleOrDefault(p => p.PESS_NOME == label_nome_cliente.Text);
            List<TB_ITEM> lista = (List<TB_ITEM>)Session["TB_ITEM"];
            List<int> lista_quantidade_item = (List<int>)Session["itep_qtdite"];
            for (int i = 0; i <= lista.Count -1; i++)
            {
                String Para = TB_PESSOA.PESS_EMAIL;
                String Assunto = "Compras O BEBUM";
                String Mensagem = "Parabéns! Você acaba de comprar "+ lista_quantidade_item.ElementAt(i)+
                    " unidades do produto " + lista.ElementAt(i).ITEM_NOME +
                    ". Para mais informações entre em contato conosco no email " +
                    "aula.dsw@gmail.com. Equipe O BEBUM.";
                Email.EnviarAutomatico(Para, Assunto, Mensagem);
            }

            Response.Redirect("Pedido.aspx");
        }

        protected void button_sair_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Home.aspx");
        }

    }
}