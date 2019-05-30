
$(function(){
  var form = $('#new_product')
  var error_message = $('.error')
  var submit_button = $('#prodcuct_submit') 


  form.validate({
    rules: {
      name: {
        required: true,
        normalizer: function(value) {
          return $.trim(value);
        }
      },
      description: {required: true}

    },
    messages: {
      name: "入力してください"
    },


  });

})