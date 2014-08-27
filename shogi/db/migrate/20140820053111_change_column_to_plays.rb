class ChangeColumnToPlays < ActiveRecord::Migration
  def up
    change_column :plays, :room_no, :string, :null => false
    remove_column :plays, :turn_count
    add_column :plays, :turn_count, :integer, :null => false, default: 1
    change_column :plays, :first_player, :integer, :null => true
    change_column :plays, :last_player, :integer, :null => true
  end
  def down
    change_column :plays, :room_no, :integer, :null => false, default: 1
    remove_column :plays, :turn_count
    add_column :plays, :turn_count, :string
    change_column :plays, :first_player, :integer, :null => false
    change_column :plays, :last_player, :integer, :null => false
  end
end
