class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  belongs_to :user
  has_and_belongs_to_many :categories, foreign_key: :article_id
  has_many :votes, foreign_key: :article_id

  def self.most_pop
    @arr = []
    @votes = Vote.all
    @votes.each do |vote|
      @arr << vote.article.id
    end
    @pop =  @arr.max_by { |i| @arr.count(i) }
    @most_popular_article2  = Article.where('(id = ?)', @pop).first
    return @most_popular_article2
  end

  scope :most_popular_article2, -> {where('(id = ?)', @most_popular_article).first}
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :tesla, -> { where('category_id = ?', 1).order(created_at: :desc) }
  scope :ford, -> { where('category_id = ?', 2).order(created_at: :desc) }
  scope :gm, -> { where('category_id = ?', 3).order(created_at: :desc) }
  scope :lucid, -> { where('category_id = ?', 4).order(created_at: :desc) }
  scope :battery, -> { where('category_id = ?', 5).order(created_at: :desc) }
end
