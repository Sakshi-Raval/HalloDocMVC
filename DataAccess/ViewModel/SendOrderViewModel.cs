using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class SendOrderViewModel
    {
        public int Vendorid { get; set; }
        public int Requestid {  get; set; }
        public string? FaxNumber { get; set; }
        public string Email { get; set; }
        public string BusinessContact { get; set; }
        public string Prescription { get; set; }
        public int? NoOfRefill { get; set; }

    }
}
