using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace FinalPracticaProfesional.Models
{
    public class Domicilio
    {
        [Key]
        public int Id_domicilio { get; set; }
        public string Nombre_domicilio { get; set; }
        public int Num_consultorio { get; set; }
        [JsonIgnore]
        [ForeignKey("Id_medico")]
        public virtual Medico Medico { get; set; }
    }
}
