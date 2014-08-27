json.set! :first do
  json.id @play.first_player
  json.name User.find(@play.first_player).name
end
json.set! :last do
  json.id @play.last_player
  json.name User.find(@play.last_player).name
end
