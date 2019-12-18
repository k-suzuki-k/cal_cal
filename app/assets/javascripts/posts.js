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
