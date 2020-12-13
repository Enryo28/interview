class AddColumnToRooms < ActiveRecord::Migration[5.2]
  def change
     add_column :rooms, :is_confirmed, :boolean, default: false, null: false
  end
end
