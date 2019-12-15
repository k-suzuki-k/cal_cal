$(document).ready(function(){
  $("#calendar").fullCalendar({

    height: 510,

    titleFormat: 'YYYY/MM',
    header: {
      left: 'title',
      center: '',
      right: 'today prev,next'
    },

    //カレンダーの日付をクリックするとその日付のtodoを抽出する
    dayClick: function(date) {
      $.ajax({
        url: '/todos/search',
        type: 'GET',
        data: ('keyword=' + date.format()),
        processData: false,
        contentType: false,
        dataType: 'json'
      })
        .done(function(data){
          //todoリストのタイトルをクリックした日付にする
          $('.table_title').text(date.format('MM/DD'));
          //検索結果を表示させる
          $('#todo_search_result').find('td').remove();
          $('#todo_search_result').find('td').remove();
          $(data).each(function(i, todo){
            $('#todo_search_result').append('<tr>' + '</tr>')
            $('#todo_search_result').append('<td>' + todo.title + '</td>')
            $('#todo_search_result').append('<td>' + todo.content + '</td>')
          });
        });
    },

  });
});
$(document).on('turbolinks:load', function() {
    $('#calendar').fullCalendar({});
});

$(document).on('turbolinks:before-cache', function() {
    $('#calendar').empty();
});


//カレンダーの日付をダブルクリックすると入力フォームが表示される
$(document).ready(function(){
  $(document).on("dblclick", ".fc-day", function(){

    $('.todos_new_form').toggleClass('is_hide');
    $('.calendar_view').toggleClass('is_hide');

    var dblclick_day = $(this).data('date');
    $('#todo_day').val(dblclick_day);

  });
});

//入力フォームのボタンをクリックするとカレンダーへ戻る
$(document).ready(function(){
  $(document).on("click", ".to_calender_btn", function(){
    $('.todos_new_form').toggleClass('is_hide');
    $('.calendar_view').toggleClass('is_hide');
  });
});
