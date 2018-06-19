json.posts @posts do |post|
  json.id post.id
  json.title post.title
  json.content post.content
  json.createdAt post.created_at
end