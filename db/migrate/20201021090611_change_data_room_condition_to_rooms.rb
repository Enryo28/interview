class ChangeDataRoomConditionToRooms < ActiveRecord::Migration[5.2]
  def change
    # change_column_null :rooms, :room_condition, false, 0
    change_column :rooms, :room_condition, :integer, null: false
  end
  
end
