
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {

    const addTaxDom = document.getElementById("add-tax-price");
    const inputValue = priceInput.value;
    const value_result = inputValue * 0.1
    addTaxDom.innerHTML = value_result;

    const profitDom = document.getElementById("profit");
    const profitValue = priceInput.value;
    const profit_result = profitValue * 0.1
    profitDom.innerHTML = (Math.floor(profitValue - profit_result));
  })
});

