class CreateSequencerTags < ActiveRecord::Migration
  def change
    create_table :sequencer_tags do |t|
      t.string :str
      t.integer :sequencer_id

      t.timestamps null: false
    end
  end
end
