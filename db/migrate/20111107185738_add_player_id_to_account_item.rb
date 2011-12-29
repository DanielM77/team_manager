class AddPlayerIdToAccountItem < ActiveRecord::Migration
  def self.up
    add_column :account_items, :player_id, :integer
  end

  def self.down
    remove_column :account_items, :player_id 
  end
end
