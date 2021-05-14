class Api::V1::GamesController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews.all
  end

  def index
    @games = Game.all
  end
end
