class ChangeDataJobWorldToRooms < ActiveRecord::Migration[5.2]
  def change
     # change_column_null :rooms, :job_world, false, 0
    change_column :rooms, :job_world, :integer, null: false
  end
end
