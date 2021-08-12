class Mensore < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  has_many :mensore_comments
  has_many :bookmarks
  attachment :image
  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
  
  def self.search(search)
      return Mensore.all unless search
      Mensore.where(['content LIKE ?', "%#{search}%"])
  end

  def self.search(search,word)
    if search == "forward_match"
      @mensore = Mesnore.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
     @mensore = Mensore.where("name LIKE?","%#{word}")
    elsif search == "perfect_match"
      @mensore = Mesnore.where(title: "#{word}")
    elsif search == "partial_match"
      @mensore = Mensoew.where("name LIKE?","%#{word}%")
    else
     @mensore = Mensore.all
    end
  end

end
