class User < ApplicationRecord
  has_many :articles, foreign_key: :user_id
  has_many :votes, foreign_key: :user_id

  validates :user_name, :presence => true
end
