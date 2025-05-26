class CategoriesController < ApplicationController

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

  #クイズ開始
  def start
    @category = Category.find(params[:id])
    Rails.logger.debug "カテゴリーID: #{@category}"
    session[:question_ids] = Question.where(category_id: params[:id]).pluck(:id).sample(5)
    session[:current_index] = 0
    session[:correct_count] = 0
    session[:category_id] = @category.id
  end

  private

end
