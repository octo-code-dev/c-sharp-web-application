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
    
    public partial class TB_PAGAME
    {
        public TB_PAGAME()
        {
            this.TB_PEDIDO = new HashSet<TB_PEDIDO>();
        }
    
        public int PAGA_ID { get; set; }
        public string PAGA_NOME { get; set; }
    
        public virtual ICollection<TB_PEDIDO> TB_PEDIDO { get; set; }
    }
}
