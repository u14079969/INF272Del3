using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using INF272Del3.Models;

namespace INF272Del3.Controllers
{
    public class ProductsController : Controller
    {
        private INF272D3Entities1 db = new INF272D3Entities1();

        // GET: Products
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Gender).Include(p => p.ProductCategory).Include(p => p.ProductColor).Include(p => p.ProductCondition).Include(p => p.ProductType);
            return View(products.ToList());
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
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
            return View(product);
        }

        // GET: Products/Create
        public ActionResult Create()
        {
            ViewBag.GenderID = new SelectList(db.Genders, "GenderID", "Gender1");
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "CategoryID", "Category");
            ViewBag.ColorID = new SelectList(db.ProductColors, "ColorID", "Color");
            ViewBag.ConditionID = new SelectList(db.ProductConditions, "ConditionID", "Condition");
            ViewBag.TypeID = new SelectList(db.ProductTypes, "TypeID", "ProductType1");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,ProductInfo,TypeID,ConditionID,CategoryID,Cost,ProductAddDate,GenderID,Size,BestBefore,ColorID")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.GenderID = new SelectList(db.Genders, "GenderID", "Gender1", product.GenderID);
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "CategoryID", "Category", product.CategoryID);
            ViewBag.ColorID = new SelectList(db.ProductColors, "ColorID", "Color", product.ColorID);
            ViewBag.ConditionID = new SelectList(db.ProductConditions, "ConditionID", "Condition", product.ConditionID);
            ViewBag.TypeID = new SelectList(db.ProductTypes, "TypeID", "ProductType1", product.TypeID);
            return View(product);
        }

        // GET: Products/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.GenderID = new SelectList(db.Genders, "GenderID", "Gender1", product.GenderID);
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "CategoryID", "Category", product.CategoryID);
            ViewBag.ColorID = new SelectList(db.ProductColors, "ColorID", "Color", product.ColorID);
            ViewBag.ConditionID = new SelectList(db.ProductConditions, "ConditionID", "Condition", product.ConditionID);
            ViewBag.TypeID = new SelectList(db.ProductTypes, "TypeID", "ProductType1", product.TypeID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,ProductInfo,TypeID,ConditionID,CategoryID,Cost,ProductAddDate,GenderID,Size,BestBefore,ColorID")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.GenderID = new SelectList(db.Genders, "GenderID", "Gender1", product.GenderID);
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "CategoryID", "Category", product.CategoryID);
            ViewBag.ColorID = new SelectList(db.ProductColors, "ColorID", "Color", product.ColorID);
            ViewBag.ConditionID = new SelectList(db.ProductConditions, "ConditionID", "Condition", product.ConditionID);
            ViewBag.TypeID = new SelectList(db.ProductTypes, "TypeID", "ProductType1", product.TypeID);
            return View(product);
        }

        // GET: Products/Delete/5
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
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);

        }
        //GET: Products/UserDonations
        public ActionResult DonorLogged()
        {
            Product product = db.Products.Include(zz => zz.DonationDetails.Select(ss => ss.Donation)).FirstOrDefault();
            return View(product);
        }
    }
}
