class AddFutureToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :future, index: true, foreign_key: true
  end
end
