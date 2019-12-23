//時間入力の補助
$(document).on('turbolinks:load click', function() {
  $('.timepicker').timepicker({
    'timeFormat': 'H:i',
    'step': 15,
    'forceRoundTime': true,
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
