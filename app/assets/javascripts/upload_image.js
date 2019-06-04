$(document).on('turbolinks:load', function(){
  $(function(){
    $('form').on('change', 'input[type="file"]', function(e) {
      var file = e.target.files[0],
          reader = new FileReader();
      var form_upload = $('#form_upload')
  

      reader.onload = (function(e) {
        var item = $(`<div class= "item"><img>
                        <div class="button-area">
                          <a class= "upload-edit">編集</a>
                          <a class= "upload-delete">削除</a>
                        </div>
                       </div>`);

        item
          .find('img').attr({
            src: e.target.result,
            title: file.name,
            class:"item_image"
          });

          $(item).appendTo('#items')
          var image_length = $('img.item_image').length
        item
          .find('.upload-delete').addClass('delete'+ image_length);

        if (image_length == 0 ) {
          $('#items').hide();
         
          } else if (image_length > 0 && image_length < 5) {
            $('#product_image')
            .removeClass()
            .addClass('upload'+ image_length)
            .prop("required",false)
            .clone(true)
            .val('')
            .removeClass()
            .prependTo(form_upload);
            $('#product_image').nextAll()
            .hide();

          } else if (image_length == 5){
            $(form_upload).hide();
          }
      });
      reader.readAsDataURL(file);
    });

// 画像の削除

  $(document).on('click','.upload-delete' ,function(){
    var target_image = $(this).parent().parent();
    target_image.remove();
    var item_length = $('.item').length;
    if (item_length==0) {
      $('#product_image').prop('required',true);
    }
  })

  $(document).on('click','.delete1' ,function(){
    $('input.upload1').remove();
  })
  $(document).on('click','.delete2' ,function(){
    $('input.upload2').remove();
  })
  $(document).on('click','.delete3' ,function(){
    $('input.upload3').remove();
  })
  $(document).on('click','.delete4' ,function(){
    $('input.upload4').remove();
  })
  $(document).on('click','.delete5' ,function(){
    $('input.upload5').remove();
    $(form_upload).show();
  })

  })
});
