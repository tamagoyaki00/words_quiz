class RemoveCorrectAnswerFromQuestions < ActiveRecord::Migration[7.2]
  def change
    remove_column :questions, :correct_answer, :text
  end
end
