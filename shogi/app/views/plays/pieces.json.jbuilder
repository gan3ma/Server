@pieces.each do |piece|
  json.set! piece['piece_id'] do
    json.name piece.name
    json.posx piece['posx']
    json.posy piece['posy']
    json.owner piece['owner']
    json.promote piece['promote']
  end
end
