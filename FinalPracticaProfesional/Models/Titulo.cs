using System.ComponentModel.DataAnnotations;

namespace FinalPracticaProfesional.Models
{
    public class Titulo
    {
        [Key]
        public int Id_Titulo { get; set; }
        public string Nombre_Titulo { get; set; }
    }
}
