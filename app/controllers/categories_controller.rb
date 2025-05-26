class CategoriesController < ApplicationController
  before_action :prepare_quiz_session, only: %i[show]

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

  private

  def prepare_quiz_session
    category_id = params[:id]

    if session[:question_ids].blank? || session[:category_id] != category_id
      session[:category_id] = category_id
      session[:question_ids] = Question.where(category_id: category_id).pluck(:id).sample(5)
      session[:current_index] = 0
      session[:answers] = []
    end
  end
end
