class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.date :game_date
      t.integer :goals_home
      t.integer :goals_away

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
