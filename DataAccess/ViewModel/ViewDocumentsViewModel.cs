using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class ViewDocumentsViewModel
    {
        public string Filename { get; set; }
        public string UploaderName { get; set; }
        public string CreatedDate { get; set; }
        public int requestedId{ get; set;}
    }
}
