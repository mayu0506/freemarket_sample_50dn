// カテゴリーセレクトボックスの非同期部（時間があれば実装）
// $(document).on('turbolinks:load', function(){
//   var category = $('#category')

//   // selectの追加メソッド
//   function appendSelect(catNum) {
//     if (catNum == 1) {
//       var select_id = 'child_select'
//     } else if (catNum == 2){
//       var select_id = 'grandChild_select'
//     }

//     var html =
//     `<select name="product[category_id]" id="${select_id}">
//         <option value>---</option>
//     </select>`
//     category.append(html)
//   }

//   // optionの追加メソッド
//   function appendCat(catOption, catNum) {
//     if (catNum == 1 ) {
//       var appendId = $('#child_select')
//     } else if (catNum == 2) {
//       var appendId = $('#grandChild_selec')
//     }
//     appendId.append(
//       $("<option>")
//         .val($(catOption).attr('id'))
//         .text($(catOption).attr('name'))
//     )
//   }

//   // ルートカテゴリーが選択された時のアクション
//   $('#roots_categoy').on('change', function(){

//     r_cat = $(this).val()
//     console.log(r_cat)
//     $("#child_select, #grandChild_select").remove()

//     $.ajax({
//       type: "GET",
//       url: window.location.href,
//       data: {r_cat: r_cat},
//       dataType: 'json',
//       processData: false,
//       contentType: false,
//     })

//     .done(function(c_cat){
//       alert('sucsess!')

//       var catNum = 1
//       appendSelect(catNum)
//       c_cat.forEach(function(c_cat){
//       appendCat(c_cat, catNum)
//       })
//     })

//     .error(function(XMLHttpRequest, textStatus, errorThrown){
      
//       alert('error!');
//       console.log("XMLHttpRequest : " + XMLHttpRequest.status);
// 　　  console.log("textStatus     : " + textStatus);
// 　　  console.log("errorThrown    : " + errorThrown.message);

//     })
//   })


//   // Mカテゴリーが選択された時のアクション
//   $(document).on('change', '#child_select', function(){
//     c_cat = $(this).val()
//     $('#grandChild_selec').remove()

//     $.ajax({
//       type: "GET",
//       url: "/products/new",
//       data: {c_cat: c_cat},
//       dataType: 'json'
//     })
//     .done(function(g_cat){
//       var catNum = 2
//       appendSelect(catNum)
//       g_cat.forEach(function(g_cat){
//         appendCat(g_cat, catNum)
//       })
//     })




//   })






// })