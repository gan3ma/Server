class Piece < ActiveRecord::Base
  belongs_to :play
  belongs_to :user, :foreign_key => :owner
  validate :owner, :presence => true
  validate :posx, :presence => true
  validate :posy, :presence => true
  validate :piece_no, :presence => true
  validate :play_id, :presence => true
  validate :promote, :presence => true
end
