$(document).on('turbolinks:load', function() {
  $("#calendar").fullCalendar({

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
$(document).ready(function(){

  $('#todo_day').on('input', function(event){

    var change_day = event.currentTarget.value;

    //var change_day = document.getElementById("todo_day").value;

    //debugger;

    //var input_day = event.currentTarget.value;

    //var create_ymd = input_day.replace(/-/g, '/');
    //var create_time = "02:00"

    //var strDate = create_ymd + ' ' + create_time + ':00';
    //var change_day = new Date(strDate);

    //console.log(strDate);
    //console.log(change_day);
    //console.log(typeof(change_day));

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
          $(data).each(function(i, todo){
            $('#todo_search_result').append('<tr>' + '</tr>')
            $('#todo_search_result').append('<td>' + todo.title + '</td>')
            $('#todo_search_result').append('<td>' + todo.content + '</td>')
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
      $(data).each(function(i, todo){
        $('#todo_search_result').append('<tr>' + '</tr>')
        $('#todo_search_result').append('<td>' + todo.title + '</td>')
        $('#todo_search_result').append('<td>' + todo.content + '</td>')
      });
    });
});
