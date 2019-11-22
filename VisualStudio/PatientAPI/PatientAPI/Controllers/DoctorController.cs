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
    public class DoctorController : ControllerBase
    {
        Medicare_SystemContext ms = new Medicare_SystemContext();
        // GET: api/Doctor
        [HttpGet(Name ="GetAllDoctorDetails")]
        [Route("GetAllDoctors")]
        public IEnumerable<TblDoctor> Get()
        {
            return ms.TblDoctor.ToList();
        }
        
    }
}
