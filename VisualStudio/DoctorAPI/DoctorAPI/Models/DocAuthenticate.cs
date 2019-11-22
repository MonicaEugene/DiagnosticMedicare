using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DoctorAPI.Models
{
    public class DocAuthenticate
    {
        public string DrUserId { get; set; }
        public string DrFirstName { get; set; }
        public string DrLastName { get; set; }
        public int? DrAge { get; set; }
        public string DrGender { get; set; }
        public long? DrContactNo { get; set; }
        public string DrEmail { get; set; }
        public string DrPassword { get; set; }
        public string DrCity { get; set; }
        public string DrState { get; set; }
        public string DrSpeciality { get; set; }
        public string DrClinicName { get; set; }
        public string DrMdMedicareServiceId { get; set; }
        public bool? DrStatus { get; set; }
    }
}
