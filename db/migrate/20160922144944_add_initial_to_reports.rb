class AddInitialToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :initial, index: true
    add_foreign_key :reports, :units, column: :intitial_id
  end
end
