using System;
using System.Collections.Generic;

namespace UserLoginService.Models
{
    public partial class FarmerProduct
    {
        public FarmerProduct()
        {
            Carts = new HashSet<Cart>();
            Orders = new HashSet<Order>();
        }

        public int Fpid { get; set; }
        public int? Sid { get; set; }
        public int? Pid { get; set; }
        public int? Stock { get; set; }
        public decimal? Price { get; set; }
        public int? Vid { get; set; }

        public virtual Product? PidNavigation { get; set; }
        public virtual Farmer? SidNavigation { get; set; }
        public virtual ICollection<Cart>? Carts { get; set; }
        public virtual ICollection<Order>? Orders { get; set; }
    }
}
