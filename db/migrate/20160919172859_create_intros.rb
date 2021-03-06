class CreateIntros < ActiveRecord::Migration
  def change
    create_table :intros do |t|
      t.string :title
      t.text :content
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
