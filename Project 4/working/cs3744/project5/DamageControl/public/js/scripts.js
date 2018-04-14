$(function() {
  // check cookie
  // var val = Cookies.get('noStickyNav');
  // if (val === undefined) {
  //   // no cookie for it, create it and set it to false
  //   Cookies.set('noStickyNav', 'false');
  // } else if (val === 'true') {
  //   // cookie is true, disable sticky navbar
  //   $('#mainNav').removeClass('sticky-top');
  // } else {
  //   // cookie is false, enable sticky navbar
  //   $('#mainNav').addClass('sticky-top');
  // }

  $('#hideNav').click(function() {
    // Cookies.set('noStickyNav', 'false');
    $('#mainNav').removeClass('sticky-top');
    // alert('you clicked the X');
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
