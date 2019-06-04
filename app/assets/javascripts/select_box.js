$(document).on('turbolinks:load', function(){
$(function(){
// ルートカテゴリー変更時イベント
$('.root_category').on('change', function(){
  $('this').find('select').prop('required', true)
  var parent_id = $(this).val();
  var parent_category = "parent_category"+ parent_id;

  $('.hidden').hide();
  $('.' + parent_category).find('select').prop('disabled', false);
  $('.' + parent_category).find('select').prop('required', true);
  $('.' + parent_category).css('display','block');
})

// 親カテゴリー変更時イベント
$('.parent_category').on('change', function(){
  var child_id = $(this).val();
  var child_category = "child_category" + child_id

  $('.hidden-child').hide().prop('disabled',false);
  
  $('.' + child_category).find('select').prop('disabled', false);
  $('.' + child_category).find('select').prop('required', true)
  $('.'+ child_category).css('display','block');

})

});
});
