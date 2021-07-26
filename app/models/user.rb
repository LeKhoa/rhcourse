class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  store :settings, accessors: [:business_status, :biggest_challenge, :concerns]

  enum budget_type: {
    weekly: 0,
    monthly: 1,
    yearly: 2,
  }

  protected

  def password_required?
    return false if skip_password_validation
    super
  end

  def skip_password_validation
    true
  end
end
