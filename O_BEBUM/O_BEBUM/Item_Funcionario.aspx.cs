using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Data.Entity.Validation;
using System.Data.Entity.Infrastructure;
using System.Web.Security;

namespace O_BEBUM
{
    public partial class ITEM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            label_nome_cliente.Text = Context.User.Identity.Name;
        }
        protected void button_inserir_item_Click(object sender, EventArgs e)
        {
            try
            {
                TB_ITEM TB_ITEM = new TB_ITEM();
                TB_ITEM.ITEM_NOME = textbox_item_nome.Text;
                TB_ITEM.ITEM_VALOR = Decimal.Parse(textbox_item_valor.Text);
                TB_ITEM.ITEM_PERALC = Decimal.Parse(textbox_item_peralc.Text);
                TB_ITEM.ITEM_UNMEDI = textbox_item_unmedi.Text;
                TB_ITEM.ITEM_ESTOQU = int.Parse(textbox_item_estoqu.Text);

                O_BEBUMEntities entidades = new O_BEBUMEntities();
                entidades.TB_ITEM.Add(TB_ITEM);
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

        protected void button_atualizar_item_Click(object sender, EventArgs e)
        {
            try
            {
                TB_ITEM TB_ITEM;
                int id = int.Parse(GridViewITEM.Rows[GridViewITEM.SelectedIndex].Cells[0].Text);

                O_BEBUMEntities entidades = new O_BEBUMEntities();
                TB_ITEM = entidades.TB_ITEM.SingleOrDefault(i => i.ITEM_ID == id);
                TB_ITEM.ITEM_NOME = textbox_item_nome.Text;
                TB_ITEM.ITEM_VALOR = Decimal.Parse(textbox_item_valor.Text);
                TB_ITEM.ITEM_PERALC = Decimal.Parse(textbox_item_peralc.Text);
                TB_ITEM.ITEM_UNMEDI = textbox_item_unmedi.Text;
                TB_ITEM.ITEM_ESTOQU = int.Parse(textbox_item_estoqu.Text);
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

        protected void button_remover_item_Click(object sender, EventArgs e)
        {
            try
            {
                TB_ITEM TB_ITEM;
                int id = int.Parse(GridViewITEM.Rows[GridViewITEM.SelectedIndex].Cells[0].Text);

                O_BEBUMEntities entidades = new O_BEBUMEntities();
                TB_ITEM = entidades.TB_ITEM.SingleOrDefault(p => p.ITEM_ID == id);
                entidades.TB_ITEM.Remove(TB_ITEM);
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

        protected void GridViewITEM_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                TB_ITEM TB_ITEM = new TB_ITEM();
                int id = int.Parse(GridViewITEM.Rows[GridViewITEM.SelectedIndex].Cells[0].Text);
                O_BEBUMEntities entidades = new O_BEBUMEntities();
                TB_ITEM = entidades.TB_ITEM.SingleOrDefault(i => i.ITEM_ID == id);
                textbox_item_nome.Text = TB_ITEM.ITEM_NOME;
                textbox_item_valor.Text = TB_ITEM.ITEM_VALOR.ToString();
                textbox_item_peralc.Text = TB_ITEM.ITEM_PERALC.ToString();
                textbox_item_unmedi.Text = TB_ITEM.ITEM_UNMEDI.ToString();
                textbox_item_estoqu.Text = TB_ITEM.ITEM_ESTOQU.ToString();
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