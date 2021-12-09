using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Validation;
using System.Data.Entity.Infrastructure;
using System.Web.Security;

namespace O_BEBUM
{
    public partial class PEDIDO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            label_nome_cliente.Text = Context.User.Identity.Name;

            TB_PEDIDO TB_PEDIDO = new TB_PEDIDO();
            O_BEBUMEntities entidadespedido = new O_BEBUMEntities();
            DateTime data = DateTime.Now;
            TB_PESSOA TB_PESSOA = entidadespedido.TB_PESSOA.SingleOrDefault(p => p.PESS_NOME == label_nome_cliente.Text);
            int pess_id = TB_PESSOA.PESS_ID;


            TB_PEDIDO.PEDI_DATA = data;
            TB_PEDIDO.PESS_ID = pess_id;
            if (Session["paga_id"] != null)
            {
                TB_PEDIDO.PAGA_ID = int.Parse(Session["paga_id"].ToString());
            }
            if (Session["plpa_id"] != null)
            {
                TB_PEDIDO.PLPA_ID = int.Parse(Session["plpa_id"].ToString());
            }


            entidadespedido.TB_PEDIDO.Add(TB_PEDIDO);
            if (Session["paga_id"] != null && Session["plpa_id"] != null)
            {
                entidadespedido.SaveChanges();
            }


            Decimal ITEP_VLRPED = 0;

            List<TB_ITEM> lista = (List<TB_ITEM>)Session["TB_ITEM"];
            List<int> lista_quantidade_item = (List<int>)Session["itep_qtdite"];
            int i = 0;
            if (Session["itep_qtdite"] != null)
            {


                for (i = 0; i <= lista.Count - 1; i++)
                {
                    TB_ITEM TB_ITEM = lista.ElementAt(i);
                    TB_ITEPED TB_ITEPED = new TB_ITEPED();
                    TB_ITEPED.ITEP_QTDITE = int.Parse(lista_quantidade_item.ElementAt(i).ToString());
                    TB_ITEPED.ITEP_VLRITE = TB_ITEPED.ITEP_QTDITE * TB_ITEM.ITEM_VALOR;
                    ITEP_VLRPED = ITEP_VLRPED + TB_ITEM.ITEM_VALOR;
                    TB_ITEPED.ITEP_VLRPED = ITEP_VLRPED;
                    TB_ITEPED.ITEM_ID = TB_ITEM.ITEM_ID;
                    TB_ITEPED.PEDI_ID = TB_PEDIDO.PEDI_ID;
                    O_BEBUMEntities entidadesiteped = new O_BEBUMEntities();
                    entidadesiteped.TB_ITEPED.Add(TB_ITEPED);
                    entidadesiteped.SaveChanges();
                    GridViewPEDIDOS.DataSource = entidadesiteped.TB_ITEPED.ToList();
                    GridViewPEDIDOS.DataBind();
                }

                for (i = 0; i <= lista.Count -1; i++)
                {
                    lista.RemoveAt(i);
                }
                for (i = 0; i <= lista_quantidade_item.Count - 1; i++)
                {
                    lista_quantidade_item.RemoveAt(i);
                }
                Session["paga_id"] = null;
                Session["plpa_id"] = null;
                Session["TB_ITEM"] = null;
                Session["itep_qtdite"] = null;
            }
            O_BEBUMEntities entidadesiteped2 = new O_BEBUMEntities();
            GridViewPEDIDOS.DataSource = entidadesiteped2.TB_ITEPED.ToList();
            GridViewPEDIDOS.DataBind();
        }
        protected void GridViewPEDIDOS_SelectedIndexChanged(object sender, EventArgs e)
        {
            TB_ITEPED TB_ITEPED;
            int id = int.Parse(GridViewPEDIDOS.Rows[GridViewPEDIDOS.SelectedIndex].Cells[0].Text);

            O_BEBUMEntities entidades = new O_BEBUMEntities();
            TB_ITEPED = entidades.TB_ITEPED.SingleOrDefault(p => p.ITEP_ID == id);
            entidades.TB_ITEPED.Remove(TB_ITEPED);
            entidades.SaveChanges();
            Page.Response.Redirect(Request.RawUrl);
        }

        protected void button_sair_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("HOME.aspx");
        }
    }
}