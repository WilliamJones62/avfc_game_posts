class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def create
    @review = Review.new(review_params)
  end

  private
     def review_params
       params.require(:review).permit(
         :title, :description, :rating, :game_id
       )
     end
end
