using Btap1.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Btap1.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: Product
        Btap1Entities db = new Btap1Entities();

        public ActionResult Index()
        {
            List<Product> product = db.Products.ToList();
            return View(product);
        }
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(Product product, HttpPostedFileBase upLoad)
        {
            db.Products.Add(product);
            db.SaveChanges();

            if (upLoad != null && upLoad.ContentLength > 0)
            {
                int id = int.Parse(db.Products.ToList().Last().id.ToString());

                string _FileName = "";
                int index = upLoad.FileName.LastIndexOf('.');
                _FileName = "pr" + id.ToString() + upLoad.FileName.Substring(index);
                string _path = Path.Combine(Server.MapPath("~/Upload"), _FileName);
                upLoad.SaveAs(_path);

                Product images = db.Products.FirstOrDefault(x => x.id == id);
                images.image = _FileName;
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }
    }
}