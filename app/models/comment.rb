class Comment < ActiveRecord::Base
  validates :user_id, :photo_id, presence: true

  def user
    User.find(user_id)
  end

  def photo
    Photo.find(photo_id)
  end
end
