$(document).ready(function() {
  $('.modal-login').on('click', function() {
    var email = $('#email').val();
    var password = $('#password').val();

    $.ajax({
      url: "/user/login_api/",
      type: 'POST',
      async: false,
      data: { email: email, password: password },
      dataType : "json",
      success: function(data) {
        if (data['login']) {
          window.location.href = window.location.href;
        } else {
          var html = `<div class='alert alert-dismissible alert-danger mb-20'>
            <div id='danger'>Invalid email or password.</div>
          </div>`

          if ($('.alert-dismissible').length > 0) {
            $('.alert-dismissible').remove();
          }

          $('.login-modal-title').before(html);
        }
      }
    });
  })
})