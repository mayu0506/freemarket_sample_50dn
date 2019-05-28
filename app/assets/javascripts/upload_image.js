$(function(){

   $('form').on('change', 'input[type="file"]', function(e) {
  
    var file = e.target.files[0],
        reader = new FileReader();
    var item = $(`<div class= "item"><img></div>`);
    var form_upload = $('#form_upload')

    reader.onload = (function(e) {
     
    var button_area = `<div class="button-area">
        <a class= "upload-edit">編集</a>
        <a class= "upload-delete">削除</a>
      </div>
      `
    item.append(button_area);
    item
      .find('img').attr({
        src: e.target.result,
        title: file.name,
        class:"item_image"
      });

    $(item).appendTo('#items')

    var image_length = $('img.item_image').length
    console.log(image_length)


    if (image_length == 0 ) {
      $('#items').hide();

      } else if (image_length > 0 && image_length < 5) {
        $('#product_image')
        .prop("required",false)
        .clone(true)
        .prependTo(form_upload);

        $('#product_image').nextAll()
        .hide();
      } else if (image_length == 5){

        $(form_upload).hide();
      }
    }
    );

    reader.readAsDataURL(file);
  });

})
