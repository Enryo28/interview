class RemoveJobFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :job, :string
  end
end
