using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;

namespace ODTLearning.BLL.Models
{

    public static class EnumExtensions
    {
        public static string GetDescription<T>(this T enumValue) where T : Enum
        {
            FieldInfo fi = enumValue.GetType().GetField(enumValue.ToString());
            DescriptionAttribute[] attributes = (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);
            return attributes.Length > 0 ? attributes[0].Description : enumValue.ToString();
        }
    }
    public enum UserRole
    {
        [Description("học sinh")]
        Student ,

        [Description("gia sư")]
        Tutor,

        [Description("quản trị viên")]
        Admin,

        [Description("kiểm duyệt viên")]
        Moderator,
    }
    public static class UserRoleAuthorize
    {
        public const string Student = "học sinh";
        public const string Tutor = "gia sư";
        public const string Admin = "quản trị viên";
        public const string Moderator = "kiểm duyệt viên";
    }
}