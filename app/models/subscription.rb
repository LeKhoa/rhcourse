class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :course

  include AASM
  aasm column: :status do
    state :active, initial: true
    state :cancelled

    event :cancel do
      transitions from: :active, to: :cancelled
    end
  end
end
