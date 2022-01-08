using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace FinalPracticaProfesional.Models
{
    public class Email
    {
        [Key]
        public int Id_Email { get; set; }
        public string Mail { get; set; }

        [JsonIgnore]
        [ForeignKey("Id_Medico")]
        public virtual Medico Medico { get; set; }
    }
}
