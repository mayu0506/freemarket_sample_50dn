$(function(){
  var input = $('#product_images_attributes_0_image');
  $(input).on('change',function(){
    if( !this.files.length) {
      return;
    }
    $preview = $(".preview");
    var $files = $(this).prop('files');
    var file_length = $files.length;

    for(var i = 0; i < file_length; i++ ) {
      var file = $files[i];
      var reader = new FileReader();

      reader.onload = function(e) {
        var src = e.target.result;
        var img = '<img src="'+ src +'">';
        $('#preview').append(img);
      }
      reader.readAsDataURL(file);
    }

    $('#preview').css('display','inline-block');

  })

})
