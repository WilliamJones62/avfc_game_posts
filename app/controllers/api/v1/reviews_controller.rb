class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def create
    review = game.reviews.new(review_params)
    if review.save
      head :no_content
    else
      render json: { error: review.errors.messages }, statue: 422
    end
  end

  def game
      @game ||= Game.find(params[:game_id])
  end

  private
     def review_params
       params.require(:review).permit(
         :title, :description, :rating, :game_id
       )
     end
end
