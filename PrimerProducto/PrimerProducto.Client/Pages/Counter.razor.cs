﻿using Microsoft.AspNetCore.Components;

namespace PrimerProducto.Client.Pages
{
    public partial class Counter
    {
        private int currentCount = 0;

        [Parameter]
        public int IncrementAmount { get; set; } = 1;

        private void IncrementCount()
        {
            currentCount += IncrementAmount;
        }

        string text = "";
    }
}
