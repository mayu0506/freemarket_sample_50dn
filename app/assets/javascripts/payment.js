$(document).ready(function() {
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_2362ffdd3a64e8b3b2defe71');
  $(document).on("click", "#submit-button", function(e) {

    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    
    // カード情報生成
    var card = {
        number: $("#payment_card_no").val(),
        cvc: $("#payment_card_cvc").val(),
        exp_month: $("#payment_expiration_date_1i").val(),
        exp_year: $("#payment_expiration_date_2i").val(),
    };
    // トークンの生成
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        form.find('.charge-errors').text(response.error.message);
        form.find('button').prop('disabled', false);
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");

        form.append($('<input type="hidden" name="payjpToken" />').val(response.id));
        form.get(0).submit();
      }
    });
  });
});

