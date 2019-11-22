using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PatientAPI.Models;

namespace PatientAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AppointmentController : ControllerBase
    {
        Medicare_SystemContext ms = new Medicare_SystemContext();

        // GET: api/Appointment
        [HttpGet]
        public IEnumerable<TblAppointment> Get()
        {
            return ms.TblAppointment.FromSql("getAllAppointments").ToList();
        }

        // GET: api/Appointment/5
        [HttpGet("{userid}", Name = "GetUserAppointments")]
        [Route("UserAppointments")]
        public IEnumerable<TblAppointment> Get(string userid)
        {
            return ms.TblAppointment.FromSql("getAllAppointmentsForPatient '" + userid + "'").ToList();
        }

        

        // POST: api/Appointment
        [HttpPost]
        public void Post([FromBody] TblAppointment appointment)
        {
            ms.Database.ExecuteSqlCommand("insertAppointment '" + appointment.ApDrUserId + "','" + appointment.ApMdMedicareServiceId +
                "','" + appointment.ApPtUserId + "','" + appointment.ApDate + "','" + appointment.ApTime + "'," + appointment.ApStatus);
        }

        // PUT: api/Appointment/5
        [HttpPut]
        public void Put([FromBody] TblAppointment appointmentUpdate)
        {
            ms.Database.ExecuteSqlCommand("updateAppointment '" + appointmentUpdate.ApAppointmentId + "','" + appointmentUpdate.ApDrUserId +
                "','" + appointmentUpdate.ApMdMedicareServiceId + "','" + appointmentUpdate.ApPtUserId + "','" + appointmentUpdate.ApDate +
                "','" + appointmentUpdate.ApTime + "'");
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{appointmentid}")]
        [Route("api/Appointment/{appointmentid}")]
        public void Delete(string appointmentid,string ptUserId)
        {
            ms.Database.ExecuteSqlCommand("deleteAppointmentPatient '" + appointmentid + "','"+ptUserId+"'");
        }
    }
}
