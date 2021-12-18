class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :current_project_name
      t.string :project_level
      t.string :last_project_name
      t.belongs_to :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
