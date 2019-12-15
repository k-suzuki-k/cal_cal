$(document).ready(function(){
  $("#calendar").fullCalendar({});
});
$(document).on('turbolinks:load', function() {
    $('#calendar').fullCalendar({});
});

$(document).on('turbolinks:before-cache', function() {
    $('#calendar').empty();
});
