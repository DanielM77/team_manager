class AddAttributesToBonus < ActiveRecord::Migration
  def self.up
    add_column :bonuses, :max_players, :integer
    add_column :bonuses, :is_shared, :boolean
  end

  def self.down
    remove_column :bonuses, :max_players
    remove_column :bonuses, :is_shared
  end
end
