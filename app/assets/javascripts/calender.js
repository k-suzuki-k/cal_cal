$(document).on('turbolinks:load', function() {
  $("#calendar").fullCalendar({
    //カレンダーの設定
    height: 510,
    titleFormat: 'YYYY-MM',
    header: {
      left: 'title',
      center: '',
      right: 'prev,next'
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
          $('.table_title').text(date.format('YYYY-MM-DD'));

          //検索結果を表示させるために前のtodolistを削除する
          $('#todo_search_result').find('tr').remove();
          $('#todo_search_result').find('td').remove();

          //todoリストの作成
          $(data).each(function(i, todo){
            //開始時間のフォーマット
            if (todo.start_time != null) {
            var todo_day_for_start_time = new Date(todo.start_time);
            var start_time = todo_day_for_start_time.toTimeString().split(' ')[0].split(/:\d{2}$/)[0];
            } else {
            var start_time = '-';

            }
            //終了時間のフォーマット
            if (todo.end_time != null) {
            var todo_day_for_end_time = new Date(todo.end_time);
            var end_time = todo_day_for_end_time.toTimeString().split(' ')[0].split(/:\d{2}$/)[0];
            } else {
            var end_time = '-';

            }
            $('#todo_search_result').append('<tr id=todo_' + todo.id + '></tr>')
            $('#todo_search_result').append('<td>' + start_time + '</td>')
            $('#todo_search_result').append('<td>' + end_time + '</td>')
            $('#todo_search_result').append('<td>' + todo.title + '</td>')
          });
        });
    },

  });
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


//入力フォームの日付を変えると非同期で検索する
$(document).on('turbolinks:load', function() {

  $('#todo_day').on('input', function(event){

    var change_day = event.currentTarget.value;

    $.ajax({
      url: '/todos/search',
      type: 'GET',
      data: ('keyword=' + change_day),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
      .done(function(data){
        //todoリストのタイトルをクリックした日付にする
        $('.table_title').text(change_day);
        //検索結果を表示させる
        $('#todo_search_result').find('td').remove();
        $('#todo_search_result').find('td').remove();

        //todoリストの作成
        $(data).each(function(i, todo){
          //開始時間のフォーマット
          if (todo.start_time != null) {
            var todo_day_for_start_time = new Date(todo.start_time);
            var start_time = todo_day_for_start_time.toTimeString().substr(0,5);
          } else {
            var start_time = '-';
          }
          //終了時間のフォーマット
          if (todo.end_time != null) {
            var todo_day_for_end_time = new Date(todo.end_time);
            var end_time = todo_day_for_end_time.toTimeString().substr(0,5);
          } else {
            var end_time = '-';
          }
          $('#todo_search_result').append('<tr id=todo_' + todo.id + '></tr>')
          $('#todo_search_result').append('<td>' + start_time + '</td>')
          $('#todo_search_result').append('<td>' + end_time + '</td>')
          $('#todo_search_result').append('<td>' + todo.title + '</td>')
        });
      });
  });
});

// 初回のデータ取得
$(document).on('turbolinks:load', function() {

  var today_date = moment();

  $.ajax({
    url: '/todos/search',
    type: 'GET',
    data: ('keyword=' + today_date.format('YYYY-MM-DD')),
    processData: false,
    contentType: false,
    dataType: 'json'
  })
    .done(function(data){
      //todoリストのタイトルをクリックした日付にする
      $('.table_title').text(today_date.format('YYYY-MM-DD'));
      //検索結果を表示させる
      $('#todo_search_result').find('td').remove();
      $('#todo_search_result').find('td').remove();

      //todoリストの作成
      $(data).each(function(i, todo){
        //開始時間のフォーマット
        if (todo.start_time != null) {
          var todo_day_for_start_time = new Date(todo.start_time);
          var start_time = todo_day_for_start_time.toTimeString().substr(0,5);
        } else {
          var start_time = '-';
        }
        //終了時間のフォーマット
        if (todo.end_time != null) {
          var todo_day_for_end_time = new Date(todo.end_time);
          var end_time = todo_day_for_end_time.toTimeString().substr(0,5);
        } else {
          var end_time = '-';
        }
          $('#todo_search_result').append('<tr id=todo_' + todo.id + '></tr>')
          $('#todo_search_result').append('<td>' + start_time + '</td>')
          $('#todo_search_result').append('<td>' + end_time + '</td>')
          $('#todo_search_result').append('<td>' + todo.title + '</td>')
        });
      });
    });
