class Book < ApplicationRecord
	belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      where(['title LIKE?', "%#{search}%"])
    else
      all
    end
  end
  validates :title, presence: true
  validates :body, presence: true, length:{maximum: 199}
end
