class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(category_id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      redirect_to new_category_path
    end
  end

  def edit
    @category = Category.find(category_id)
  end

  def update
    @category = Category.find(category_id)
    @category.update_attributes(category_params)
    redirect_to categories_path
  end

  def destroy
    category = Category.find(category_id)
    category.delete
    redirect_to categories_path 
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def category_id
    params[:id]
  end
end
