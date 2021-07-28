class Lesson < ApplicationRecord
  belongs_to :course, optional: true

  has_many :user_lessons, dependent: :destroy
  has_many :users, through: :user_lessons

  def watched_by?(user)
    users.where(id: user.id).first.present?
  end
end
