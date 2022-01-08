using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace FinalPracticaProfesional.Models
{
    public class Telefono
    {
        [Key]
        public int Id_telefono { get; set; }
        public string Num_telefono { get; set; }

        [JsonIgnore]
        [ForeignKey("Id_medico")]  
        public virtual Medico Medico { get; set; }
    }
}
