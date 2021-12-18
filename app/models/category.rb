class Category < ApplicationRecord
  belongs_to :department
  has_many :projects
end
