const pay = () => {
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("shipping_purchase[number]"),
      exp_month: formData.get("shipping_purchase[exp_month]"),
      exp_year: `20${formData.get("shipping_purchase[exp_year]")}`,
    };
    console.log(card)
  });
};

window.addEventListener("load", pay);