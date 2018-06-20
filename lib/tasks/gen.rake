namespace :gen do
  desc "TODO"
  task users: :environment do
    password = "qweqwe"

    5.times { |i| User.create!({email: Faker::Internet.email, password: password, password_confirmation: password }) }

    puts "finished with users"
  end

  desc "TODO"
  task categories: :environment do
    User.all.each do |user|
      5.times do |i|
        title = Faker::Football.team + "_#{i}"

        user.categories.create!({title: title})
      end
    end

    puts "finished with categories"
  end

  desc "TODO"
  task posts: :environment do
    Category.all.each do |category|
      7.times do |i|
        title = Faker::Football.player
        content = Faker::Lorem.paragraph

        category.posts.create!({title: title, content: content, user_id: category.user_id})
      end
    end

    puts "finished with posts"
  end

  desc "TODO"
  task comments: :environment do
    user_ids = User.all.map {|user| user.id}

    Post.all.each do |post|
      1.upto(Random.new.rand(1...10)) do |i|
        random_user_id = user_ids.sample
        content = Faker::Community.quotes

        post.comments.create!({content: content, user_id: random_user_id})
      end
    end

    puts "finished with comments"

  end
end
