class ChangeImageTypeInArticle < ActiveRecord::Migration[6.1]
    def up
      change_column :articles, :image, :string
    end
    
    def down
      change_column :articles, :image, :binary
    end
end
