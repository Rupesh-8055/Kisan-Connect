using System;
using System.Collections.Generic;

namespace UserLoginService.Models
{
    public partial class Product
    {
        public Product()
        {
            FarmerProducts = new HashSet<FarmerProduct>();
            OrderDetails = new HashSet<OrderDetail>();
            Varieties = new HashSet<Variety>();
        }

        public int Pid { get; set; }
        public string? Pname { get; set; }

        public virtual ICollection<FarmerProduct>? FarmerProducts { get; set; }
        public virtual ICollection<OrderDetail>? OrderDetails { get; set; }
        public virtual ICollection<Variety>? Varieties { get; set; }
    }
}
