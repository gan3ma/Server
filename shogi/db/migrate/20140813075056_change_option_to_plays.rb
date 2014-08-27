class ChangeOptionToPlays < ActiveRecord::Migration
  def up
    change_column :plays, :room_no, :integer, null:false, default: 1
  end
  def down
    change_column :plays, :room_no, :integer, null:true, default: 1
  end
end
