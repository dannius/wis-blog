json.id @post.id
json.title @post.title
json.content @post.content
json.createdAt @post.created_at

json.comments @post.comments do |comment|
  json.id comment.id
  json.author (comment.user.present?)? comment.user.email : nil
  json.content comment.content
  json.createdAt comment.created_at
end
