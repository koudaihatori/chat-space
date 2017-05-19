$(function() {
  function buildHTML(comment) {
    var html =
    `<div class="chat-comment__user">
    ${comment.user_name}
    </div>
    <div class="chat-comment__time">
    ${comment.created_at}
    <div class="chat-comment__text">
    ${comment.created_at}
    </div>`
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
        comments: {
          text: comment
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      console.log(data)
      var html = buildHTML(data);
      $('list').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});

