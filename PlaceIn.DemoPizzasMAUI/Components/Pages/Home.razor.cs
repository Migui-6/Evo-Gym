using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using PlaceIn.DemoPizzas.Domain.Models;
using PlaceIn.DemoPizzas.Domain.Services;
using ServiceStack;
using System.Net.Http.Json;


namespace PlaceIn.DemoPizzasMAUI.Components.Pages
{
    public partial class Home : ComponentBase
    {
        [Inject] 
        private OrderState OrderState { get; set; }

        [Inject]
        private HttpClient Http { get; set; }

        [Inject]
        private NavigationManager NavigationManager { get; set; }

        [Inject]
        private IJSRuntime JSRuntime { get; set; }

        [Inject]
        public IHttpClientFactory ClientFactory { get; set; }




        List<PizzaSpecial> specials { get; set; } = new();
        //List<PizzaSpecial> Pizzas { get; set; } = new();

        Pizza configuringPizza; 
        bool showingConfigureDialog;
        Order order => OrderState.Order;

        protected override async Task OnInitializedAsync()
        {

            
            
            try
            {
                var client = ClientFactory.CreateClient("BlazorServer");
                specials = await client.GetFromJsonAsync<List<PizzaSpecial>>("specials");
                //var pizzas = await Http.GetFromJsonAsync<List<PizzaSpecial>>("api/Saludos");
                //if (pizzas != null)
                //{
                //    Pizzas.Clear();
                //    Pizzas.AddRange(pizzas);
                //}


            }
            catch (Exception)
            {
            }

            await base.OnInitializedAsync();
        }


        // Métodos adicionales o lógica para manejar configuringPizza o showingConfigureDialog pueden ir aquí.

        void CancelConfigurePizzaDialog()
        {
            configuringPizza = null;
            showingConfigureDialog = false;
        }

        void ConfirmConfigurePizzaDialog()
        {
            if (configuringPizza is not null)
            {
                order.Pizzas.Add(configuringPizza);
                configuringPizza = null;
            }

            showingConfigureDialog = false;
        }

        async Task RemovePizzaConfirmation(Pizza removePizza)
        {
            var messageParams = new
            {
                title = "Remove Pizza?",
                text = $"""Do you want to remove the "{removePizza.Special!.Name}" from your order?""",
                icon = "warning",
                buttons = new
                {
                    abort = new { text = "No, leave it in my order", value = false },
                    confirm = new { text = "Yes, remove pizza", value = true }
                },
                dangerMode = true
            };

            if (await JSRuntime.InvokeAsync<bool>("swal", messageParams))
            {
                OrderState.RemoveConfiguredPizza(removePizza);
            }
        }
    }
}


