class AddClassworkToReports < ActiveRecord::Migration
  def change
    add_column :reports, :classwork, :decimal
  end
end
