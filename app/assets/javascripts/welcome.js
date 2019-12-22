//ログイン、登録のタブ切り替え
$(document).on('turbolinks:load', function() {
  $('.wv-tabs-header_tab').click(function(){
    $('.active').removeClass('active');
    $(this).addClass('active');
    $('.show').removeClass('show');
    const index = $(this).index();
    $('.wv-tabs-content_panel').eq(index).addClass('show');
  });
});

//入力フォームのバリデーション
$(document).on('turbolinks:load', function() {
  $(".validate_field").validationEngine();
});

//メールアドレスの入力補助
$(document).on('turbolinks:load', function() {
    $(".email_auto").emailautocomplete({
          domains: ["example.com"]
        });
});

