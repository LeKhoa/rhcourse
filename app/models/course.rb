class Course < ApplicationRecord
  has_many :lessons

  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses

  has_many :resources, dependent: :destroy

  validates_presence_of :name
end
