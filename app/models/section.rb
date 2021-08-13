class Section < ApplicationRecord
  belongs_to :course

  has_many :lessons, dependent: :destroy
  has_many :resources, dependent: :destroy
  has_many :notes, dependent: :destroy

  validates_presence_of :name

  scope :active, -> { where(active: true) }
end
