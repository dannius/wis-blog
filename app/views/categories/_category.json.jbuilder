json.id category.id
json.title category.title

json.posts category.posts do |post|
  json.id post.id
  json.title post.title
end
