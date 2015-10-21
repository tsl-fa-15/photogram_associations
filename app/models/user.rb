class User < ActiveRecord::Base
  def photos
    Photo.where(user_id: id)
  end
end
