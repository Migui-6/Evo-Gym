using Microsoft.AspNetCore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace BlazorHybridApp.Components.Pages
{
    public partial class Weather
    {
        //[Inject]
        //public HttpClient _http { get; set; }
        private List<WeatherForecast> forecasts;

        protected override async Task OnInitializedAsync()
        {
            // Simulate asynchronous loading to demonstrate a loading indicator
            await Task.Delay(500);

            var startDate = DateOnly.FromDateTime(DateTime.Now);

            HttpClient _http = new();
            forecasts = await _http.GetFromJsonAsync<List<WeatherForecast>>(new Uri("http://localhost:5000/Weatherforecast"));

            //var summaries = new[] { "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching" };
            //forecasts = Enumerable.Range(1, 5).Select(index => new WeatherForecast
            //{
            //    Date = startDate.AddDays(index),
            //    TemperatureC = Random.Shared.Next(-20, 55),
            //    Summary = summaries[Random.Shared.Next(summaries.Length)]
            //}).ToArray();
        }

        private class WeatherForecast
        {
            public DateOnly Date { get; set; }
            public int TemperatureC { get; set; }
            public string? Summary { get; set; }
            public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
        }
    }
}
