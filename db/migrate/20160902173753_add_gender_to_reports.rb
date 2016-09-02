class AddGenderToReports < ActiveRecord::Migration
  def change
    add_column :reports, :gender, :string
  end
end
