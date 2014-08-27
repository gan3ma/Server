json.set! :first_player do
  json.user_id @play.first_player
  json.name User.find(@play.first_player).name
end
json.set! :last_player do
  json.user_id @play.last_player
  json.name User.find(@play.last_player).name
end
