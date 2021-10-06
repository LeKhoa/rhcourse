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
  has_many :subscriptions

  validates :name, presence: true
  validates :password, confirmation: true

  before_destroy :can_destroy?, prepend: true do
    throw(:abort) if errors.present?
  end

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

  def active_subscriptions
    return [] unless stripe_customer_id.present?
    Stripe::Subscription.list(customer: stripe_customer_id, status: 'active').data
  end

  def sub_status
    if stripe_subscription.nil?
      return if settings.blank?
      return 'virtual_active'
    end
    stripe_subscription.status
  end

  def stripe_subscription
    return nil unless stripe_customer_id.present?
    Stripe::Subscription.list(customer: stripe_customer_id, price: ENV['STRIPE_PLAN'], status: 'all').data.first
  rescue Stripe::InvalidRequestError => e
    nil
  end

  protected

  def password_required?
    # return false if skip_password_validation
    super
  end

  def skip_password_validation
    true
  end

  def asign_course
    Course.first.users << self if Course.first.present?
  end

  def can_destroy?
    return true if !subscriptions.present?
    errors.add(:base, I18n.t('user.validation.has_subscriptions'))
    false
  end
end
