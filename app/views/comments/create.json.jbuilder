json.name @comment.user.nickname
json.context simple_format(@comment.content)
json.past time_ago_in_words(@comment.created_at)
json.user_id @comment.user.id