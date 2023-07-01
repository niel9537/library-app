using StudentManagementApp.Models;
using Microsoft.AspNetCore.Mvc;
using StudentManagementApp.Services;

namespace LibraryApp.Controllers
{
    public class BukuController : Controller
    {

        private readonly IConfiguration _configuration;
        private readonly IBukuServices _bukuServices;

        public BukuController(IConfiguration configuration, IBukuServices bukuServices)
        {
            _configuration = configuration;
            _bukuServices = bukuServices;
        }

        public IActionResult Index()
        {
            BukuVM model = new BukuVM();
            model.BukuList = _bukuServices.GetAllBuku().ToList();
            return View(model);
        }

        [HttpPost]
        public IActionResult AddUpdateBuku(Buku buku) {
            BukuVM model = new BukuVM();
            string url = Request.Headers["Referer"].ToString();

            string result = string.Empty;
            if (buku.id_buku > 0)
            {
                result = _bukuServices.UpdateBuku(buku);
            }
            else
            {
                result = _bukuServices.InsertBuku(buku);
            }

            if(result== "Data Buku Berhasil Ditambahkan")
            {
                TempData["SuccessMsg"] = "Data Buku Berhasil Ditambahkan";
                return Redirect(url);
            }
            else
            {
                TempData["ErrorMsg"] = result;
                return Redirect(url);
            }
            return View();
        }
        [HttpPost]
        public IActionResult DeleteBuku(int id_buku)
        {

            string url = Request.Headers["Referer"].ToString();

            string result = _bukuServices.DeleteBuku(id_buku);
            if (result == "Data Buku Berhasil Dihapus ")
            {
                return Json(new { message = "Berhasil Dihapus" });
              /*  TempData["SuccessMsg"] = "Data Buku Berhasil Dihapus";
                return Redirect(url);*/
            }
            else
            {
                return Json(new { message = "Gagal Dihapus" });
            }
            return View();
        }
    }


}
