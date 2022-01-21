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
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("shipping_number").removeAttribute("name");
      document.getElementById("shipping_exp_month").removeAttribute("name");
      document.getElementById("shipping_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);