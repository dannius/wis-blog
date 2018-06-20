class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :user

  validates_uniqueness_of :title, scope: :user_id
  validates :title, presence: true
end
