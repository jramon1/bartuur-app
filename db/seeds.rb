puts "Cleaning up database..."

Match.destroy_all
User.destroy_all
Product.destroy_all

##################################################
#
# USERS
#
##################################################

puts "Creating users..."

jesse = User.create!(
  email: "jramon@uvic.ca",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Jesse",
  last_name: "Ramon",
  street: "Johan Huizingalaan 763a",
  zip_code: "1066VH",
  city: "Amsterdam",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-9/13133237_1164443516901877_3662997524109057160_n.jpg?oh=33ff947dc09e1129091369ba96885d0d&oe=57DD8215",
  friends_count: (100..600).to_a.sample,
  distance_radius: 50
)

mike = User.create!(
  email: "mikehanot@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Michael",
  last_name: "Hanot",
  street: "Surinameplein 65",
  zip_code: "1058GH",
  city: "Amsterdam",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-9/12794386_10153463337262602_6946293271583260974_n.jpg?oh=110e79e196e1b7c6bf656aa4360f6eb3&oe=57D3D1D3",
  friends_count: (100..600).to_a.sample,
  distance_radius: 50
)

walter = User.create!(
  email: "walter@vanwoudenberg.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Water",
  last_name: "van Woudeberg",
  street: "Anjerhof 60",
  zip_code: "3434HS",
  city: "Utrecht",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-1/10006110_653789704680687_3666752_n.jpg?oh=a911d5c4efff341ccb05a6a280ebc31b&oe=57C3F054",
  friends_count: (100..600).to_a.sample,
  distance_radius: 50
)

jurjen = User.create!(
  email: "jurjenmunneke@me.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Jurjen",
  last_name: "Munneke",
  street: "Johan Huizingalaan 763a",
  zip_code: "1066VH",
  city: "Amsterdam",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-9/12301502_1008253785884229_2873181151236248682_n.jpg?oh=5c45f0c66aa76dd933f4a7eba4fef69a&oe=57E44838",
  friends_count: (100..600).to_a.sample,
  distance_radius: 50
)

##################################################
#
# PRODUCTS
#
##################################################

puts "Creating products..."


# Mike -- tent

tent = Product.new(
  name: "Elephant tent",
  description: "In great condition. Fun for all.",
  value: 2,
  user: mike
)

["1.JPG"].each do |filename|
  photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/tent/#{filename}"))

  tent.photos << Attachinary::File.new({
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
end

tent.save!


# Mike -- bike

bike = Product.new(
  name: "Altec bike",
  description: "Only used it for a couple of months, while I did a coding bootcamp at Le Wagon.",
  value: 2,
  user: mike
)

["1.JPG", "2.JPG", "3.JPG"].each do |filename|
  photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/bike/#{filename}"))

  bike.photos << Attachinary::File.new({
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
end

bike.save!


# Mike -- harmonica

harmonica = Product.new(
  name: "Hohner Super 64 Harmonica",
  description: "Tried to play this work of art, but never managed.",
  value: 2,
  user: mike
)

["1.JPG", "2.JPG", "3.JPG"].each do |filename|
  photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/harmonica/#{filename}"))

  harmonica.photos << Attachinary::File.new({
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
end

harmonica.save!


# Mike -- playstation

playstation = Product.new(
  name: "Playstation 3",
  description: "Owned it for the past 3 years. Still works perfectly.",
  value: 2,
  user: mike
)

["1.JPG", "2.JPG", "3.JPG"].each do |filename|
  photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/playstation/#{filename}"))

  playstation.photos << Attachinary::File.new({
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
end

playstation.save!


# Mike -- pingpong table

pingpong_table = Product.new(
  name: "PingPong table",
  description: "Had a lot of fun with this table. In perfect condition!",
  value: 2,
  user: mike
)

["1.JPG", "2.JPG", "3.JPG", "4.JPG"].each do |filename|
  photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/pingpong_table/#{filename}"))

  pingpong_table.photos << Attachinary::File.new({
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
end

pingpong_table.save!


# Mike -- carpet

carpet = Product.new(
  name: "Persian carpet",
  description: "Length: 190cm, width: 135cm.",
  value: 2,
  user: mike
)

["1.JPG", "2.JPG"].each do |filename|
  photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/carpet/#{filename}"))

  carpet.photos << Attachinary::File.new({
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
end

carpet.save!


# Mike -- scuba gear

scuba_gear = Product.new(
  name: "Professional scuba gear",
  description: "I've seen sharks through these goggles! Still in great condition.",
  value: 2,
  user: mike
)

["1.JPG", "2.JPG", "3.JPG"].each do |filename|
  photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/scuba_gear/#{filename}"))

  scuba_gear.photos << Attachinary::File.new({
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
end

scuba_gear.save!


# Jurjen -- vinyl

vinyl = Product.new(
  name: "J.J. Cale - the Troubadour",
  description: "Original vinyl press from the 70's.",
  value: 2,
  user: jurjen
)

["1.JPG", "2.JPG", "3.JPG"].each do |filename|
  photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/vinyl/#{filename}"))

  vinyl.photos << Attachinary::File.new({
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
end

vinyl.save!

##################################################
#
# MATCHES
#
##################################################

# puts "Creating Matches..."

# # # Jesse -- likes jurjen bike

# appreciation1 = Appreciation.create!(
#   liked: true,
#   product: bike,
#   user: jesse
# )

# # # Jurjen -- likes jesse sunglasses

# appreciation2 = Appreciation.create!(
#   liked: true,
#   product: sunglasses,
#   user: jurjen
# )

# # Matching

# Match.create!(
#   appreciation: appreciation1,
#   secondary_appreciation: appreciation2,
#   code: SecureRandom.hex(3).upcase
# )
