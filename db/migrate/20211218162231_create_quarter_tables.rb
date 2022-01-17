class CreateQuarterTables < ActiveRecord::Migration[6.1]
  def change
    create_table :quarter_tables do |t|
      t.integer :current_year
      t.string :first_quarter
      t.string :second_quarter
      t.string :third_quarter
      t.integer :curruent_month
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
