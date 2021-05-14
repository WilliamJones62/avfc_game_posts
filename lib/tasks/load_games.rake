task :loadgames => [ :environment ] do
  headers = {
    "X-Auth-Token" => "187f827c9cd148c0a8804b001840320c"
  }
  response = HTTParty.get('https://api.football-data.org/v2/teams/58/matches',
  :headers => headers)
  Game.delete_all
  response["matches"].each do |m|
    game = Game.new
    game.game_date = m["utcDate"]
    game.home = false
    game.opponent = m["homeTeam"]["name"]
    if m["homeTeam"]["name"] == 'Aston Villa FC'
      game.home = true
      game.opponent = m["awayTeam"]["name"]
    end
    game.score = m["score"]["fullTime"]["homeTeam"].to_s + ':' + m["score"]["fullTime"]["awayTeam"].to_s
    game.save
  end
end
