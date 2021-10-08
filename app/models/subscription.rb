class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :course

  include AASM
  aasm column: :status do
    state :active, initial: true
    state :canceled

    event :cancel do
      transitions from: :active, to: :canceled
    end
  end
end
