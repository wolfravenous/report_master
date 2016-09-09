class AddParticipateToReports < ActiveRecord::Migration
  def change
    add_column :reports, :participate, :decimal
  end
end
