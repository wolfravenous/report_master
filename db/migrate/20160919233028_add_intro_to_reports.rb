class AddIntroToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :intro, index: true, foreign_key: true
  end
end
