class AddColumnToPlay < ActiveRecord::Migration
  def up
    add_column :plays, :first_player, :integer
    add_column :plays, :last_player, :integer
  end
  def down
    remove_column :plays, :first_player, :integer
    remove_column :plays, :last_player, :integer
  end
end
