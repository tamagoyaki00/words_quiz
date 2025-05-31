class CategoriesController < ApplicationController
  before_action :prepare_quiz_session, only: %i[show answer]

  def index
    @categories = Category.all
  end

  def show
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
    @category = Category.find(params[:id])
    session[:question_ids] = Question.where(category_id: params[:id]).pluck(:id).sample(5)
    session[:current_index] = 0
    session[:correct_count] = 0
    session[:category_id] = @category.id
  end
  
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
    else
      redirect_to quiz_result_path
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


  def prepare_quiz_session
    unless session[:question_ids]
      session[:question_ids] = Question.pluck(:id).sample(5)
      session[:current_index] = 0
      session[:answers] = []
      session[:correct_count] = []
    end
  end

end
