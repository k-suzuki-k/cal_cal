//post一覧をクリックすると詳細が表示される
$(document).ready(function(){
  $(document).on("click", ".post_row", function(){
    location.href = $(this).data('href');
  });
});
