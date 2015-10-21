class Comment < ActiveRecord::Base
  def user
    User.find(user_id)
  end

  def photo
    Photo.find(photo_id)
  end
end
