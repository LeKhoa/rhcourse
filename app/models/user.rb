class User < ApplicationRecord

  include ImageUploader::Attachment(:image)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notes, dependent: :destroy

  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses

  has_many :user_lessons, dependent: :destroy
  has_many :watched_lessons, through: :user_lessons, source: :lesson

  validates :password, confirmation: true

  # TBD: for testing purpose, assign user to first course after signed_up

  after_create :asign_course

  store :settings, accessors: [:business_status, :challenges, :concerns, :criterias]

  enum budget_type: {
    '$200-$500' => 1,
    '$500-$2,000'=> 2,
    '$2,000-$5,000'=> 3,
    '$5,000-$10,000' => 4,
    '$10,000+' => 5
  }

  def watched?(lesson)
    watched_lessons.where(id: lesson.id).first.present?
  end

  def watch!(lesson)
    watched_lessons << lesson unless watched?(lesson)
  end

  def has_password
    encrypted_password.present?
  end

  protected

  def password_required?
    return false if skip_password_validation
    super
  end

  def skip_password_validation
    true
  end

  def asign_course
    Course.first.users << self if Course.first.present?
  end
end
