class ChangeDataJobContentsToRooms < ActiveRecord::Migration[5.2]
  def change
    # change_column_null :rooms, :job_contents, false, 0
    change_column :rooms, :job_contents, :integer, null: false
  end
end
