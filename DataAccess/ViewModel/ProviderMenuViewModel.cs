using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class ProviderMenuViewModel
    {
        public int PhysicianId { get; set; }
        public bool StopNotification { get; set; }
        public string ProviderName { get; set; }
        public string RoleName { get; set; }
        public bool OnCallStatus { get; set; } = false;
        public int? Status { get; set; }
        public int? Regionid { get; set; }
    }
}
