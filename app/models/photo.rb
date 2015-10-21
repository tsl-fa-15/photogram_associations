class Photo < ActiveRecord::Base
  validates :source, :caption, :user_id, presence: true
  validates :caption, length: { maximum: 140 }

  def user
    User.find(user_id)
  end

  def comments
    Comment.where(photo_id: id)
  end
end

