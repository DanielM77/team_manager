class AddBonusIdToTeam < ActiveRecord::Migration
  def self.up
    add_column :teams, :bonus_id, :integer
  end

  def self.down
    remove_column :teams, :bonus_id
  end
end
