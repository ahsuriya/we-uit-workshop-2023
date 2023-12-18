using Microsoft.AspNetCore.Mvc;

namespace we_uit_workshop_2023.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
            _logger.Log(LogLevel.Information, "Requesting the WeatherForecast Controller");
        }

        [HttpGet(Name = "GetWeatherForecast")]
        public IEnumerable<WeatherForecast> Get()
        {
            return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = Random.Shared.Next(-20, 55),
                Summary = Summaries[Random.Shared.Next(Summaries.Length)]
            })
            .ToArray();
        }

        [HttpGet("TwoNumbersSum")]
        public int Sum(int n1, int n2)
        {
            int n3 = n1 + n2;
            return n3;
        }

        [HttpGet("ThreeNumbersMultiply")]
        public decimal Sum(float n1, float n2, float n3)
        {
            return Convert.ToDecimal(n1 * n2 * n3);
        }
    }
}