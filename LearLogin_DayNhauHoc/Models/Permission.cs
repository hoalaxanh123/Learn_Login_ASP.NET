//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LearLogin_DayNhauHoc.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Permission
    {
        public int ID { get; set; }
        public Nullable<int> ID_Role { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
    
        public virtual Role Role { get; set; }
    }
}
