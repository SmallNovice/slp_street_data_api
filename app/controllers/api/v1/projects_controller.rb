class Api::V1::ProjectsController < ApplicationController
  def index
    @projects = Project.all
    fields =
      @projects.each_with_object([]) do |project, memo|
        memo << Fields.build(project)
      end
    render json: fields
  end

  def show
    @project = Project.find(params[:id])
    field = Fields.build(@project)
    render json: field
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :body)
  end
end
