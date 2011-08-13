class CreateTrainingMembers < ActiveRecord::Migration
  def self.up
    create_table :training_members do |t|
      t.integer :training_id
      t.integer :player_id
      t.timestamps
    end
  end

  def self.down
    drop_table :training_members
  end
end
