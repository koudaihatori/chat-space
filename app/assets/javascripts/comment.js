$(function() {
  function buildHTML(comment) {
    var html =
    `<div class="chat-comment">
      <div class="chat-comment__user">
        ${comment.name}
      </div>
      <div class="chat-comment__time">
        ${comment.created_at}
      </div>
      <div class="chat-comment__text">
        ${comment.text}
      </div>
    </div>`;
    return html;
  }

  $('.input_text_area').on('submit', function(e) {
    e.preventDefault();
    var textField = $('#text_field');
    var comment = textField.val();

    $.ajax({
      type: 'POST',
      url: './comments',
      data: {
        comment: {
          text: comment
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('#list').append(html);
      textField.val('');
      $('input').prop("disabled", false);
    })
    .fail(function() {
      alert('error');
    });
  });
});

