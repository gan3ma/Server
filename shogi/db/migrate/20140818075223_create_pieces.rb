class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :piece_no, :null => false
      t.references :play, :null => false
      t.integer :posx, :null => false
      t.integer :posy, :null => false
      t.integer :owner, :null => false
      t.boolean :promote, :default => false

      t.timestamps
    end
  end
end
