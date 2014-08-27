class AddWinnerColumnToPlay < ActiveRecord::Migration
  def change
    add_column :plays, :winner, :integer, null: true
  end
end
