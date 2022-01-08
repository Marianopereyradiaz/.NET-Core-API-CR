using FinalPracticaProfesional.Models;
using Microsoft.EntityFrameworkCore;

namespace FinalPracticaProfesional.Data
{
    public class FinalPracticaProfesionalContext : DbContext
    {
        public FinalPracticaProfesionalContext(DbContextOptions<FinalPracticaProfesionalContext> options)
            : base(options)
        {
        }

        public DbSet<Medico> Medicos { get; set; }
        public DbSet<Domicilio> Domicilios { get; set; }
        public DbSet<Telefono> Telefonos { get; set; }
        public DbSet<Titulo> Titulos { get; set; }
        public DbSet<Formacion> Formaciones { get; set; }
        public DbSet<Email> Emails { get; set; }
        public DbSet<Especialidad> Especialidades { get; set; }
        public DbSet<Especialidad_Medico> Especialidades_Medicos { get; set; }

    }
}
