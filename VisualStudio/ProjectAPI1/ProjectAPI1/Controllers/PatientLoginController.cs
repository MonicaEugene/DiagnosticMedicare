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
    public class PatientLoginController : ControllerBase
    {
        Medicare_SystemContext ms = new Medicare_SystemContext();
        [HttpGet]
        public IEnumerable<TblPatient> Get()
        {
            return ms.TblPatient.FromSql("getAllPatientDetails").ToList(); ;
        }

        // GET: api/PatientLogin/5
        [HttpGet]
        [Route("Login")]
        public TblPatient GetLogin(string loginUsername, string loginPassword)
        {
            return ms.TblPatient.FromSql("authenticatePatient '"+loginUsername+"','"+loginPassword+"'").SingleOrDefault();
        }

        
    }
}
