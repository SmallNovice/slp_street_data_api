class Api::V1::ProjectsController < ApplicationController
  before_action :department_to_project, only: [:index, :show,:create, :update, :destroy]
  before_action :find_project, only: [:show, :update, :destroy]

  def all_data
    projects = Project.all
    fields =
      projects.each_with_object([]) do |project, memo|
        memo << Fields.build(project)
      end
    render json: fields
  end

  def specify_data
    project = Project.find(params[:id])
    field = Fields.build(project)

    render json: field
  end

  def index
    @projects = @category.projects

    render json: @projects
  end

  def show
    render json: @project
  end

  def create
    if @project = @category.projects.create(project_params)
      render json: @project
    else
      render json: { message: 'unable to create project' }, status: 400
    end
  end

  def update
    if @project
      @project.update(project_params)
      render json: { message: 'project successfully updated!' }, status: 200
    else
      render json: { message: 'unable to update project' }, status: 400
    end
  end

  def destroy
    if @project
      @project.destroy
      render json: { message: 'project successfully deleted!' }, status: 200
    else
      render json: { message: 'unable to delete project' }, status: 400
    end
  end

  private

  def project_params
    params.permit(:current_project_name, :project_level, :current_year, :current_number,
                  :before_last_year, :before_last_year_number, :last_year_number, :last_year_number_number,
                  :category_id)
  end

  def department_to_project
    @category = Department.find(params[:department_id]).categories.find(params[:category_id])
  end

  def find_project
    @project = @category.projects.find(params[:id])
  end
end
