class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :categories
  has_many :posts
  has_many :comments
end
