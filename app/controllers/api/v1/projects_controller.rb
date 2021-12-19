class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.all
    fields =
      @projects.each_with_object([]) do |project, memo|
        memo << Fields.build(project)
      end
    render json: fields
  end

  def show
    field = Fields.build(@project)

    render json: field
  end

  def create
    @project = Project.new(project_params)
    if @project.save
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

  def find_project
    @project = Project.find(params[:id])
  end
end
