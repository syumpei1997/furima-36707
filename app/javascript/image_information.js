
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {

    const addTaxDom = document.getElementById("add-tax-price");
    const inputValue = priceInput.value;
    const value_result = inputValue * 0.1
    console.log(value_result)
    addTaxDom.innerHTML = value_result;
      console.log(addTaxDom);

    const profitDom = document.getElementById("profit");
    const profitValue = priceInput.value;
    const profit_result = profitValue * 0.1
    console.log(profit_result)
    profitDom.innerHTML = (Math.floor(profitValue - profit_result));
      console.log(profit);
  })
});

