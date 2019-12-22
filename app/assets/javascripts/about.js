$(document).on('turbolinks:load', function() {
  $("#calendar_about_page").fullCalendar({
    //カレンダーの設定
    height: 500,
    titleFormat: 'YYYY-MM',
    header: {
      left: 'title',
      center: '',
      right: 'prev,next'
    }
  });
});
