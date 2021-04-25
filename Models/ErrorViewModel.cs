using System;

namespace acr_cicd_dotnetcore.Models
{
    public class ErrorViewModel
    {
        public string RequestId { get; set; }
        public DateTime DateOccurred { get; set; }

        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);
    }
}
