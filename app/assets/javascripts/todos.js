//時間入力の補助
$(document).on('turbolinks:load', function() {
  $('.timepicker').timepicki({
    show_meridian:false,
    min_hour_value:0,
    max_hour_value:23,
    step_size_minutes:5,
    overflow_minutes:true,
    increase_direction:'up',
    disable_keyboard_mobile: true});
});
$(document).ready(function(){
  $(document).on("click", ".timepicker", function() {
    $('.timepicker').timepicki({
      show_meridian:false,
      min_hour_value:0,
      max_hour_value:23,
      step_size_minutes:5,
      overflow_minutes:true,
      increase_direction:'up',
      disable_keyboard_mobile: true});
  });
});


//todoをクリックすると詳細フォームが表示される
$(document).ready(function(){
  $(document).on("click", ".todo_row", function(){

    var clicked_todo_id = this.id.split(/todo_/)[1];
    var url_id = location.href.split('/')[4];

    $.ajax({
      url: '/calender/' + url_id + '/todos/show',
      type: 'GET',
      data: ('keyword=' + clicked_todo_id),
      processData: false,
      contentType: false,
      dataType: 'script'
    });
  });
});
