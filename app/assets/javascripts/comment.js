$(function() {
  function buildHTML(comment) {
    var html = $('.comment__data').append(comment__data--text);
    return html;
  }
  $('button_area').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.type');
    var comment = textField.val();
    $.ajax({
      type: 'POST',
      url: '/comments.json',
      data: {
        comments: {
        content: comment
      }
    },
    dataType: 'json'
  })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chatcontent').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});

