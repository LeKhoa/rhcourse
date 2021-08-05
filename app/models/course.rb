class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses

  has_many :sections, dependent: :destroy

  validates_presence_of :name

  scope :active, -> { where(active: true) }
end
