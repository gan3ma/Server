class Piece < ActiveRecord::Base
  belongs_to :master_piece, :foreign_key => :piece_id
  belongs_to :play
  belongs_to :user, :foreign_key => :owner

  validate :owner, :presence => true
  validate :posx, :presence => true
  validate :posy, :presence => true
  validate :piece_id, :presence => true
  validate :play_id, :presence => true
  validate :promote, :presence => true

  def name
    master_piece.name
  end
end
