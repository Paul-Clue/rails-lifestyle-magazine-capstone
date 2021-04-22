class DropLinksTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :links
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
