class Fields
  def self.build(project)
    {
      'department' => {
        'department_id' => project.category.department.id,
        'department_name' => project.category.department.department_name
      },
      'project' => build_project_name(project).merge(other_project_hash(project)),
      'quarter_tables' => project.quarter_tables
    }
  end

  private

  def self.build_project_name(project)
    level = project.category.project_level
    case level
    when '1'
      {
        'current_project_name' => project.current_project_name,
        'project_name' => project.category.current_project_name
      }
    when '2'
      {
        'current_project_name' => project.current_project_name,
        'project_name' => project.category.last_project_name,
        project.category.last_project_name => project.category.current_project_name
      }
    when '3'
      last_project = Project.find_by(current_project_name: project.category.last_project_name)
      {
        'current_project_name' => project.current_project_name,
        'project_name' => last_project.category.last_project_name,
        last_project.category.last_project_name => last_project.category.current_project_name,
        last_project.category.current_project_name => project.category.current_project_name
      }
    end
  end

  def self.other_project_hash(project)
    {
      'current_year' => project.current_year,
      'current_number' => project.current_number,
      'before_last_year' => project.before_last_year,
      'before_last_year_number' => project.before_last_year_number,
      'last_year_number' => project.last_year_number,
      'last_year_number_number' => project.last_year_number_number,
      'category_id' => project.category_id
    }
  end
end
