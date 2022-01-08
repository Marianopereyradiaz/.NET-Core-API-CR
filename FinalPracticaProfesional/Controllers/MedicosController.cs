using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FinalPracticaProfesional.Data;
using FinalPracticaProfesional.Models;

namespace FinalPracticaProfesional.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Produces("application/json")]
    public class MedicosController : ControllerBase
    {
        private readonly FinalPracticaProfesionalContext _context;

        public MedicosController(FinalPracticaProfesionalContext context)
        {
            _context = context;
        }

        // GET: api/Medicos
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Medico>>> GetMedicos()
        {

            return await _context.Medicos
                .Include(i => i.Domicilios)
                .Include(i => i.Emails)
                .Include(i => i.Formaciones)
                .Include(i => i.Telefonos)
                .Include(i => i.Especialidades_medico)
                .ToListAsync();
        }

        // GET: api/Medicos/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Medico>> GetMedico(int id)
        {
            var medico = await _context.Medicos.FindAsync(id);
            medico.Domicilios = await _context.Domicilios.Where(e => e.Medico.Id_medico == id).ToListAsync();
            medico.Emails = await _context.Emails.Where(e => e.Medico.Id_medico == id).ToListAsync();
            medico.Formaciones = await _context.Formaciones.Where(e => e.Medico.Id_medico == id).ToListAsync();
            medico.Telefonos = await _context.Telefonos.Where(e => e.Medico.Id_medico == id).ToListAsync();
            medico.Especialidades_medico = await _context.Especialidades_Medicos.Where(e => e.Medico.Id_medico == id).ToListAsync();

            if (medico == null)
            {
                return NotFound();
            }

            return medico;
        }

        // PUT: api/Medicos/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMedico(int id, Medico medico)
        {
            if (id != medico.Id_medico)
            {
                return BadRequest();
            }

            //_context.Entry(medico).State = EntityState.Modified;
            _context.Medicos.Update(medico);

            try
            {
                await _context.SaveChangesAsync();
                var medicoEditado = await _context.Medicos.FindAsync(id);
                return Ok(medicoEditado);
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MedicoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Medicos
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Medico>> PostMedico(Medico medico)
        {
            _context.Medicos.Add(medico);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMedico", new { id = medico.Id_medico }, medico);
        }

        // DELETE: api/Medicos/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMedico(int id)
        {
            var medico = await _context.Medicos.FindAsync(id);
            if (medico == null)
            {
                return NotFound();
            }

            _context.Medicos.Remove(medico);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool MedicoExists(int id)
        {
            return _context.Medicos.Any(e => e.Id_medico == id);
        }
    }
}
