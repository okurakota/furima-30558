window.addEventListener('load', () => {
  const priceInput = document.getElementById("price");
  priceInput.addEventListener("input", () => {

    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor, inputValue * (0.1))
    
      const taxValue = (Math.floor, inputValue * (0.1))

      const addProfitDom = document.getElementById("profit");
      addProfitDom.innerHTML = inputValue - taxValue
 })
});