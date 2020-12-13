class RemoveJobWorldFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :job_world, :integer
  end
end
