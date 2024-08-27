using System;
using System.Collections.Generic;

namespace UserLoginService.Models
{
    public partial class OrderDetail
    {
        public int OrderdetailId { get; set; }
        public int? Qty { get; set; }
        public decimal? Rate { get; set; }
        public int? Pid { get; set; }
        public int? Oid { get; set; }

        public virtual Order? OidNavigation { get; set; }
        public virtual Product? PidNavigation { get; set; }
    }
}
