class CreateGameMembers < ActiveRecord::Migration
  def self.up
    create_table :game_members do |t|

      t.integer :game_id
      t.integer :player_id

      t.timestamps
    end
  end

  def self.down
    drop_table :game_members
  end
end