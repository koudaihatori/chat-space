json.comments     @comments do |comment|
  json.name     comment.user.name
  json.created_at     comment.created_at
  json.text     comment.text
end
