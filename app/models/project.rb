class Project < ApplicationRecord
  belongs_to :category
  has_many :quarter_tables
end
