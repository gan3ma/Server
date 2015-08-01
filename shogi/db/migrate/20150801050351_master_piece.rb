class MasterPiece < ActiveRecord::Migration
  def change
    create_table :master_pieces do |t|
      t.string :name
      t.integer :posx
      t.integer :posy
      t.integer :owner
    end

    rename_column :pieces, :piece_no, :piece_id
  end
end
