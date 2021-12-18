class ProjectsController < ApplicationController
  def index
    @project = Project.all

    render json: @project
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
