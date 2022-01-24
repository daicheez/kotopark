class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category, null: false
      t.string :sub_category, null: false
      t.string :level, null: false
      t.integer :score, null: false
      t.timestamps
    end
  end
end
