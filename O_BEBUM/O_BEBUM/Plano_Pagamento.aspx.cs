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
    public partial class PLANO_PAGAMENTO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            label_nome_cliente.Text = Context.User.Identity.Name;
        }

        protected void button_inserir_plano_pagamento_Click(object sender, EventArgs e)
        {
            try
            {
                TB_PLPAGA TB_PLPAGA = new TB_PLPAGA();
                TB_PLPAGA.PLPA_NOME = textbox_plpa_nome.Text;

                O_BEBUMEntities entidades = new O_BEBUMEntities();
                entidades.TB_PLPAGA.Add(TB_PLPAGA);
                entidades.SaveChanges();
                Page.Response.Redirect(Request.RawUrl);
            }
            catch (DbEntityValidationException ex)
            {
                foreach (DbEntityValidationResult item in ex.EntityValidationErrors)
                {
                    DbEntityEntry entry = item.Entry;
                    string entityTypeName = entry.Entity.GetType().Name;

                    foreach (DbValidationError subItem in item.ValidationErrors)
                    {
                        string erro = string.Format("{0}.{1}: {2}", entityTypeName, subItem.PropertyName, subItem.ErrorMessage);
                        label_retorno.Text = erro;
                    }
                }
            }

        }

        protected void button_atualizar_plano_pagamento_Click(object sender, EventArgs e)
        {
            try
            {
                TB_PLPAGA TB_PLPAGA;
                int id = int.Parse(GridViewPLANO_PAGAMENTO.Rows[GridViewPLANO_PAGAMENTO.SelectedIndex].Cells[0].Text);

                O_BEBUMEntities entidades = new O_BEBUMEntities();
                TB_PLPAGA = entidades.TB_PLPAGA.SingleOrDefault(p => p.PLPA_ID == id);
                TB_PLPAGA.PLPA_NOME = textbox_plpa_nome.Text;
                entidades.SaveChanges();
                Page.Response.Redirect(Request.RawUrl);
            }
            catch (DbEntityValidationException ex)
            {
                foreach (DbEntityValidationResult item in ex.EntityValidationErrors)
                {
                    DbEntityEntry entry = item.Entry;
                    string entityTypeName = entry.Entity.GetType().Name;

                    foreach (DbValidationError subItem in item.ValidationErrors)
                    {
                        string erro = string.Format("{0}.{1}: {2}", entityTypeName, subItem.PropertyName, subItem.ErrorMessage);
                        label_retorno.Text = erro;
                    }
                }
            }
        }

        protected void button_remover_plano_pagamento_Click(object sender, EventArgs e)
        {
            try
            {
                TB_PLPAGA TB_PLPAGA;
                int id = int.Parse(GridViewPLANO_PAGAMENTO.Rows[GridViewPLANO_PAGAMENTO.SelectedIndex].Cells[0].Text);

                O_BEBUMEntities entidades = new O_BEBUMEntities();
                TB_PLPAGA = entidades.TB_PLPAGA.SingleOrDefault(p => p.PLPA_ID == id);
                entidades.TB_PLPAGA.Remove(TB_PLPAGA);
                entidades.SaveChanges();
                Page.Response.Redirect(Request.RawUrl);
            }
            catch (DbEntityValidationException ex)
            {
                foreach (DbEntityValidationResult item in ex.EntityValidationErrors)
                {
                    DbEntityEntry entry = item.Entry;
                    string entityTypeName = entry.Entity.GetType().Name;

                    foreach (DbValidationError subItem in item.ValidationErrors)
                    {
                        string erro = string.Format("{0}.{1}: {2}", entityTypeName, subItem.PropertyName, subItem.ErrorMessage);
                        label_retorno.Text = erro;
                    }
                }
            }
        }

        protected void GridViewPLANO_PAGAMENTO_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                TB_PLPAGA TB_PLPAGA = new TB_PLPAGA();
                int id = int.Parse(GridViewPLANO_PAGAMENTO.Rows[GridViewPLANO_PAGAMENTO.SelectedIndex].Cells[0].Text);
                O_BEBUMEntities entidades = new O_BEBUMEntities();
                TB_PLPAGA = entidades.TB_PLPAGA.SingleOrDefault(p => p.PLPA_ID == id);
                textbox_plpa_nome.Text = TB_PLPAGA.PLPA_NOME;
            }
            catch (DbEntityValidationException ex)
            {
                foreach (DbEntityValidationResult item in ex.EntityValidationErrors)
                {
                    DbEntityEntry entry = item.Entry;
                    string entityTypeName = entry.Entity.GetType().Name;

                    foreach (DbValidationError subItem in item.ValidationErrors)
                    {
                        string erro = string.Format("{0}.{1}: {2}", entityTypeName, subItem.PropertyName, subItem.ErrorMessage);
                        label_retorno.Text = erro;
                    }
                }
            }
        }

        protected void button_sair_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("HOME.aspx");
        }
    }
}