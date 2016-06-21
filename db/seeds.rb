
puts "Cleaning up database..."

User.destroy_all
Product.destroy_all

puts "Creating users..."

jesse = User.create!(
  email: "jess@ramon.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Jesse",
  last_name: "Ramon",
  street: "Nassaukade 307",
  zip_code: "1015",
  city: "Amsterdam",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-9/13133237_1164443516901877_3662997524109057160_n.jpg?oh=33ff947dc09e1129091369ba96885d0d&oe=57DD8215",
  friends_count: (15..600).to_a.sample
)

mike = User.create!(
  email: "mike@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Michael",
  last_name: "Hanot",
  street: "Nassaukade 307",
  zip_code: "1015",
  city: "Amsterdam",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-9/12794386_10153463337262602_6946293271583260974_n.jpg?oh=110e79e196e1b7c6bf656aa4360f6eb3&oe=57D3D1D3",
  friends_count: (15..600).to_a.sample
)

puts "Creating products..."

# Jesse's Sunglasses

sunglasses = Product.new(
  name: "Sunglasses",
  description: "Person 714 great condition",
  value: 3,
  user: jesse
)

photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/sunglasses.jpg"))

sunglasses.photos << Attachinary::File.new({
  version:               photo["version"],
  public_id:             photo["public_id"],
  resource_type:         "image",
  attachinariable_type:  "Product",
  scope:                 "photos",
  width:                 photo["width"],
  height:                photo["height"],
  pic_name:              photo["original_filename"],
  format:                "jpg"
})

sunglasses.save!

# Jesse's Rubber Duck

rubber_duck = Product.new(
  name: "Rubber Duck",
  description: "Floats like a dream",
  value: 1,
  user: jesse
)

photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/rubber_duck.jpg"))

rubber_duck.photos << Attachinary::File.new({
  version:               photo["version"],
  public_id:             photo["public_id"],
  resource_type:         "image",
  attachinariable_type:  "Product",
  scope:                 "photos",
  width:                 photo["width"],
  height:                photo["height"],
  pic_name:              photo["original_filename"],
  format:                "jpg"
})

rubber_duck.save!

# Mike's Jacket

jacket = Product.new(
  name: "Armani Jacket",
  description: "Crocodile leather",
  value: 3,
  user: mike
)

photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/jacket.jpg"))

jacket.photos << Attachinary::File.new({
  version:               photo["version"],
  public_id:             photo["public_id"],
  resource_type:         "image",
  attachinariable_type:  "Product",
  scope:                 "photos",
  width:                 photo["width"],
  height:                photo["height"],
  pic_name:              photo["original_filename"],
  format:                "jpg"
})

jacket.save!





# 100.times do
#   : "",
#     name: Faker::Name.title,
#     description: Faker::Lorem.paragraph,
#     delivered: false,
#     value: (1..5).to_a.sample,
#     user_id: (1..100).to_a.sample,
#   )
#   sav: "",
# end
