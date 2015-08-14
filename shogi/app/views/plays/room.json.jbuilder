i = 1
@active.each do |room|
  json.set! i do
    json.room_no room['room_no']
    json.room_state room['state']
    if room['first_player'] != nil
      json.first_player User.where(id: room['first_player']).first[:name]
      json.last_player User.where(id: room['last_player']).first[:name]
    else
      player_name = PlayingUser.where(play_id: room['id'])
      json.first_player User.where(id: player_name.first['user_id']).last['name']
      json.last_player "---"
    end 
  end
  i += 1
end
