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


        public ActionResult Login(LoginVM model)
        {

           
                if (ModelState.IsValid) // this is check validity
                {


                    var v = db.Users.Where(a => a.UserEmail.Equals(model.UserName) && a.PW.Equals(model.Password)).FirstOrDefault();
                    if (v != null)
                    {
                        if (v.UserTypeID == 1)
                        {
                            return RedirectToAction("AdminLogged", "Home");

                        }

                        else if (v.UserTypeID == 2)
                        {
                            return RedirectToAction("DonorLogged", "Home");

                        }

                        else if (v.UserTypeID == 3)
                        {
                            return RedirectToAction("UserLogged", "Home");

                        }
                    }

                }





          
            return View(model);

        }

       

        


       
    }
}