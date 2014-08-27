class CreatePlayingUsers < ActiveRecord::Migration
  def change
    create_table :playing_users do |t|
      t.references :user, index: true
      t.references :play, index: true
      t.string :role
      t.boolean :exit_flag

      t.timestamps
    end
  end
end
