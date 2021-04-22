class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def self.popular_article
    count_hash = Vote.group(:article_id).count
    article_id = count_hash.max_by { |_k, v| v }
    if article_id.nil?
      Article.first
    else
      Article.find(article_id[0])
    end
  end
end
