using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Validation;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

namespace O_BEBUM
{
    public partial class PESSOA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            label_nome_cliente.Text = Context.User.Identity.Name;
        }


        protected void button_inserir_pessoa_Click(object sender, EventArgs e)
        {
            try
            {
                TB_PESSOA TB_PESSOA;
                if (GridViewPESSOA.SelectedIndex > -1)
                {
                    int id = int.Parse(GridViewPESSOA.Rows[GridViewPESSOA.SelectedIndex].Cells[0].Text);
                    O_BEBUMEntities entidadespessoa = new O_BEBUMEntities();
                    TB_PESSOA = entidadespessoa.TB_PESSOA.SingleOrDefault(p => p.PESS_ID == id);
                    TB_PESSOA.PESS_NOME = textbox_pess_nome.Text;
                    TB_PESSOA.PESS_DTNASC = textbox_pess_dtnasc.Text;
                    TB_PESSOA.PESS_CPF = textbox_pess_cpf.Text;
                    TB_PESSOA.PESS_EMAIL = textbox_pess_email.Text;
                    TB_PESSOA.PESS_SENHA = textbox_pess_senha.Text;
                    TB_PESSOA.PESS_FONE = textbox_pess_fone.Text;
                    TB_PESSOA.PESS_TIPO = 0;
                    entidadespessoa.SaveChanges();
                }
                else
                {
                    TB_PESSOA = new TB_PESSOA();
                    TB_PESSOA.PESS_NOME = textbox_pess_nome.Text;
                    TB_PESSOA.PESS_DTNASC = textbox_pess_dtnasc.Text;
                    TB_PESSOA.PESS_CPF = textbox_pess_cpf.Text;
                    TB_PESSOA.PESS_EMAIL = textbox_pess_email.Text;
                    TB_PESSOA.PESS_SENHA = textbox_pess_senha.Text;
                    TB_PESSOA.PESS_FONE = textbox_pess_fone.Text;
                    TB_PESSOA.PESS_TIPO = 0;
                    O_BEBUMEntities entidadespessoa = new O_BEBUMEntities();
                    entidadespessoa.TB_PESSOA.Add(TB_PESSOA);
                    entidadespessoa.SaveChanges();
                }

                TB_ENDERE TB_ENDERE = new TB_ENDERE();
                TB_ENDERE.ENDE_LOGRAD = textbox_ende_lograd.Text;
                TB_ENDERE.ENDE_NUMERO = textbox_ende_numero.Text;
                TB_ENDERE.ENDE_CEP = textbox_ende_cep.Text;
                TB_ENDERE.ENDE_COMPLE = textbox_ende_comple.Text;
                TB_ENDERE.ENDE_BAIRRO = textbox_ende_bairro.Text;
                TB_ENDERE.ENDE_CIDADE = textbox_ende_cidade.Text;
                TB_ENDERE.ENDE_ESTADO = textbox_ende_estado.Text;
                TB_ENDERE.ENDE_REFERE = textbox_ende_refere.Text;
                TB_ENDERE.PESS_ID = TB_PESSOA.PESS_ID;

                O_BEBUMEntities entidadesendereco = new O_BEBUMEntities();
                entidadesendereco.TB_ENDERE.Add(TB_ENDERE);
                entidadesendereco.SaveChanges();
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

        protected void button_atualizar_pessoa_Click(object sender, EventArgs e)
        {
            try
            {
                TB_PESSOA TB_PESSOA;
                int id = int.Parse(GridViewPESSOA.Rows[GridViewPESSOA.SelectedIndex].Cells[0].Text);
                O_BEBUMEntities entidadespessoa = new O_BEBUMEntities();
                TB_PESSOA = entidadespessoa.TB_PESSOA.SingleOrDefault(p => p.PESS_ID == id);
                TB_PESSOA.PESS_NOME = textbox_pess_nome.Text;
                TB_PESSOA.PESS_DTNASC = textbox_pess_dtnasc.Text;
                TB_PESSOA.PESS_CPF = textbox_pess_cpf.Text;
                TB_PESSOA.PESS_EMAIL = textbox_pess_email.Text;
                TB_PESSOA.PESS_SENHA = textbox_pess_senha.Text;
                TB_PESSOA.PESS_FONE = textbox_pess_fone.Text;
                TB_PESSOA.PESS_TIPO = 0;
                entidadespessoa.SaveChanges();

                TB_ENDERE TB_ENDERE;
                id = int.Parse(GridViewENDERECO.Rows[GridViewENDERECO.SelectedIndex].Cells[0].Text);
                O_BEBUMEntities entidadesendereco = new O_BEBUMEntities();
                TB_ENDERE = entidadesendereco.TB_ENDERE.SingleOrDefault(en => en.ENDE_ID == id);
                TB_ENDERE.ENDE_LOGRAD = textbox_ende_lograd.Text;
                TB_ENDERE.ENDE_NUMERO = textbox_ende_numero.Text;
                TB_ENDERE.ENDE_CEP = textbox_ende_cep.Text;
                TB_ENDERE.ENDE_COMPLE = textbox_ende_comple.Text;
                TB_ENDERE.ENDE_BAIRRO = textbox_ende_bairro.Text;
                TB_ENDERE.ENDE_CIDADE = textbox_ende_cidade.Text;
                TB_ENDERE.ENDE_ESTADO = textbox_ende_estado.Text;
                TB_ENDERE.ENDE_REFERE = textbox_ende_refere.Text;
                entidadesendereco.SaveChanges();
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

        protected void button_remover_pessoa_Click(object sender, EventArgs e)
        {
            try
            {
                O_BEBUMEntities entidades = new O_BEBUMEntities();

                if (GridViewPESSOA.SelectedIndex > -1)
                {
                    TB_PESSOA TB_PESSOA;
                    int id = int.Parse(GridViewPESSOA.Rows[GridViewPESSOA.SelectedIndex].Cells[0].Text);
                    TB_PESSOA = entidades.TB_PESSOA.SingleOrDefault(p => p.PESS_ID == id);
                    entidades.TB_PESSOA.Remove(TB_PESSOA);
                }

                if (GridViewENDERECO.SelectedIndex > -1)
                {
                    TB_ENDERE TB_ENDERE;
                    int id = int.Parse(GridViewENDERECO.Rows[GridViewENDERECO.SelectedIndex].Cells[0].Text);
                    TB_ENDERE = entidades.TB_ENDERE.SingleOrDefault(en => en.ENDE_ID == id); ;
                    entidades.TB_ENDERE.Remove(TB_ENDERE);
                }

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

            try
            {
                TB_ENDERE TB_ENDERE;
                int id = int.Parse(GridViewENDERECO.Rows[GridViewENDERECO.SelectedIndex].Cells[0].Text);

                O_BEBUMEntities entidades2 = new O_BEBUMEntities();
                TB_ENDERE = entidades2.TB_ENDERE.SingleOrDefault(p => p.ENDE_ID == id);
                entidades2.TB_ENDERE.Remove(TB_ENDERE);
                entidades2.SaveChanges();
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

        protected void GridViewPESSOA_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                TB_PESSOA TB_PESSOA = new TB_PESSOA();
                TB_ENDERE TB_ENDERE = new TB_ENDERE();
                int id = int.Parse(GridViewPESSOA.Rows[GridViewPESSOA.SelectedIndex].Cells[0].Text);
                O_BEBUMEntities entidades = new O_BEBUMEntities();
                TB_PESSOA = entidades.TB_PESSOA.SingleOrDefault(p => p.PESS_ID == id);
                textbox_pess_nome.Text = TB_PESSOA.PESS_NOME;
                textbox_pess_dtnasc.Text = TB_PESSOA.PESS_DTNASC;
                textbox_pess_cpf.Text = TB_PESSOA.PESS_CPF;
                textbox_pess_email.Text = TB_PESSOA.PESS_EMAIL;
                textbox_pess_senha.Text = TB_PESSOA.PESS_SENHA;
                textbox_pess_fone.Text = TB_PESSOA.PESS_FONE;

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

        protected void GridViewENDERECO_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                TB_ENDERE TB_ENDERE = new TB_ENDERE();
                int id = int.Parse(GridViewENDERECO.Rows[GridViewENDERECO.SelectedIndex].Cells[0].Text);
                O_BEBUMEntities entidades = new O_BEBUMEntities();
                TB_ENDERE = entidades.TB_ENDERE.SingleOrDefault(en => en.ENDE_ID == id);
                textbox_ende_lograd.Text = TB_ENDERE.ENDE_LOGRAD;
                textbox_ende_numero.Text = TB_ENDERE.ENDE_NUMERO;
                textbox_ende_cep.Text = TB_ENDERE.ENDE_CEP;
                textbox_ende_comple.Text = TB_ENDERE.ENDE_COMPLE;
                textbox_ende_bairro.Text = TB_ENDERE.ENDE_BAIRRO;
                textbox_ende_cidade.Text = TB_ENDERE.ENDE_CIDADE;
                textbox_ende_estado.Text = TB_ENDERE.ENDE_ESTADO;
                textbox_ende_refere.Text = TB_ENDERE.ENDE_REFERE;
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