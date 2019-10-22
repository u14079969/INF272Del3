using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace INF272Del3.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult UserLogged()
        {
            
            return View();
        }

        public ActionResult AdminLogged()
        {

            return View();
        }

        public ActionResult DonorLogged()
        {

            return View();
        }
    }
}