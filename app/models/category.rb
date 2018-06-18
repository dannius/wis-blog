class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
end
