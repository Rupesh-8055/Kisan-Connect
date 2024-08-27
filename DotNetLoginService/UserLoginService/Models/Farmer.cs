using System;
using System.Collections.Generic;

namespace UserLoginService.Models
{
    public partial class Farmer
    {
        public Farmer()
        {
            FarmerProducts = new HashSet<FarmerProduct>();
        }

        public int Sid { get; set; }
        public string? Fname { get; set; }
        public string? Lname { get; set; }
        public string? Email { get; set; }
        public string? RegNo { get; set; }
        public int? Uid { get; set; }
        public string? Contact { get; set; }

        public virtual User? user { get; set; }
        public virtual ICollection<FarmerProduct>? FarmerProducts { get; set; }
    }
}
