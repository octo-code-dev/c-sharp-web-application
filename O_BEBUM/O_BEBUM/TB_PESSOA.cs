//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace O_BEBUM
{
    using System;
    using System.Collections.Generic;
    
    public partial class TB_PESSOA
    {
        public TB_PESSOA()
        {
            this.TB_ENDERE = new HashSet<TB_ENDERE>();
            this.TB_NOTICI = new HashSet<TB_NOTICI>();
            this.TB_PEDIDO = new HashSet<TB_PEDIDO>();
        }
    
        public int PESS_ID { get; set; }
        public string PESS_NOME { get; set; }
        public string PESS_DTNASC { get; set; }
        public string PESS_CPF { get; set; }
        public string PESS_EMAIL { get; set; }
        public string PESS_SENHA { get; set; }
        public string PESS_FONE { get; set; }
        public int PESS_TIPO { get; set; }
    
        public virtual ICollection<TB_ENDERE> TB_ENDERE { get; set; }
        public virtual ICollection<TB_NOTICI> TB_NOTICI { get; set; }
        public virtual ICollection<TB_PEDIDO> TB_PEDIDO { get; set; }
    }
}
