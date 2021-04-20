class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.binary :image
      t.references :user, null: false, foreign_key: true
      t.date :createdAt

      t.timestamps
    end
  end
end
