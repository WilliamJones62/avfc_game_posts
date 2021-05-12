class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.date :game_date
      t.boolean :home
      t.string :score
      t.string :opponent

      t.timestamps
    end
  end
end
