class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.references :question, null: false, foreign_key: true
      t.text :chose, null: false
      t.boolean :answer
      t.timestamps
    end
  end
end
