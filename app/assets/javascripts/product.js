$(document).ready(function(){
  $('.product-descriptions__pictures__main').slick({
    asNavFor: '.product-descriptions__pictures__main__sub',
    arrows: false, 
  });
  $('.product-descriptions__pictures__main__sub').slick({
    asNavFor: '.product-descriptions__pictures__main',
    slidesToShow: 3,
    slidesToScroll: 1,
    centerMode: true,
    focusOnSelect: true, 
    mouseover: true,
    prevArrow: false,
    nextArrow: false,
  });
});
