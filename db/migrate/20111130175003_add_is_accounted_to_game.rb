class AddIsAccountedToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :is_accounted, :boolean, :default => false
  end

  def self.down
    remove_column :games, :is_accounted
  end
end
