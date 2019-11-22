using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DoctorAPI.Models;

namespace DoctorAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DoctorAppointmentsController : ControllerBase
    {
        Medicare_SystemContext ms = new Medicare_SystemContext();
        // GET: api/DoctorAppointments/{id}
        [HttpGet("{id}")]
        public IEnumerable<TblAppointment> Get(string id)
        {
            return ms.TblAppointment.FromSql("getDoctorAppointments '"+id+"'");
        }
       

        // POST: api/DoctorAppointments
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/DoctorAppointments/5
        [HttpPut("{id}")]
        public void Put(string id, [FromBody] TblAppointment appointment)
        {
            ms.Database.ExecuteSqlCommand("updateAppointmentStatus '"+id+"',"+appointment.ApStatus);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(string id)
        {
            ms.Database.ExecuteSqlCommand("rejectAppointment '" + id + "'");
        }
    }
}
