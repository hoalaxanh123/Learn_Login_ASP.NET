using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LearLogin_DayNhauHoc.Models;
namespace LearLogin_DayNhauHoc.Controllers
{
    [Authentication]
    public class HomeController : Controller
    {
        PhanQuyenEntities db = new PhanQuyenEntities();

        public ActionResult Index()
        {
            List<Type> lstAction = ReFlecttionController.GetControllder("LearLogin_DayNhauHoc");
            return View(lstAction);
        }
        public ActionResult Index2()
        {
            List<Type> lstAction = ReFlecttionController.GetControllder("LearLogin_DayNhauHoc");
            return View(lstAction);
        }
        public ActionResult Products()
        {
            return View();
        }

        public ActionResult Users()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session["ACL"] = null;
            HttpCookie a = new HttpCookie("_us", "");
            a.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(a);

            return Redirect("~/Home");
        }
        public ActionResult Login(FormCollection f)
        {
            var userName = f["UserName"];
            var PassWord = f["PassWord"];
            if (userName != null && PassWord != null)
            {
                var user = db.Users.SingleOrDefault(x => x.UserName.Trim() == userName && x.PassWord.Trim() == PassWord);
                if (user != null)
                {
                    //Tạo token từ user name, password và user agent
                    string token = userName + "⌂" + PassWord;

                    RememberToken rtoken = new RememberToken();
                    rtoken.ID_User = user.ID;
                    rtoken.Token = token;
                    rtoken.UserAgent = "Chrome";

                    Session["ACL"] = db.Permissions.Where(x => x.ID_Role == user.ID_Role).ToList();
                    db.RememberTokens.Add(rtoken);
                    db.SaveChanges();

                    //Lưu chứng thực vào session
                    //Auth auth = new Auth(user.UserName, user.ID_Role);
                    //Session["Auth"] = auth;
                    Random rd = new Random(0);
                    int ramDomNumber = rd.Next(1111, 9999);
                    int ramDomNumber2 = rd.Next(1111, 9999);
                    //Lưu tên đăng nhập và idToken vào cookie
                    HttpCookie cookieUser = new HttpCookie("_us", ramDomNumber.ToString() + user.ID + "⌂" + ramDomNumber2.ToString() + rtoken.ID)
                    {
                        Expires = DateTime.Now.AddMonths(1),
                        HttpOnly = true,
                        Secure=true,
                    };
                    Response.Cookies.Add(cookieUser);


                    return Redirect("~/Home/Index");

                }
            }
            return View();
        }
    }
}