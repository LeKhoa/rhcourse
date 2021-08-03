class Attachment < ApplicationRecord
  belongs_to :resource
  validates_presence_of :link
end