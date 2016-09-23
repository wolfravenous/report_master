class AddEndingToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :ending, index: true
    add_foreign_key :reports, :units, column: :ending_id
  end
end
