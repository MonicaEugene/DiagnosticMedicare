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
    public class DoctorMedicareController : ControllerBase
    {
        Medicare_SystemContext ms = new Medicare_SystemContext();
        // GET: api/DoctorMedicare
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/DoctorMedicare/5
        [HttpGet("{id}", Name = "Get")]
        public TblMedicare Get(string id)
        {
            return ms.TblMedicare.FromSql("getMedicareServicesForDoc '" + id + "'").SingleOrDefault();
        }

        // POST: api/DoctorMedicare
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/DoctorMedicare/5
        [HttpPut("{id}")]
        public void Put(string id, [FromBody] TblMedicare medicareService)
        {
            ms.Database.ExecuteSqlCommand("updateMedicareService '" + medicareService.MdMedicareId + "','" + medicareService.MdMedicareService + "','" + medicareService.MdServiceDesp + "'," + medicareService.MdAmount);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
