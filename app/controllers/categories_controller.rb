class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  # クイズ開始
  def start
   @category = Category.find(params[:id])
  end
end
