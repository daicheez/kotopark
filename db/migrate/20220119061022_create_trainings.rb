class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :score, default: 0
      t.timestamps
    end
  end
end
