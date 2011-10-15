class CreateAccountItems < ActiveRecord::Migration
  def self.up
    create_table :account_items do |t|
      t.date :item_date
      t.string :item_type
      t.text :description
      t.decimal :value
      t.integer :account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :account_items
  end
end
