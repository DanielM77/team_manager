class CreateRefunds < ActiveRecord::Migration
  def self.up
    create_table  :refunds do |t|
      t.integer   :team_id
      t.string    :refund_type
      t.float     :value
      t.boolean   :is_shared
      t.float     :min_base_value
      t.float     :max_base_value
      t.timestamps
    end
  end

  def self.down
    drop_table :refunds
  end
end
