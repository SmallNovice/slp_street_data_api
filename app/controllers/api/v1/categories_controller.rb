class Api::V1::CategoriesController < ApplicationController
  before_action :department_to_category
  before_action :find_category, only: [:show, :update, :destroy]

  def index
    @categories = @department.categories
    render json: @categories
  end

  def show
    render json: @category
  end

  def create
    if @category = @department.categories.create(category_params)
      render json: @category
    else
      render json: { message: 'unable to create category' }, status: 400
    end
  end

  def update
    if @category
      @category.update(category_params)
      render json: { message: 'category successfully updated!' }, status: 200
    else
      render json: { message: 'unable to update category' }, status: 400
    end
  end

  def destroy
    if @category
      @category.destroy
      render json: { message: 'category successfully deleted!' }, status: 200
    else
      render json: { message: 'unable to delete category' }, status: 400
    end
  end

  private

  def category_params
    params.permit(:current_project_name, :category_level, :last_project_name, :department_id)
  end

  def department_to_category
    @department = Department.find(params[:department_id])
  end

  def find_category
    @category = @department.categories.find(params[:id])
  end
end
