class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :term, null: false
      t.text :correct_answer, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
