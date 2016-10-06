class AddAccelToReports < ActiveRecord::Migration
  def change
    add_column :reports, :accel, :boolean
  end
end
