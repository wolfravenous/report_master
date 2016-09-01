class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :comment

      t.timestamps null: false
    end
  end
end
