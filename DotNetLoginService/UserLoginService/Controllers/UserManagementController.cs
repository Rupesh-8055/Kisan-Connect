using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Reflection.Metadata.Ecma335;
using UserLoginService.Models;

namespace UserLoginService.Controllers
{

    [Route("api/[controller]/[action]")]
    [EnableCors]
    [ApiController]
    public class UserManagementController : ControllerBase
    {
        [HttpGet]
        public List<Buyer> GetBuyers()
        {
            List<Buyer> result = new List<Buyer>();
            using (var db = new kisan_connectContext())
            {
                result = db.Buyers.ToList();
            }
            return result;
        }

        [HttpGet]
        public List<Buyer> GetBuyersWithOrders()
        {
            List<Buyer> result = new List<Buyer>();
            using (var db = new kisan_connectContext())
            {
                result = db.Buyers.Include(add => add.Orders).ToList();
            }
            return result;
        }

        [HttpGet]
        public List<Buyer> GetBuyersWithPayments()
        {
            List<Buyer> result = new List<Buyer>();
            using (var db = new kisan_connectContext())
            {
                result = db.Buyers.Include(add => add.Payments).ToList();
            }
            return result;
        }

        //inserting a new buyer in the database
        [HttpPost]
        public Buyer SaveBuyer(Buyer buyer)
        {
            using (var db = new kisan_connectContext())
            {
                buyer.user.Password = BCrypt.Net.BCrypt.HashPassword(buyer.user.Password);
                db.Buyers.Add(buyer);
                db.SaveChanges();
            }
            return buyer;
        }
        //select operation on farmers
        [HttpGet]
        public List<Farmer> GetFarmers()
        {
            List<Farmer> result = new List<Farmer>();
            using (var db = new kisan_connectContext())
            {
                result = db.Farmers.ToList();
            }
            return result;
        }

        [HttpPost]
        public Farmer SaveFarmer(Farmer farmer)
        {
            using (var db = new kisan_connectContext())
            {
                farmer.user.Password = BCrypt.Net.BCrypt.HashPassword(farmer.user.Password);
                db.Farmers.Add(farmer);
                db.SaveChanges();
            }
            return farmer;
        }

        /*
        [HttpPost]
        public IActionResult updateVerifyLogin(User user)
        {
            User userdb;
            using (var db = new kisan_connectContext())
            {
                userdb = db.Users.Where(u => u.Uname == user.Uname).FirstOrDefault();

            }

            if (userdb != null && BCrypt.Net.BCrypt.Verify(user.Password, userdb.Password))
            {
                //return an object that includes the roleid
                var response = new
                {
                    userdb.Uname,
                    userdb.Rid,

                    //include other properties if neccesary
                };

                return Ok(response);


            }

            return Unauthorized(new { message = "Invalid username or password ." });


        }
        */

       
        [HttpPost]
        public IActionResult UpdateVerifyLogin(User user)
        {
            using (var db = new kisan_connectContext())
            {
                // Find the user by username
                var userdb = db.Users.Include(u => u.Farmers).FirstOrDefault(u => u.Uname == user.Uname);

                var userdb1 = db.Users.Include(u => u.Buyers).FirstOrDefault(u => u.Uname == user.Uname);

                // If user is not found
                if (userdb == null)
                {
                    return NotFound(new { message = "User not found" });
                }

                if (userdb1 == null)
                {
                    return NotFound(new { message = "User not found" });
                }
                // Verify password
                if (!BCrypt.Net.BCrypt.Verify(user.Password, userdb.Password))
                {
                    return Unauthorized(new { message = "Invalid password" });
                }

                if (!BCrypt.Net.BCrypt.Verify(user.Password, userdb1.Password))
                {
                    return Unauthorized(new { message = "Invalid password" });
                }

                // Check the user's role for the farmers
                if (userdb.Rid == 2)
                {
                    return Ok(userdb); // Return user details including Farmers
                }

                // Check the user's role for the Buyers
                else if (userdb.Rid==3)
                {
                    return Ok(userdb1);
                }
                else
                {
                    return Unauthorized(new { message = "Unauthorized access" });
                }
        }            
            }




    }
}


    

