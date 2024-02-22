using DataAccess.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class CombinedViewModel
    {
        public User user {  get; set; }
        public UserProfileViewModel profile { get; set; }
    }
}
