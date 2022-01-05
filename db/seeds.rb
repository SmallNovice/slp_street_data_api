# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#

#获得所有数据
GET /api/v1/all_data HTTP/localhost:3000

#获得具体某一项目名称的所有数据
GET /api/v1/specify_data/:id HTTP/localhost:3000

#获得所有部门及其分类
GET /api/v1/departments HTTP/localhost:3000

#获得某一部门及其分类
GET /api/v1/departments/:id  HTTP/localhost:3000

#获得某一部门和其某分类下所有项目的层级和名称
# [{"id":1,"current_project_name":"one","project_level":"1","last_project_name":null,"department_id":2,"created_at":"2021-12-18T16:30:37.423Z","updated_at":"2021-12-18T16:30:37.423Z"},
# {"id":2,"current_project_name":"888","project_level":"2","last_project_name":null,"department_id":2,"created_at":"2021-12-18T16:31:39.818Z","updated_at":"2021-12-18T16:31:39.818Z"}]
GET /api/v1/departments/:id/categories HTTP/localhost:3000

#获得某一部门和其某分类下某一项目的所有层级和名称
GET /api/v1/departments/:id/categories/:id HTTP/localhost:3000

#获得某一部门和其某分类下某一项目的某一层级和名称下所有项目数据
GET /api/v1/departments/:id/categories/:id/projects HTTP/localhost:3000

#获得某一部门和其某分类下某一项目的某一层级和名称下某一项目数据
GET /api/v1/departments/:id/categories/:id/projects/:id HTTP/localhost:3000

#获得某一部门和其某分类下某一项目的某一层级和名称下某一项目数据的季度数据
GET /api/v1/departments/:id/categories/:id/projects/:id/quarter_tables HTTP/localhost:3000

#事项
# 获取project_name、current_number、project_level三个字段，project_level为1
GET /api/v1/all_data HTTP/localhost:3000

#接待量、办理量
#获取department、level、project、quarter_tables的数据内容,项目由层级从project_level为1到 "last_project_name":null
GET /api/v1/all_data HTTP/localhost:3000


