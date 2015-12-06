class CreateSequencerPresetUsers < ActiveRecord::Migration
  def change
    create_table :sequencer_preset_users do |t|
      t.integer :preset_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
