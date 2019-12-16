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


//todoをクリックすると詳細フォームが表示される
$(document).ready(function(){
  $(document).on("click", ".todo_row", function(){

    $('.todo_edit_view').removeClass('is_hide');
    $('.todos_new_form').addClass('is_hide');
    $('.calendar_view').addClass('is_hide');
    $('.todo_show_view').addClass('is_hide');

  });
});
