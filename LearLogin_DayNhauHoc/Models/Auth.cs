using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LearLogin_DayNhauHoc.Models;
namespace LearLogin_DayNhauHoc.Models
{
    public class Authentication : ActionFilterAttribute
    {
        PhanQuyenEntities db = new PhanQuyenEntities();
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            List<string> lst_QuyenHan = new List<string>();
            List<Permission> lstQHTemp = HttpContext.Current.Session["ACL"] as List<Permission>;
            if (lstQHTemp == null)
            {
              if(HttpContext.Current.Request.Cookies["_us"]!=null)
                {
                    string userIDTemp = HttpContext.Current.Request.Cookies["_us"].Value.Split('⌂')[0];
                    string tokenTemp = HttpContext.Current.Request.Cookies["_us"].Value.Split('⌂')[1];
                    int userID =int.Parse(userIDTemp.Substring(4, userIDTemp.Length- 4));
                    int token = int.Parse(tokenTemp.Substring(4, tokenTemp.Length-4));
                    User user = db.Users.SingleOrDefault(x => x.ID == userID);
                    if(user==null)
                        filterContext.Result = new RedirectResult("~/Home/Index2");
                    else
                    {
                        //Validate với token
                        //Tiến hành đăng nhập - tạo lại session cho người dùng
                        HttpContext.Current.Session["ACL"] = db.Permissions.Where(x => x.ID_Role == user.ID_Role).ToList();
                        if (HttpContext.Current.Request.Cookies["ASP.NET_SessionId"] != null)
                        {
                            HttpCookie temp = new HttpCookie("ASP.NET_SessionId", HttpContext.Current.Request.Cookies["ASP.NET_SessionId"].Value)
                            {
                                Expires = DateTime.Now.AddMonths(1),
                                HttpOnly = true,
                                Secure = true
                            };

                            //Xóa thằng cũ
                            HttpCookie cookieUser = new HttpCookie("ASP.NET_SessionId","")
                            {
                                Expires = DateTime.Now.AddDays(-1),
                                HttpOnly = true,
                                Secure = true,
                            };
                            HttpContext.Current.Response.Cookies.Add(cookieUser);
                            //Đẩy thằng mới vào
                            HttpContext.Current.Response.Cookies.Add(temp);
                        }
                        lstQHTemp = HttpContext.Current.Session["ACL"] as List<Permission>;
                      
                        foreach (var item in lstQHTemp)
                        {
                            lst_QuyenHan.Add(item.Controller + "-" + item.Action);
                        }
                    }

                }
              else
                {
                    lst_QuyenHan.Add("Home-Index");
                    lst_QuyenHan.Add("Home-Index2");
                    lst_QuyenHan.Add("Home-Login");
                }
            }
            else
            {
                foreach (var item in lstQHTemp)
                {
                    lst_QuyenHan.Add(item.Controller + "-" + item.Action);
                }
            }
            string actionName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName + "-" +
                filterContext.ActionDescriptor.ActionName;
            if (!lst_QuyenHan.Contains(actionName))
            {
                filterContext.Result = new RedirectResult("~/Home/Index2");
            }
        }
    }
}