class CreateSynthPresetUsers < ActiveRecord::Migration
  def change
    create_table :synth_preset_users do |t|
      t.integer :preset_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
