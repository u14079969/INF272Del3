using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using INF272Del3.Models;
using INF272Del3.ViewModels;


namespace INF272Del3.Controllers
{
    public class WithdrawalController : Controller
    {

        private INF272D3Entities1 db = new INF272D3Entities1();
        // GET: Donation
        public ActionResult Index()
        {
            return View();
        }

        public new ActionResult Request()
        {
            var productList = db.Products.Include(p => p.Gender).Include(p => p.ProductCategory).Include(p => p.ProductColor).Include(p => p.ProductCondition).Include(p => p.ProductType);

            return View(productList.ToList());
        }

        public ActionResult UpdateWithdrawalDetail(int? idProduct, int? idWithdrawal, int? itemCost)
        {
            WithdrawalDetail newWithdrawalDetail = new WithdrawalDetail();
            Withdrawal newWithdrawal = new Withdrawal();

            if (idProduct != null)
            {
                newWithdrawalDetail.ProductID = Convert.ToInt32(idProduct);
                newWithdrawalDetail.WDID = Convert.ToInt32(idWithdrawal);
                return View(newWithdrawalDetail);
                DateTime today = DateTime.Today;

                newWithdrawal.UserID = Convert.ToInt32(User);
                newWithdrawal.WithdrawalDate = today;
                newWithdrawal.TotalPoints = newWithdrawal.TotalPoints - Convert.ToInt32(itemCost);
                return View(newWithdrawal);

                return RedirectToAction("Delete");
            }
            else
            {
                return View("Request");
            }
        }

             public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View("Request");
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Request");
        }


    
    }
}