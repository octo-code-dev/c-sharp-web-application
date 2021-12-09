using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace O_BEBUM
{
    public class Email
    {
        public static bool EnviarAutomatico(string Para, string Assunto, string Mensagem)
        {
            try
            {
                MailMessage MensagemEmail = new MailMessage();

                MensagemEmail.To.Add(Para);
                MensagemEmail.Subject = Assunto;
                MensagemEmail.Body = Mensagem;
                MensagemEmail.IsBodyHtml = false;

                SmtpClient envio = new SmtpClient();
                envio.Send(MensagemEmail);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}