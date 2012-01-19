class AddDistanceToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :distance , :integer
    add_column :players, :gets_refund, :boolean
  end

  def self.down
    remove_column :players, :distance
    remove_column :players, :gets_refund
  end
end
