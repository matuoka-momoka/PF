class MensoreComment < ApplicationRecord
  belongs_to :user
  belongs_to :mensore

  validates :comment, presence: true
end
