class QuizController < ApplicationController
  before_action :prepare_quiz_session, only: %i[show answer]

  #クイズ開始
  def start;end

  #問題と選択肢表示


  #解答の正誤判定
  def answer
    answer = params[:answer]
    Rails.logger.debug "選択された解答: #{answer}"
    if answer.blank?
      flash.now[:alert] = "選択肢を選んでください"
      @question = Question.find(session[:question_ids][session[:current_index]])
      render "categories/show" and return

    end
    session[:answers] << answer

    session[:current_index] += 1

    if session[:current_index] < session[:question_ids].size
      redirect_to category_path(id: session[:category_id])
    else
      redirect_to quiz_result_path
    end
  end

  #結果表示
  def result
  end

  private

  def prepare_quiz_session
    unless session[:question_ids]
      session[:question_ids] = Question.pluck(:id).sample(5)
      session[:current_index] = 0
      session[:answers] = []
    end
  end
end
