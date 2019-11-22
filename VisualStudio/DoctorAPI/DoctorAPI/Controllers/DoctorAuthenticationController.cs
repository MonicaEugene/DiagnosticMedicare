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
    public class DoctorAuthenticationController : ControllerBase
    {
        Medicare_SystemContext ms = new Medicare_SystemContext();
        // GET: api/DoctorAuthentication
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/DoctorAuthentication/5
        [HttpGet]
        [Route("AuthenticateDoc")]
        public TblDoctor Get(string username, string password)

        {
            List<TblDoctor> Docs = new List<TblDoctor>();
            Docs = ms.TblDoctor.ToList();
            foreach(TblDoctor item in Docs)
            {
                if (item.DrEmail == username && item.DrPassword == password)
                    return item;
            }
            return null;
        }

        // POST: api/DoctorAuthentication
        [HttpPost]
        public void Post([FromBody] TblDoctor doctorDetails)
        {
            ms.Database.ExecuteSqlCommand("registerDoctor'"+doctorDetails.DrFirstName + "','" +doctorDetails.DrLastName+ "'," +doctorDetails.DrAge+ ",'" +doctorDetails.DrGender+ "','" +doctorDetails.DrDob+ "'," +doctorDetails.DrContactNo+ "," +doctorDetails.DrAltContactNo+ ",'" + doctorDetails.DrEmail+ "','" + doctorDetails.DrPassword+ "','" + doctorDetails.DrAddress1+ "','" + doctorDetails.DrAddress2 + "','" + doctorDetails.DrCity + "','" + doctorDetails.DrState + "'," + doctorDetails.DrZipcode + ",'" + doctorDetails.DrDegree + "','" + doctorDetails.DrSpeciality + "','" + doctorDetails.DrWorkHours + "','" + doctorDetails.DrClinicName + "','" + doctorDetails.DrMdMedicareServiceId + "'," + doctorDetails.DrStatus);
        }

        // PUT: api/DoctorAuthentication/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
