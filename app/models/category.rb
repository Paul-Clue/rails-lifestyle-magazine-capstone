class Category < ApplicationRecord
  has_and_belongs_to_many :articles, foreign_key: :category_id

  def self.show(param)
    @cat_id = Article.find(param).category_id
    @art = Article.where('(category_id = ?)', @cat_id)

    @art
  end

  scope :most_popular_article2, -> { where('(id = ?)', @most_popular_article).first }
end
