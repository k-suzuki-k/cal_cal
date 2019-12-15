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
          $('#todo_search_result').text(date.format())
          $('#todo_search_result').find('li').remove();
          $(data).each(function(i, todo){
            $('#todo_search_result').append('<li>' + todo.title + '</li>')
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
