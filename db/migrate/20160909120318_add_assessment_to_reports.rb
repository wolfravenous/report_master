class AddAssessmentToReports < ActiveRecord::Migration
  def change
    add_column :reports, :assessment, :decimal
  end
end
