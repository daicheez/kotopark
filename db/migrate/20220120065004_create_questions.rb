class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :training, null: false, foreign_key: true
      t.text :content, null: false
      t.integer :point, null: false
      t.timestamps
    end
  end
end
