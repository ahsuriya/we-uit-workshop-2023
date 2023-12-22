using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Text.Json.Serialization;
using we_uit_workshop_2023.Model;

namespace we_uit_workshop_2023.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetCustomersList()
        {
            Customer customer = new Customer();
            DataTable dt = customer.GetCustomers();
            return new JsonResult(dt);
        }
    }
}
