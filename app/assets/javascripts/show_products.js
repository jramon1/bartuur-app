$(document).ready(function() {

$('#carousel-container').hide(); //Initially form wil be hidden.

 $('#product-photo').click(function() {
  $('#carousel-container').show();//Form shows on button click
  $('#product-description').hide();
  });

 $('#go-back').click(function() {
  $('#product-description').show();
  $('#carousel-container').hide();
  });
});

