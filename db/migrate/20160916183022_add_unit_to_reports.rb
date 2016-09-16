class AddUnitToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :unit, index: true, foreign_key: true
  end
end
