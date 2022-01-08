using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace FinalPracticaProfesional.Models
{
    public class Medico
    {
        [Key]
        public int Id_medico { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public virtual ICollection<Email> Emails { get; set; }
        public virtual ICollection<Telefono> Telefonos { get; set; }
        public virtual ICollection<Domicilio> Domicilios { get; set; }
        public virtual ICollection<Formacion> Formaciones { get; set; }
        public virtual ICollection<Especialidad_Medico> Especialidades_medico { get; set; }

    }
}
