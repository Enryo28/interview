class RemoveIsConfirmedFromRooms < ActiveRecord::Migration[5.2]
  def change
     remove_column :rooms, :is_confirmed, :string
  end
end
