class ChangeOwnerOptionToPieces < ActiveRecord::Migration
  def up
    change_column :pieces, :owner, :integer, :null => true
  end
  def down
    change_column :pieces, :owner, :integer, :null => false
  end
end
