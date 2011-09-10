class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.string :street
      t.string :zip_code
      t.string :city
      t.integer :distance

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
