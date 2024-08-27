using System;
using System.Collections.Generic;

namespace UserLoginService.Models
{
    public partial class Variety
    {
        public int Vid { get; set; }
        public string? Vname { get; set; }
        public int? Pid { get; set; }

        public virtual Product? PidNavigation { get; set; }
    }
}
