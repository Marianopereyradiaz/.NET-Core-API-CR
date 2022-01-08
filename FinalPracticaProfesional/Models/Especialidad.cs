using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FinalPracticaProfesional.Models
{
    public class Especialidad
    {
        [Key]
        public int Id_especialidad { get; set; }
        public string Nombre_especialidad { get; set; }
    }
}
