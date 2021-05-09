json.extract! article, :id, :title, :story, :image, :user_id, :date_created, :created_at, :updated_at
json.url article_url(article, format: :json)
