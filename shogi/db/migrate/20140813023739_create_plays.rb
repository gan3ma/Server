class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :turn_player
      t.integer :turn_number
      t.string :end_flag
      t.integer :room_no

      t.timestamps
    end
  end
end
