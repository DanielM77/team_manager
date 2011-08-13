class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :lastname
      t.string :firstname
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :phone
      t.string :email
      t.string :mobile
      t.date   :birthday
      t.string :size_shirt
      t.string :size_pants

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
