using System;
using System.Collections.Generic;

namespace UserLoginService.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
            Payments = new HashSet<Payment>();
        }

        public int Oid { get; set; }
        public int? Fpid { get; set; }
        public DateOnly? Date { get; set; }
        public decimal? TotAmt { get; set; }
        public int? Bid { get; set; }

        public virtual Buyer? BidNavigation { get; set; }
        public virtual FarmerProduct? Fp { get; set; }
        public virtual ICollection<OrderDetail>? OrderDetails { get; set; }
        public virtual ICollection<Payment>? Payments { get; set; }
    }
}
