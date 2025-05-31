class QuizController < ApplicationController

  # 結果表示
  def result
    @category = Category.find(params[:category_id])
    set_score_info
  end

  # 全問正解者結果表示
  def perfect
    @category = Category.find(session[:category_id])
    set_score_info
    unless @score == @question_size
      redirect_to root_path, alert: "アクセスできません"
    end
  end

  private

  def load_current_question_and_choices
  @question = Question.find(session[:question_ids][session[:current_index]])
  @shuffled_choices = @question.choices.shuffle
  end

  def increment_correct_count
    session[:correct_count] ||= 0
    session[:correct_count] += 1
  end

  def set_score_info
    @score = session[:correct_count]
    @question_size = session[:question_ids].size
  end
end
