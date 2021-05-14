json.game_date @game.game_date
json.home @game.home
json.score @game.score
json.opponent @game.opponent
json.reviews do
  json.array! @game.reviews, :id, :game_id, :title, :description, :rating
end
