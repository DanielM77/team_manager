class RemoveBonusFromTeam < ActiveRecord::Migration
  def self.up
    remove_column :teams, :bonus_id
  end

  def self.down
    add_column :teams, :bonus_id, :integer
  end
end
