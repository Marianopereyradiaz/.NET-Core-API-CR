using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace FinalPracticaProfesional.Models
{
    public class Especialidad_Medico
    {
        [Key]
        public int Id_especialidad_medico { get; set; }

        [JsonIgnore]
        [ForeignKey("Id_Medico")]
        public virtual Medico Medico { get; set; }

        [ForeignKey("Id_Especialidad")]
        public int Id_Especialidad { get; set; }
    }
}
