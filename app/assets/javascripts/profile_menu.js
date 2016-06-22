$(document).ready(function() {

$('.products-index').hide(); //Initially form wil be hidden.
$('.profile-settings').hide(); //Initially form wil be hidden.

 $('.profile-box').click(function() {
  $('.products-index').show();//Form shows on button click
  $('.profile-menu').hide();
  });

 $('.settings-box').click(function() {
  $('.profile-settings').show();
  $('.profile-menu').hide();
  });
});
