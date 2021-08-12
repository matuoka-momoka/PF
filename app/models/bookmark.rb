class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :mensore
  validates_uniqueness_of :mensore_id, scope: :user_id
end
