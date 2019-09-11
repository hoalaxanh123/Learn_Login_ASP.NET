using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace LearLogin_DayNhauHoc.Models
{
    public class ReFlecttionController : Controller
    {
        // GET: ReFlecttion
        public static List<Type> GetControllder(string nameSpace)
        {
            Assembly ass = Assembly.GetExecutingAssembly();
            IEnumerable<Type> types = ass.GetTypes().Where(type => typeof(Controller).IsAssignableFrom(type) && type.Namespace.Contains(nameSpace)).OrderBy(x=>x.Name);
            return types.ToList();
        }
        public static List<string> GetActions(Type Controller)
        {
            List<string> lstAction = new List<string>();
            IEnumerable<MemberInfo> memberInfo = Controller.GetMethods(BindingFlags.Instance | BindingFlags.DeclaredOnly
                | BindingFlags.Public).Where(m => !m.GetCustomAttributes(typeof(System.Runtime.CompilerServices.CompilerGeneratedAttribute), true).Any()).OrderBy(x => x.Name);
            foreach(MemberInfo method in memberInfo)
            {
                if(method.ReflectedType.IsPublic && !method.IsDefined(typeof(NonActionAttribute)))
                {
                    lstAction.Add(method.Name.ToString());
                }
            }
            return lstAction;
        }
    }
}