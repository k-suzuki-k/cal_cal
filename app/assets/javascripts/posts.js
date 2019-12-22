//post一覧をクリックすると詳細が表示される
$(document).ready(function(){
  $(document).on("click", ".post_row", function(){
    location.href = $(this).data('href');
  });
});

//postの検索フォームに入力されるたびに非同期で検索結果を表示する
$(document).on('turbolinks:load', function() {

  $('#post_search_form').on('input', function(event){
    var search_day     = $('.post_search_day').val();
    var search_title   = $('.post_search_title').val();
    var search_content = $('.post_search_content').val();
    var search_data = ('day=' + search_day + '&' + 'title=' + search_title + '&' + 'content=' + search_content)

    $.ajax({
      url: '/posts/search',
      type: 'GET',
      data: search_data,
      processData: false,
      contentType: false,
      dataType: 'script'
    });
  });
});

// post#editに日付をもとにtodoを検索
$(document).on('turbolinks:load', function() {

  var check = document.getElementById('todo_post_check');

  if (check) {
    var post_date = document.getElementById('todo_day').value

    $.ajax({
      url: '/todos/search',
      type: 'GET',
      data: ('keyword=' + post_date),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
      .done(function(data){
        //todoリストのタイトルをクリックした日付にする
        $('.table_title').text(post_date);
        //検索結果を表示させる
        $('#todo_search_result').find('tr').remove();
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
          $('#todo_search_result').append('<tr id=todo_' + todo.id + ' class=todo_row >' +
            '<td>' + start_time + '</td>' +
            '<td>' + end_time + '</td>' +
            '<td>' + todo.title + '</td>' + '</tr>')
        });
      });
  } else {
  };
});
