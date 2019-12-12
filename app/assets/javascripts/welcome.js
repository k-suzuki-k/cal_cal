//ログイン、登録のタブ切り替え
jQuery(function($){
  $('.wv-tabs-header_tab').click(function(){
    $('.active').removeClass('active');
    $(this).addClass('active');
    $('.show').removeClass('show');
    const index = $(this).index();
    $('.wv-tabs-content_panel').eq(index).addClass('show');
  });
});

//入力フォームのバリデーション
$(document).ready(function(){
  $(".validate_field").validationEngine();
});
