class QuizController < ApplicationController

  # 結果表示
  def result
    @category = Category.find(session[:category_id])
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

  def set_score_info
    @score = session[:correct_count]
    @question_size = session[:question_ids].size
  end
end
