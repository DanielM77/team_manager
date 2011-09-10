class CreateBonuses < ActiveRecord::Migration
  def self.up
    create_table :bonuses do |t|
      t.integer :team_id
      t.string :bonus_type
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :bonus
  end
end
