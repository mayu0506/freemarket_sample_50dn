$(document).on('turbolinks:load', function(){
$(function(){
  var form = $('#product_price')
 
  form.keyup(function(){
    var input_price = $(this).val()
    if(input_price >= 300 && input_price < 9999999) {

    var charge_price = Math.floor(input_price*0.1)
    $('#charge').html('¥').append(charge_price);

    var profit_price = (input_price - charge_price).toLocaleString();
    $('#profit').html('¥').append(profit_price);

    }
    else {
      $('#charge, #profit').empty();
    }
  })

});
});
