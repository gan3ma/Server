class ChangeColEndFlagToPlay < ActiveRecord::Migration
  def up
    change_column :plays, :end_flag, :string, :null => false, :default => "waiting"
    change_column :plays, :turn_number, :integer, :null => false, :default => 0
    rename_column :plays, :end_flag, :state
    rename_column :plays, :turn_number, :turn_count
  end
  def down
    change_column :plays, :state, :string, :null => true, :default => nil
    change_column :plays, :turn_number, :integer, :null => true, :default => nil
    rename_column :plays, :state, :end_flag
    rename_column :plays, :turn_count, :turn_number
  end
end
