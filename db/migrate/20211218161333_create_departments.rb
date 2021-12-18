class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :department_name
      t.string :category_name

      t.timestamps
    end
  end
end
