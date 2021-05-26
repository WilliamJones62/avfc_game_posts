json.game_date @game.game_date
json.formatted_date @game.formatted_date
json.home @game.home
json.score @game.score
json.opponent @game.opponent
json.rating @game.avg_rating
json.reviews do
  json.array! @game.reviews, :id, :game_id, :title, :description, :rating
end
