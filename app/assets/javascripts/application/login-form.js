$(function(){

$('#email_field, #password_field').keyup(function(){
//Email field animation
  if ($('#email_field').val() !== "" ) {
  $('#email_label').addClass('active highlight');
}
  else {
    $('#email_label').removeClass('active highlight');
  };
//Password field animation
  if ($('#password_field').val() !== "" ) {
  $('#password_label').addClass('active highlight');
  }
  else {
   $('#password_label').removeClass('active highlight'); 
  }

});

$('#signup_email_field, #signup_password_field, #signup_confirmation_field').keyup(function(){
//Signup email field animation
  if ($('#signup_email_field').val() !== "" ) {
  $('#signup_email_label').addClass('active highlight');
}
  else {
    $('#signup_email_label').removeClass('active highlight');
  };
//Signup password field animation
  if ($('#signup_password_field').val() !== "" ) {
  $('#signup_password_label').addClass('active highlight');
  }
  else {
   $('#signup_password_label').removeClass('active highlight'); 
  }

//Signup confirmation field animation
  if ($('#signup_confirmation_field').val() !== "" ) {
  $('#signup_confirmation_label').addClass('active highlight');
  }
  else {
   $('#signup_confirmation_label').removeClass('active highlight'); 
  }

});

//Tab switcher
$('.tab a').on('click', function (e) {
  e.preventDefault();
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  target = $(this).attr('href');
  $('.tab-content > div').not(target).hide();
  $(target).fadeIn(600);
});

});