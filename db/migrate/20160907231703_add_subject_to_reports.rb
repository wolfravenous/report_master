class AddSubjectToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :subject, index: true, foreign_key: true
  end
end
