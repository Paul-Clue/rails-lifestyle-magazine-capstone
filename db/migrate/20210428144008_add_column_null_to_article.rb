class AddColumnNullToArticle < ActiveRecord::Migration[6.1]
  def change
    change_column_null :articles, :image, :binary, true
  end
end
