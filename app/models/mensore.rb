class Mensore < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  has_many :mensore_comments
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarkd_users, through: :bookmarks, source: :user
  attachment :image
  
  def bookmarked_by?(user)
      bookmarks.where(user_id: user.id).exists?
  end
  
    def self.search(search)
      return Mensore.all unless search
      Mensore.where(['content LIKE ?', "%#{search}%"])
    end
  
end
