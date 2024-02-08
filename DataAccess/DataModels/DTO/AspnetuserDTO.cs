using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace DataAccess.DataModels.DTO
{
    public class AspnetuserDTO
    {
        [Required]
        [Column("username")]
        [StringLength(256)]
        public string Username { get; set; } = null!;

        [Required]
        [Display(Name ="Password")]
        [Column("passwordhash", TypeName = "character varying")]
        public string? Passwordhash { get; set; }
    }

}
