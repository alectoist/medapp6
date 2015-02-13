$(function() {
//Email field animation
$('#email_field').focus( function (){
  $('#email_label').addClass('active highlight');
});

$('#email_field').focusout( function (){
  $('#email_label').removeClass('active highlight');
  });

//Password field animation
$('#password_field').focus( function (){
  $('#password_label').addClass('active highlight');
});

$('#password_field').focusout( function (){
  $('#password_label').removeClass('active highlight');
  });



$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();
  
  $(target).fadeIn(600);
  
});

});