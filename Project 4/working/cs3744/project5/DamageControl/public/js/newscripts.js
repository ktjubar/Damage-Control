$(function() {
  $('#crewDesc').froalaEditor({
    height: 300
  })

  $('#articleBody').froalaEditor({
    height: 450
  })

  $('#userDesc').froalaEditor({
    height: 300
  })

  $("a[href$='https://www.froala.com/wysiwyg-editor?k=u']").hide();

  // size_li = $("#articleDisplay .postinf").length();
  //   x=5;
  //   $('#myList .postinf:lt('+x+')').show();
  //   $('#loadMore').click(function () {
  //       x= (x+5 <= size_li) ? x+5 : size_li;
  //       $('#myList li:lt('+x+')').show();
  //       if (x > 5) {
  //         $('#showLess').show();
  //       }
  //       if (x == size_li) {
  //         $('#loadMore').hide();
  //       }
  //   });
  //   $('#showLess').click(function () {
  //       x=(x-5<0) ? 5 : x-5;
  //       $('#myList li').not(':lt('+x+')').hide();
  //       if (x <= 5) {
  //         $('#showLess').hide();
  //       }
  //       if (x != size_li) {
  //         $('#loadMore').show();
  //       }
  //   });
});
