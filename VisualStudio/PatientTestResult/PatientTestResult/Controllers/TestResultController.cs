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
    public class TestResultController : ControllerBase
    {
        Medicare_SystemContext ms = new Medicare_SystemContext();
        // GET: api/TestResult
        [HttpGet]
        public IEnumerable<TblMedicalTestHistory> Get()
        {
            return ms.TblMedicalTestHistory.FromSql("getAllTestResults").ToList();
        }

        // GET: api/TestResult/5
        [HttpGet("{id}", Name = "Get")]
        [Route("api/PatientTestResult/{id}")]
        public IEnumerable<TblMedicalTestHistory> Get(string id)
        {
            return ms.TblMedicalTestHistory.FromSql("getAllTestResultsForPatient '" + id + "'").ToList();
        }
    }

}
