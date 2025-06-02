class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    unless session[:question_ids]
      redirect_to start_category_path(id: params[:id]), alert: "クイズを開始してください"
      return
    end

    @category = Category.find(params[:id])
    question_id = session[:question_ids][session[:current_index]]
    if question_id.nil?
      redirect_to categories_path
      return
    end
    @question = Question.find(question_id)
  end

  # クイズ開始
  def start
    initialize_quiz_session(params[:id])
  end

  # 解答
  def answer
    selected_choice_id = params[:answer]

    if selected_choice_id.blank?
      flash[:alert] = "選択肢を選んでください"
      redirect_to category_path(params[:id])
      return
    end

    #解答の正誤判定
    selected_choice = Choice.find(selected_choice_id)
    increment_correct_count if selected_choice.correct_answer?

    session[:current_index] += 1
    
    #規定の問題数までループ,終わったら結果画面に遷移
    if session[:current_index] < session[:question_ids].size
      redirect_to category_path(id: session[:category_id])
    elsif session[:correct_count] == session[:question_ids].size
      Rails.logger.debug "パーフェクト確認"
      Rails.logger.debug "session[:category_id] = #{session[:category_id].inspect}"
      redirect_to quiz_perfect_path(category_id: session[:category_id])
    else
      redirect_to quiz_result_path(category_id: session[:category_id])
    end
  end

  private

  # 問題と選択肢取得
  def load_current_question_and_choices
    @question = Question.find(session[:question_ids][session[:current_index]])
    @shuffled_choices = @question.choices.shuffle
  end

  # 正解数カウント
  def increment_correct_count
    session[:correct_count] ||= 0
    session[:correct_count] += 1
  end

  # クイズの初期化
  def initialize_quiz_session(category_id)
    @category = Category.find(params[:id])
    session[:question_ids] = Question.where(category_id: params[:id]).pluck(:id).sample(5)
    session[:current_index] = 0
    session[:correct_count] = 0
    session[:answers] = []
    session[:category_id] = @category.id
  end
end
