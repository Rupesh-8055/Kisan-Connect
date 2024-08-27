using System;
using System.Collections.Generic;

namespace UserLoginService.Models
{
    public partial class Cart
    {
        public int CartId { get; set; }
        public int? Fpid { get; set; }
        public int? Qty { get; set; }
        public int? Bid { get; set; }

        public virtual FarmerProduct? Fp { get; set; }
    }
}
