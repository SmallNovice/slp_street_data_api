class Fields
  def self.build(project)
    {
      'department' => {

      'department_id' => project.category.department.id,
      'department_name' => project.category.department.department_name,
      'current_project_name' => project.category.current_project_name
      },
      'project' => build_project_name(project).merge({}),
      'quarter_tables' => {
        'current_year' => project.quarter_tables
      }
    }
  end

  private

  def self.build_project_name(project)
    level = project.category.project_level
    case level
    when '1'
    {
      'project_name' => project.category.current_project_name
    }
    when '2'
      {
        'project_name' => project.category.last_project_name,
        project.category.last_project_name => project.category.current_project_name
      }
    when '3'
      last_project = Project.find_by(current_project_name: project.category.last_project_name)
      {
        'project_name' => last_project.category.last_project_name,
        last_project.category.last_project_name => last_project.category.current_project_name,
        last_project.category.current_project_name => project.category.current_project_name
      }
    end
  end
end
