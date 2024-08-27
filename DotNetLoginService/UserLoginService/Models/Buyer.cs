using System;
using System.Collections.Generic;

namespace UserLoginService.Models
{
    public partial class Buyer
    {
        public Buyer()
        {
            Orders = new HashSet<Order>();
            Payments = new HashSet<Payment>();
        }

        public int Bid { get; set; }
        public string? Fname { get; set; }
        public string? Lname { get; set; }
        public string? Email { get; set; }
        public string? Address { get; set; }
        public int? Uid { get; set; }
        public string? Contact { get; set; }

        public virtual User? user { get; set; }
        public virtual ICollection<Order>? Orders { get; set; }
        public virtual ICollection<Payment>? Payments { get; set; }
    }
}
