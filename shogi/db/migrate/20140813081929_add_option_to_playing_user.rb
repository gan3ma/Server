class AddOptionToPlayingUser < ActiveRecord::Migration
  def up
    change_column :playing_users, :exit_flag, :string, :null => false, :default => false
  end
  def down
    change_column :playing_users, :exit_flag, :string, :null => true, :default => nil
  end
end
