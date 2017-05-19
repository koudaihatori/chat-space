$(function() {
  function buildHTML(comment) {
    var html =
    `<div class="chat-comment">
    <div class="chat-comment__user">
    ${comment.user_name}
    </div>
    <div class="chat-comment__time">
    ${comment.reated_at.strftime('%Y年%m月%d日 %H:%M:%S')}
    <div class="chat-comment__text">
    ${comment.text}
    </div>`;
    return html;
  }
  $('form_area').on('submit', function(e) {
    e.preventDefault();
    var form = this;
    var textField = $('#text_field');
    var comment = textField.val();
    $.ajax({
      type: 'POST',
      url: '/comments.json',
      data: {
        comment: {
          text: comment
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('list').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});

