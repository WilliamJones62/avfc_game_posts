class AddFormattedDateToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :formatted_date, :string
  end
end
