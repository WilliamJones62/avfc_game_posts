class MatchesController < ApplicationController
  def main
    @matches = Game.all
    @match = Game.first
    @match_data = ' '
  end
end
