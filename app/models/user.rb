class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notes

  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses

  has_many :user_lessons, dependent: :destroy
  has_many :watched_lessons, through: :user_lessons, source: :lesson

  store :settings, accessors: [:business_status, :biggest_challenge, :concerns]

  enum budget_type: {
    weekly: 0,
    monthly: 1,
    yearly: 2,
  }

  def watched?(lesson)
    watched_lessons.where(id: lesson.id).first.present?
  end

  def watch!(lesson)
    watched_lessons << lesson unless watched?(lesson)
  end

  protected

  def password_required?
    return false if skip_password_validation
    super
  end

  def skip_password_validation
    true
  end
end
