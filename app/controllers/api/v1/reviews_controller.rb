class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def create
    review = game.reviews.new
    review.title = review_params[:title]
    review.description = review_params[:description]
    review.rating = review_params[:rating]
    if review.save
      head :no_content
    else
      render json: { error: review.errors.messages }, statue: 422
    end
  end

  def game
    logger.info 'formatted_date = ' + review_params[:formatted_date]
    @game ||= Game.find_by(formatted_date: review_params[:formatted_date])
  end

  private
     def review_params
       params.require(:review).permit(
         :title, :description, :rating, :formatted_date
       )
     end
end
