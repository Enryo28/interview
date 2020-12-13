class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "job_world", default: 0, null: false
      t.integer "job_contents", default: 0, null: false
      t.integer "room_condition", default: 0, null: false
      t.boolean "is_confirmed", default: false, null: false
      t.timestamps
    end
  end
end
