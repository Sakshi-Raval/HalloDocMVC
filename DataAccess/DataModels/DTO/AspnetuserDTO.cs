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
        [Column("passwordhash", TypeName = "character varying")]
        public string? Passwordhash { get; set; }
    }

}
