json.id comment.id
json.content comment.content
json.author (comment.user.present?)? comment.user.email : nil
json.createdAt comment.created_at
