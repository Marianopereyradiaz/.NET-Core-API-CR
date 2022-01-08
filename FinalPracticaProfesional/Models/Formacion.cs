using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace FinalPracticaProfesional.Models
{
    public class Formacion
    {
        [Key]
        public int Id_Formacion { get; set; }
        public DateTime Fecha { get; set; }
        public string Lugar { get; set; } 

        [ForeignKey("Id_Titulo")]
        public int Id_titulo { get; set; }

        [JsonIgnore]

        [ForeignKey("Id_Medico")]
        public virtual Medico Medico { get; set; }

    }
}
