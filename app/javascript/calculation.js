window.addEventListener('load', () => {
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = Math.floor(inputValue * 0.1);
      addTaxDom.innerHTML = fee;
    const profitDom = document.getElementById("profit");
     if( fee>=1 ) {
     const totalProfit = inputValue - fee; 
     profitDom.innerHTML = totalProfit;
     }
     else {
      profitDom.innerHTML = 0;
     }
    })
   })
  