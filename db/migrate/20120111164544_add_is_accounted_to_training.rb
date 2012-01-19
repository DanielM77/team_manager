class AddIsAccountedToTraining < ActiveRecord::Migration
  def self.up
    add_column :trainings, :is_accounted, :boolean, :default => false
  end

  def self.down
    remove_column :trainings, :is_accounted
  end
end
