using DataAccess.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class EditRoleViewModel
    {
        public string RoleName { get; set; }    
        public string AccountType { get; set; }
        public List<Menu> Menus {  get; set; }
        public int[] SelectedMenu {  get; set; }
    }
}
