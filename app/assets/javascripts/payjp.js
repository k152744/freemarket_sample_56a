if(document.URL.match("cards/new")){
  document.addEventListener(
    "DOMContentLoaded", (e) => {
      Payjp.setPublicKey("pk_test_85ee9e404a2187c0470a828d");
      const btn = document.getElementById('token_submit');
      btn.addEventListener("click", (e) => {
        e.preventDefault();

        const card = {
          number: document.getElementById("card_card_number").value,
          cvc: document.getElementById("card_cvc").value,
          exp_month: document.getElementById("card_exp_month").value,
          exp_year: document.getElementById("card_exp_year").value
        };

        Payjp.createToken(card, (status, response) => {
          if (status === 200) {
            $("#card_card_number").removeAttr("name");
            $("#card_cvc").removeAttr("name");
            $("#card_exp_month").removeAttr("name");
            $("#card_exp_year").removeAttr("name");
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); 
            document.inputForm.submit();
          } else {
            alert("カード情報が正しくありません。");
          }
        });
      });
    },false);
}