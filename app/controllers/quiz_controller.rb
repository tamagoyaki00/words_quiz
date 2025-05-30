class QuizController < ApplicationController
  before_action :prepare_quiz_session, only: %i[answer]


  #解答
  def answer
    selected_choice_id = params[:answer]

    if selected_choice_id.blank?
      flash.now[:alert] = "選択肢を選んでください"
      load_current_question_and_choices
      render "categories/show" and return
    end
    
    #解答の正誤判定
    selected_choice = Choice.find(selected_choice_id)
    increment_correct_count if selected_choice.correct_answer?

    session[:current_index] += 1
    #規定の問題数までループ
    if session[:current_index] < session[:question_ids].size
      redirect_to category_path(id: session[:category_id])
    elsif session[:correct_count] == session[:question_ids].size
      redirect_to quiz_special_path(category_id: session[:category_id])
    else
      redirect_to quiz_result_path(category_id: session[:category_id])
    end
  end

  #結果表示
  def result
    set_score_info
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

  def prepare_quiz_session
    unless session[:question_ids]
      session[:question_ids] = Question.pluck(:id).sample(5)
      session[:current_index] = 0
      session[:answers] = []
      session[:correct_count] = 0
    end
  end

  def set_score_info
    @score = session[:correct_count]
    @question_size = session[:question_ids].size
  end

end
