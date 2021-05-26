class Game < ApplicationRecord
  has_many :reviews, inverse_of: :game, :dependent => :destroy
  before_create :save_date

  def save_date
    self.formatted_date = self.game_date.strftime("%m-%d-%Y")
  end

  def avg_rating
    reviews.average(:rating).round(2).to_f
  end
end
