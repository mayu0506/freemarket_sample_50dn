$(document).on('turbolinks:load', function(){
  var swiper = new Swiper('.swiper-container', {
    pagination:{el: '.swiper-pagination',type: 'bullets',clickable: true},
    paginationClickable: true,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    loop:true,
    autoplay: {
      delay: 3000,
      disableOnInteraction: true
    },
  });
});
