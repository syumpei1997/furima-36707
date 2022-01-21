const pay = () => {
  Payjp.setPublicKey("pk_test_fc16dc646b9274ee804d60f9");
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

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);