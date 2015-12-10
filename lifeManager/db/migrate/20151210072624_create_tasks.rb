class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :str
      t.boolean :finished
      t.integer :checklist_id

      t.timestamps null: false
    end
  end
end
