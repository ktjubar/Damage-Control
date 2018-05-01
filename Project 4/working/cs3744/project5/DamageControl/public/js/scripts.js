$(function(){
  $('#registerUsername').on('blur', function(e){
    e.preventDefault();

    $('#loaderIcon').show();

    $.ajax({
      url: '<?= BASE_URL ?>/app/check_availability.php',
      type: 'post',
      data: {'username': $('#registerUsername').val()},
      complete: function(data, status) {
        $('#loaderIcon').hide();
        if(data == "ok") {
          // $('#registerUsernameGroup').removeClass('has-danger');
          // $('#registerUsernameGroup').addClass('has-success');
          $('#registerUsername').removeClass('is-invalid');
          $('#registerUsername').addClass('is-valid');
          $('#takenUsername').hide();
        } else {
          // $('#registerUsernameGroup').addClass('has-danger');
          // $('#registerUsernameGroup').removeClass('has-success');
          $('#registerUsername').addClass('is-invalid');
          $('#registerUsername').removeClass('is-valid');
          $('#takenUsername').show();
        }
      },
      error: function(xhr, desc, err) {
        console.log(xhr);
        console.log("Details: " + desc + "\nError:" + err);
      }
    }); // end ajax call
  });
});

function userRank(num) {
  switch (num) {
    case 0:
      return 'New User';
    case 1:
      return 'Member';
    case 2:
      return 'Administrator';
    default:
      return 'undefined';
  }
}
