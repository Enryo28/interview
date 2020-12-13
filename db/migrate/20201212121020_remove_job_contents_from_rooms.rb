class RemoveJobContentsFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :job_contents, :integer
  end
end
