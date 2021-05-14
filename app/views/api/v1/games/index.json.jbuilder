json.array! @games do |g|
  json.game_date g.game_date
  json.home g.home
  json.score g.score
  json.opponent g.opponent
end
