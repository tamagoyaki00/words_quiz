class CreateChoices < ActiveRecord::Migration[7.2]
  def change
    create_table :choices do |t|
      t.text :content, null: false
      t.boolean :correct, null: false
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
