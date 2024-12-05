using BlazingPizzaMAUI.Domain.Models;

namespace BlazingPizzaMAUI.Data
{
    public class PizzaService
    {
        public Task<Pizza[]> GetPizzasAsync()
        {
            // Call your data access technology here
            return Task.FromResult(new Pizza[0]);
        }
    }
}
