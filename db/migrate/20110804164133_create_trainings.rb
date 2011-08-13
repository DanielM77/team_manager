class CreateTrainings < ActiveRecord::Migration
  def self.up
    create_table :trainings do |t|
      t.date :training_date
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :trainings
  end
end
