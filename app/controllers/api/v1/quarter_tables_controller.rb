class Api::V1::QuarterTablesController < ApplicationController
  before_action :department_to_quarter
  before_action :find_quarter_table, only: [:show, :update, :destroy]

  def index
    @quarter_tables = @project.quarter_tables
    render json: @quarter_tables
  end

  def show
    render json: @quarter_table
  end

  def create
    if @quarter_table = @project.quarter_tables.create(quarter_table_params)
      render json: @quarter_table
    else
      render json: { message: 'unable to create project' }, status: 400
    end
  end

  def update
    if @quarter_table
      @quarter_table.update(quarter_table_params)
      render json: { message: 'quarter_table successfully updated!' }, status: 200
    else
      render json: { message: 'unable to update quarter_table' }, status: 400
    end
  end

  def destroy
    if @quarter_table
      @quarter_table.destroy
      render json: { message: 'quarter_table successfully deleted!' }, status: 200
    else
      render json: { message: 'unable to delete quarter_table' }, status: 400
    end
  end

  private

  def quarter_table_params
    params.permit(:current_year, :first_quarter, :second_quarter, :third_quarter,
                  :curruent_month, :project_id)
  end

  def department_to_quarter
    @project = Department.find(params[:department_id]).categories.find(params[:category_id]).projects.find(params[:project_id])
  end

  def find_quarter_table
    @quarter_table = @project.quarter_tables.find(params[:id])
  end
end

