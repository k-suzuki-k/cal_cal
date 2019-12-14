$(document).ready(function(){
  $('.timepicker').timepicki({
    show_meridian:false,
    min_hour_value:0,
    max_hour_value:23,
    step_size_minutes:5,
    overflow_minutes:true,
    increase_direction:'up',
    disable_keyboard_mobile: true});
});
