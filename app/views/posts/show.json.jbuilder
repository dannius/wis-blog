json.partial! './posts/post', post: @post

json.comments do
  json.array!(@post.comments) do |comment|
    json.partial! './comments/comment', comment: comment
  end
end