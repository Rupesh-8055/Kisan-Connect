using System;
using System.Collections.Generic;

namespace UserLoginService.Models
{
    public partial class User
    {
        public User()
        {
            Buyers = new HashSet<Buyer>();
            Farmers = new HashSet<Farmer>();
        }

        public string? Email { get; set; }
        public string? Password { get; set; }
        public int Uid { get; set; }
        public int? Rid { get; set; }
        public string? Uname { get; set; }

        public virtual Role? RidNavigation { get; set; }
        public virtual ICollection<Buyer>? Buyers { get; set; }
        public virtual ICollection<Farmer>? Farmers { get; set; }
    }
}
