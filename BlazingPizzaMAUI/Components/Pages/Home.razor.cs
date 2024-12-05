using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using BlazingPizzaMAUI.ViewModel;
using BlazingPizzaMAUI.Domain.Models;


namespace BlazingPizzaMAUI.Components.Pages
{
    public partial class Home
    {
        [Inject]
        private PizzaApiViewModel ViewModel { get; set; } 

        private OrderViewModel OrderState { get; set; } 

        private bool showingConfigureDialog;
        private Pizza configuringPizza;
        private Order order => OrderState.Order; 
        protected override async Task OnInitializedAsync()
        {
            await ViewModel.LoadSpecialsAsync(); // Llamada al método del ViewModel para cargar especiales
            await base.OnInitializedAsync();
        }

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
                title = "¿Eliminar Pizza?",
                text = $"""¿Deseas eliminar la "{removePizza.Special!.Name}" de tu pedido?""",
                icon = "warning",
                buttons = new
                {
                    abort = new { text = "No, déjala en mi pedido", value = false },
                    confirm = new { text = "Sí, eliminar pizza", value = true }
                },
                dangerMode = true
            };

            if (await JavaScript.InvokeAsync<bool>("swal", messageParams))
            {
                OrderState.RemoveConfiguredPizza(removePizza);
            }
        }
    }
}
