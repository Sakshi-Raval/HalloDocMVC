using Microsoft.VisualBasic;
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
        //[DataType(DataType.DateTime)]
        //[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "Mmm dd, YYYY")]
        public string CreatedDate { get; set; }
        public int Status { get; set; }
        public int DocumentCount { get; set; }
        public int requestid { get; set; }

    }
}
