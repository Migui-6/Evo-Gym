using BlazingPizzaMAUI.Domain.Models;
using MvvmHelpers;
using System.Collections.ObjectModel;

namespace BlazingPizzaMAUI.ViewModel
{
    public class OrderViewModel : BaseViewModel
    {
        private bool showingConfigureDialog;
        private Pizza? configuringPizza;

        public bool ShowingConfigureDialog
        {
            get => showingConfigureDialog;
            set => SetProperty(ref showingConfigureDialog, value); // Notifica el cambio de propiedad
        }

        public Pizza? ConfiguringPizza
        {
            get => configuringPizza;
            private set => SetProperty(ref configuringPizza, value); // Notifica el cambio de propiedad
        }

        public Order Order { get; private set; } = new Order();

        // Método para mostrar el diálogo de configuración de pizza
        public void ShowConfigurePizzaDialog(PizzaSpecial special)
        {
            ConfiguringPizza = new Pizza()
            {
                Special = special,
                SpecialId = special.Id,
                Size = Pizza.DefaultSize,
                Toppings = new List<PizzaTopping>(),
            };

            ShowingConfigureDialog = true;
        }

        // Método para cancelar el diálogo de configuración
        public void CancelConfigurePizzaDialog()
        {
            ConfiguringPizza = null;
            ShowingConfigureDialog = false;
        }

        // Método para confirmar la configuración de la pizza
        public void ConfirmConfigurePizzaDialog()
        {
            if (ConfiguringPizza is not null)
            {
                Order.Pizzas.Add(ConfiguringPizza);
                ConfiguringPizza = null;
            }

            ShowingConfigureDialog = false;
        }

        // Método para eliminar una pizza configurada
        public void RemoveConfiguredPizza(Pizza pizza)
        {
            Order.Pizzas.Remove(pizza);
        }

        // Método para reiniciar el pedido
        public void ResetOrder()
        {
            Order = new Order();
        }

        public List<PizzaSpecial> Specials { get; private set; }
    }
}
