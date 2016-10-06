class AddHonorToReports < ActiveRecord::Migration
  def change
    add_column :reports, :honor, :boolean
  end
end
