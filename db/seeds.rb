# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#

# #获得所有数据
# GET /api/v1/all_data HTTP/localhost:3000
#
# #获得具体某一项目名称的所有数据
# GET /api/v1/specify_data/:id HTTP/localhost:3000
#
# #获得所有部门及其分类
# GET /api/v1/departments HTTP/localhost:3000
#
# #获得某一部门及其分类
# GET /api/v1/departments/:id  HTTP/localhost:3000
#
# #获得某一部门和其某分类下所有项目的层级和名称
# # [{"id":1,"current_project_name":"one","project_level":"1","last_project_name":null,"department_id":2,"created_at":"2021-12-18T16:30:37.423Z","updated_at":"2021-12-18T16:30:37.423Z"},
# # {"id":2,"current_project_name":"888","project_level":"2","last_project_name":null,"department_id":2,"created_at":"2021-12-18T16:31:39.818Z","updated_at":"2021-12-18T16:31:39.818Z"}]
# GET /api/v1/departments/:id/categories HTTP/localhost:3000
#
# #获得某一部门和其某分类下某一项目的所有层级和名称
# GET /api/v1/departments/:id/categories/:id HTTP/localhost:3000
#
# #获得某一部门和其某分类下某一项目的某一层级和名称下所有项目数据
# GET /api/v1/departments/:id/categories/:id/projects HTTP/localhost:3000
#
# #获得某一部门和其某分类下某一项目的某一层级和名称下某一项目数据
# GET /api/v1/departments/:id/categories/:id/projects/:id HTTP/localhost:3000
#
# #获得某一部门和其某分类下某一项目的某一层级和名称下某一项目数据的季度数据
# GET /api/v1/departments/:id/categories/:id/projects/:id/quarter_tables HTTP/localhost:3000

# #获得所有部门及其分类
# GET /api/v1/departments HTTP/localhost:3000
# return:(id:1-50)
#[{"id":1,"department_name":"department1","category_name":"category1","created_at":"2022-01-12T17:39:03.303Z","updated_at":"2022-01-12T17:39:03.303Z"},
# {"id":2,"department_name":"department2","category_name":"category2","created_at":"2022-01-12T17:39:03.308Z","updated_at":"2022-01-12T17:39:03.308Z"},...]
50.times do |n|
  department = Department.new
  department.department_name = "department#{n + 1}"
  department.category_name = "category#{n + 1}"
  department.save
end

# #获得某一部门和其某分类下所有项目的层级和名称
# GET /api/v1/departments/:id/categories HTTP/localhost:3000
# return(department_id = 1):(categorie_id:1-12)
#[{"id":1,"current_project_name":"current_project1","project_level":"1","last_project_name":"current_project3","department_id":1,"created_at":"2022-01-12T18:04:17.192Z","updated_at":"2022-01-12T18:04:17.617Z"},
# {"id":2,"current_project_name":"current_project2","project_level":"2","last_project_name":"current_project6","department_id":1,"created_at":"2022-01-12T18:04:17.198Z","updated_at":"2022-01-12T18:04:17.663Z"},...]
a = 1
50.times do |n|
  a += 1 if (n) % 12 == 0 && n!=0
  department = Department.find(a)
  category = department.categories.new
  category.current_project_name = "current_project#{n + 1}"
  case (n + 1) % 3
  when 1
    category.project_level = '1'
  when 2
    category.project_level = '2'
  when 3
    category.project_level = '3'
  end
  category.department_id = department.id
  category.save
end

# #获得某一部门和其某分类下某一项目的某一层级和名称下所有项目数据
# GET /api/v1/departments/:id/categories/:id/projects HTTP/localhost:3000
#return(category_id = 1):(project_id:1-3)
# [{"id":1,"current_project_name":"current_project1","project_level":1,"current_year":2020,"current_number":1000,"before_last_year":2019,"before_last_year_number":3000,"last_year_number":2021,"last_year_number_number":6000,"category_id":1,"created_at":"2022-01-12T18:12:09.033Z","updated_at":"2022-01-12T18:12:09.033Z"},
# {"id":2,"current_project_name":"current_project1","project_level":1,"current_year":2020,"current_number":1001,"before_last_year":2019,"before_last_year_number":3001,"last_year_number":2021,"last_year_number_number":6001,"category_id":1,"created_at":"2022-01-12T18:12:09.052Z","updated_at":"2022-01-12T18:12:09.052Z"},
# {"id":3,"current_project_name":"current_project1","project_level":1,"current_year":2020,"current_number":1002,"before_last_year":2019,"before_last_year_number":3002,"last_year_number":2021,"last_year_number_number":6002,"category_id":1,"created_at":"2022-01-12T18:12:09.071Z","updated_at":"2022-01-12T18:12:09.071Z"}]
a = 1
50.times do |n|
  a += 1 if n % 3 == 0 && n!=0
  category = Category.find(a)
  project = category.projects.new
  project.current_project_name = category.current_project_name
  project.project_level = category.project_level.to_i
  if n < 25
    project.before_last_year = 2019
    project.current_year = 2020
    project.last_year_number = 2021
  else
    project.before_last_year = 2020
    project.current_year = 2021
    project.last_year_number = 2022
  end
  project.current_number = 1000 + n
  project.before_last_year_number = 3000 + n
  project.last_year_number_number = 6000 + n
  project.category_id = category.id
  case (n + 1) % 3
  when 1
    category.last_project_name = "current_project#{n + 2}"
  when 2
    category.last_project_name = "current_project#{n + 2}"
  when 3
    category.last_project_name = ''
  end
  project.save
  category.save
end

# #获得某一部门和其某分类下某一项目的某一层级和名称下某一项目数据的季度数据
# GET /api/v1/departments/:id/categories/:id/projects/:id/quarter_tables HTTP/localhost:3000
# return:
# {"id":1,"current_project_name":"current_project1","project_level":1,"current_year":2020,"current_number":1000,"before_last_year":2019,"before_last_year_number":3000,"last_year_number":2021,"last_year_number_number":6000,"category_id":1,"created_at":"2022-01-12T18:12:09.033Z","updated_at":"2022-01-12T18:12:09.033Z"}
50.times do |n|
  project = Project.find(n + 1)
  quarter_table = project.quarter_tables.new
  quarter_table.current_year = project.current_year
  case (n + 1) % 4
  when 1
    quarter_table.first_quarter = "1-#{1 + (n % 3)}"
    quarter_table.second_quarter = ''
    quarter_table.third_quarter = ''
    quarter_table.curruent_month = 1 + (n % 3)
  when 2
    quarter_table.first_quarter = '1-3'
    quarter_table.second_quarter = "1-#{4 + (n % 3)}"
    quarter_table.third_quarter = ''
    quarter_table.curruent_month = 4 + (n % 3)
  when 3
    quarter_table.first_quarter = '1-3'
    quarter_table.second_quarter = '1-6'
    quarter_table.third_quarter = "1-#{7 + (n % 3)}"
    quarter_table.curruent_month = 7 + (n % 3)
  when 0
    quarter_table.first_quarter = '1-3'
    quarter_table.second_quarter = '1-6'
    quarter_table.third_quarter = '1-9'
    quarter_table.curruent_month = 10 + (n % 3)
  end
  quarter_table.project_id = project.id
  quarter_table.save
end

# #事项
# # 获取project_name、current_number、project_level三个字段，project_level为1
# GET /api/v1/all_data HTTP/localhost:3000
#
# #接待量、办理量
# #获取department、level、project、quarter_tables的数据内容,项目由层级从project_level为1到 "last_project_name":null
# GET /api/v1/all_data HTTP/localhost:3000

