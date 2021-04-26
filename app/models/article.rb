class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_and_belongs_to_many :categories, foreign_key: :article_id
  has_many :votes, foreign_key: :article_id

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  scope :tesla, -> { where('category_id = ?', 1).order(created_at: :desc) }
  scope :ford, -> { where('category_id = ?', 2).order(created_at: :desc) }
  scope :gm, -> { where('category_id = ?', 3).order(created_at: :desc) }
  scope :lucid, -> { where('category_id = ?', 4).order(created_at: :desc) }
  scope :battery, -> { where('category_id = ?', 5).order(created_at: :desc) }
end

