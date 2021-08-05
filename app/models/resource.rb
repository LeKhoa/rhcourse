class Resource < ApplicationRecord
  belongs_to :section
  has_many :attachments, dependent: :destroy

  accepts_nested_attributes_for :attachments, allow_destroy: true
end
