$(document).ready(function() {
  var postTop = $('#post').offset().top;
  $('#share-box').css('top', postTop + 3);
  $(window).scroll(function() {
    if($(window).scrollTop() > (postTop - 40)) {
      $('#share-box').addClass('fixed');
    } else {
      $('#share-box').removeClass('fixed');
    }
  });
});
