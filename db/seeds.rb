# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

3.times do
  u = User.new
  u.name = Faker::Name.name
  first_name = u.name.split(" ").first
  u.email = Faker::Internet.email(first_name)
  u.image_url = Faker::Avatar.image(u.name)
  u.password = '12341234'
  u.password_confirmation = '12341234'
  u.save
end

puts "There are #{User.count} users in the database"


Photo.destroy_all

photo_info = [
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Lake_Bondhus_Norway_2862.jpg/1280px-Lake_Bondhus_Norway_2862.jpg",
    :caption => "Lake Bondhus"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Lanzarote_5_Luc_Viatour.jpg/1280px-Lanzarote_5_Luc_Viatour.jpg",
    :caption => "Cueva de los Verdes"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Fire_breathing_2_Luc_Viatour.jpg/1280px-Fire_breathing_2_Luc_Viatour.jpg",
    :caption => "Jaipur"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Ніжний_ранковий_світло.jpg/1280px-Ніжний_ранковий_світло.jpg",
    :caption => "Sviati Hory"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Mostar_Old_Town_Panorama_2007.jpg/1280px-Mostar_Old_Town_Panorama_2007.jpg",
    :caption => "Mostar"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Elakala_Waterfalls_Swirling_Pool_Mossy_Rocks.jpg/1280px-Elakala_Waterfalls_Swirling_Pool_Mossy_Rocks.jpg",
    :caption => "Elakala"
  },
  {
    :source => "http://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Biandintz_eta_zaldiak_-_modified2.jpg/1280px-Biandintz_eta_zaldiak_-_modified2.jpg",
    :caption => "Biandintz"
  }
]

photo_info.each do |photo_hash|
  random_num = rand(User.count)
  random_user = User.offset(random_num).first

  p = Photo.new
  p.source = photo_hash[:source]
  p.caption = photo_hash[:caption]
  p.user_id = random_user.id
  p.save
end

puts "There are now #{Photo.count} photos in the database."

Comment.destroy_all

20.times do
  user_random_num = rand(User.count)
  random_user = User.offset(user_random_num).first

  photo_random_num = rand(Photo.count)
  random_photo = Photo.offset(photo_random_num).first

  c = Comment.new
  c.user_id = random_user.id
  c.photo_id = random_photo.id
  c.contents = Faker::Hacker.say_something_smart
  c.save
end

puts "There are now #{Comment.count} comments in the database."


