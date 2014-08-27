json.array!(@plays) do |play|
  json.extract! play, :id, :turn_player, :turn_number, :end_flag, :room_no
  json.url play_url(play, format: :json)
end
