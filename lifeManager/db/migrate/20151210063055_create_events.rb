class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.string :location
      t.string :eventType
      t.integer :schedule_id

      t.timestamps null: false
    end
  end
end
