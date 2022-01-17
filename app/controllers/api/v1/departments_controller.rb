class Api::V1::DepartmentsController < ApplicationController
  before_action :find_department, only: [:show, :update, :destroy]

  def index
    @departments = Department.all
    render json: @departments
  end

  def show
    render json: @department
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      render json: @department
    else
      render json: { message: 'unable to create department' }, status: 400
    end
  end

  def update
    if @department
      @department.update(department_params)
      render json: { message: 'department successfully updated!' }, status: 200
    else
      render json: { message: 'unable to update department' }, status: 400
    end
  end

  def destroy
    if @department
      @department.destroy
      render json: { message: 'department successfully deleted!' }, status: 200
    else
      render json: { message: 'unable to delete department' }, status: 400
    end
  end

  private

  def department_params
    params.permit(:department_name, :category_name)
  end

  def find_department
    @department = Department.find(params[:id])
  end
end
