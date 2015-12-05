class CreateSynthTags < ActiveRecord::Migration
  def change
    create_table :synth_tags do |t|
      t.string :str
      t.integer :synth_id

      t.timestamps null: false
    end
  end
end
