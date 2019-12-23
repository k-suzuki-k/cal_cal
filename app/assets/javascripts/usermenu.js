// ヘッダーのプロフィールをクリックするとメニューが表示される
$(document).ready(function(){
  document.addEventListener('turbolinks:load', function() {
    $('.drawer').drawer();
    $('.drawer-nav').on('click', function() {
      $('.drawer').drawer('close');
    });
  });
});
