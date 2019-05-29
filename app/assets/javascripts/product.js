  $(document).on('turbolinks:load', function(){
  $('.product-descriptions__pictures__main').slick({
    asNavFor: '.product-descriptions__pictures__main__sub',
    arrows: false, 
  });
  $('.product-descriptions__pictures__main__sub').slick({
    asNavFor: '.product-descriptions__pictures__main',
    slidesToShow: 5,
    slidesToScroll: 1,
    centerMode: true,
    focusOnSelect: true, 
    mouseover: true,
    prevArrow: false,
    nextArrow: false,
    variableWidth: true,
    centerMode: false,
   
  });
});
