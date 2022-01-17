class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :current_project_name
      t.integer :project_level
      t.integer :current_year
      t.integer :current_number
      t.integer :before_last_year
      t.integer :before_last_year_number
      t.integer :last_year_number
      t.integer :last_year_number_number
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
