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
    public partial class PAGAMENTO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            label_nome_cliente.Text = Context.User.Identity.Name;
        }

        protected void button_inserir_pagamento_Click(object sender, EventArgs e)
        {
            try
            {
                TB_PAGAME TB_PAGAME = new TB_PAGAME();
                TB_PAGAME.PAGA_NOME = textbox_paga_nome.Text;

                O_BEBUMEntities entidades = new O_BEBUMEntities();
                entidades.TB_PAGAME.Add(TB_PAGAME);
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

        protected void button_atualizar_pagamento_Click(object sender, EventArgs e)
        {
            try
            { 
            TB_PAGAME TB_PAGAME;
            int id = int.Parse(GridViewPAGAMENTO.Rows[GridViewPAGAMENTO.SelectedIndex].Cells[0].Text);

            O_BEBUMEntities entidades = new O_BEBUMEntities();
            TB_PAGAME = entidades.TB_PAGAME.SingleOrDefault(p => p.PAGA_ID == id);
            TB_PAGAME.PAGA_NOME = textbox_paga_nome.Text;
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

        protected void button_remover_pagamento_Click(object sender, EventArgs e)
        {
            try
            {
                TB_PAGAME TB_PAGAME;
                int id = int.Parse(GridViewPAGAMENTO.Rows[GridViewPAGAMENTO.SelectedIndex].Cells[0].Text);

                O_BEBUMEntities entidades = new O_BEBUMEntities();
                TB_PAGAME = entidades.TB_PAGAME.SingleOrDefault(p => p.PAGA_ID == id);
                entidades.TB_PAGAME.Remove(TB_PAGAME);
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                TB_PAGAME TB_PAGAME = new TB_PAGAME();
                int id = int.Parse(GridViewPAGAMENTO.Rows[GridViewPAGAMENTO.SelectedIndex].Cells[0].Text);
                O_BEBUMEntities entidades = new O_BEBUMEntities();
                TB_PAGAME = entidades.TB_PAGAME.SingleOrDefault(p => p.PAGA_ID == id);
                textbox_paga_nome.Text = TB_PAGAME.PAGA_NOME;
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