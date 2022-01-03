
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    const value_result = inputValue * 0.1
    console.log(value_result)
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
      console.log(profitNumber);
  })
});

