using System;
using System.Collections.Generic;

namespace UserLoginService.Models
{
    public partial class Payment
    {
        public int PayId { get; set; }
        public string? PayMethod { get; set; }
        public int? Bid { get; set; }
        public string? TransNo { get; set; }
        public int? Oid { get; set; }
        public decimal? Amount { get; set; }

        public virtual Buyer? BidNavigation { get; set; }
        public virtual Order? OidNavigation { get; set; }
    }
}
