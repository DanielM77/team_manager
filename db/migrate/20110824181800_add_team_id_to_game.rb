class AddTeamIdToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :home_id, :integer
    add_column :games, :away_id, :integer
  end

  def self.down
    remove_column :games, :home_id
    remove_column :games, :away_id
  end
end
