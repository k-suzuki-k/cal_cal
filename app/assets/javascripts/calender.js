$(document).ready(function(){
  $("#calendar").fullCalendar({

    height: 510,

    titleFormat: 'YYYY/MM',
    header: {
      left: 'title',
      center: '',
      right: 'today prev,next'
    },

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
