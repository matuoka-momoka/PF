class Mensore < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def bookmarkd_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
