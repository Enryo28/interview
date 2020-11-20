class RemoveRoomConditionFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :room_condition, :integer
  end
end
