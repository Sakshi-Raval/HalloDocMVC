using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ViewModel
{
    public class MedicalHistoryViewModel
    {
        public string Name { get; set; }
        //[DataType(DataType.DateTime)]
        //[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "Mmm dd, YYYY")]
        public string CreatedDate { get; set; }
        public int Status { get; set; }
        public int DocumentCount { get; set; }

    }
}
