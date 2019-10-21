using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using INF272Del3.Models;
using System.Data;
using System.Data.Entity;
using INF272Del3.ViewModels;

namespace INF272Del3.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account

        INF272D3Entities1 db = new INF272D3Entities1();
       // [HttpPost]
        public ActionResult Login(string username, string password)
        {
             User user = db.Users.Where(zz => zz.UserEmail == username && zz.PW == password).FirstOrDefault();

             if (user != null)
             {

                 return RedirectToAction("Admin", "Account");
             }

             else return RedirectToAction("Index", "Users");
             

          
            
        }

        public ActionResult Admin()
        {
            
            return View();
        }
    }
}