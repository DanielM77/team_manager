class AddIsDriverToGameMember < ActiveRecord::Migration
  def self.up
    add_column :game_members, :is_driver, :boolean
  end

  def self.down
    remove_column :game_members, :is_driver
  end
end
