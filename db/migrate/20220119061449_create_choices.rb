class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.references :training, null: false, foreign_key: true
      t.text :question
      t.boolean :answer
      t.timestamps
    end
  end
end
