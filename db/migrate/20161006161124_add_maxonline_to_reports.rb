class AddMaxonlineToReports < ActiveRecord::Migration
  def change
    add_column :reports, :maxonline, :boolean
  end
end
