class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.most_pop
    @arr = []
    @votes = Vote.all
    @votes.each do |vote|
      @arr << vote.article.id
    end
    @pop = @arr.max_by { |i| @arr.count(i) }
    @most_popular_article2 = Article.where('(id = ?)', @pop).first
    @most_popular_article2
  end

  scope :most_popular_article2, -> { where('(id = ?)', @most_popular_article).first }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :tesla, -> { where('category_id = ?', 1).order(created_at: :desc) }
  scope :ford, -> { where('category_id = ?', 2).order(created_at: :desc) }
  scope :gm, -> { where('category_id = ?', 3).order(created_at: :desc) }
  scope :lucid, -> { where('category_id = ?', 4).order(created_at: :desc) }
  scope :battery, -> { where('category_id = ?', 5).order(created_at: :desc) }
end
