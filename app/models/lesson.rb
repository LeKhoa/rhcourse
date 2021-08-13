class Lesson < ApplicationRecord
  belongs_to :section

  has_many :user_lessons, dependent: :destroy
  has_many :users, through: :user_lessons

  validates_presence_of :video, :title

  def watched_by?(user)
    users.where(id: user.id).first.present?
  end
end
