class PlayingUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :play

  scope :play_is, lambda { |play_id|where(:play_id => play_id) }
  scope :other_player_is, lambda{ |play_id|where(:play_id => play_id, :role => 'player').first }
end
