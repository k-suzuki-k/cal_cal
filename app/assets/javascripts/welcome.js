jQuery(function($){
  $('.wv-tabs-header_tab').click(function(){
    $('.active').removeClass('active');
    $(this).addClass('active');
    $('.show').removeClass('show');
    const index = $(this).index();
    $('.wv-tabs-content_panel').eq(index).addClass('show');
  });
});
