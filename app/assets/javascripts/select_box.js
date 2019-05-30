$(document).on('turbolinks:load', function(){
$(function(){

$('.root_category').on('change', function(){
  var parent_id = $(this).val();
  var parent_category = "parent_category"+ parent_id
  $('.hidden').hide();
  $('.' + parent_category).find('select').prop('disabled', false)
  $('.' + parent_category).css('display','block');
})

$('.parent_category').on('change', function(){
  var child_id = $(this).val();
  var child_category = "child_category" + child_id

  $('.hidden-child').hide().prop('disabled',false);
  
  $('.' + child_category).find('select').prop('disabled', false)
  $('.'+ child_category).css('display','block');

})

});
});
