class AddDetailsToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :job_world, :integer, default: 0, null: false
    add_column :rooms, :job_contents, :integer, default: 0, null: false
    add_column :rooms, :room_condition, :integer, default: 0, null: false
  end
end
