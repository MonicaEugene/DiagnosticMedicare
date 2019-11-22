using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PatientTestResult.Models;

namespace PatientTestResult.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicareServiceController : ControllerBase
    {
        Medicare_SystemContext ms = new Medicare_SystemContext();
        // GET: api/MedicareService
        [HttpGet]
        public IEnumerable<TblMedicare> Get()
        {
            return ms.TblMedicare.ToList();
        }

        // GET: api/MedicareService/5
        [HttpGet("{id}")]
        [Route("Service")]
        public TblMedicare Get(string id)
        {
            return ms.TblMedicare.FromSql("getMedicareServiceById '"+id+"'").SingleOrDefault();
        }
        
    }
}
