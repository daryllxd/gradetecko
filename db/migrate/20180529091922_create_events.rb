class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :object_id, null: false
      t.string :object_type, null: false
      t.datetime :timestamp, null: false
      t.jsonb :payload, null: false, default: {}

      t.timestamps
    end
  end
end
