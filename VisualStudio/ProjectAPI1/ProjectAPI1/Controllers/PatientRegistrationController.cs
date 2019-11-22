using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectAPI1.Model;

namespace ProjectAPI1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PatientRegistrationController : ControllerBase
    {
        Medicare_SystemContext obj = new Medicare_SystemContext();
        // GET: api/PatientRegistration
        [HttpGet]
        public IEnumerable<TblPatient> Get()
        {
            return obj.TblPatient.FromSql("getAllPatientDetails").ToList();
        }

        // POST: api/PatientRegistration
        [HttpPost]
        public void Post([FromBody] TblPatient patientDetails)
        {
            obj.Database.ExecuteSqlCommand("registerPatientDetails'" + patientDetails.PtFirstName + "','" + patientDetails.PtLastName + "'," + patientDetails.PtAge + ",'" + patientDetails.PtGender + "','" + patientDetails.PtDob + "'," + patientDetails.PtContactNo + "," + patientDetails.PtAltContactNo + ",'" + patientDetails.PtEmail + "','" + patientDetails.PtPassword + "','" + patientDetails.PtAddress1 + "','" + patientDetails.PtAddress2 + "','" + patientDetails.PtCity + "','" + patientDetails.PtState + "'," + patientDetails.PtZipcode + "," + patientDetails.PtStatus);
        }


    }
}
