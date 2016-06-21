
puts "Cleaning up database..."

User.destroy_all
Product.destroy_all

puts "Creating users..."

jesse = User.create!(
  email: "jesse@ramon.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Jesse",
  last_name: "Ramon",
  street: "Nassaukade 307",
  zip_code: "1053LP",
  city: "Amsterdam",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-9/13133237_1164443516901877_3662997524109057160_n.jpg?oh=33ff947dc09e1129091369ba96885d0d&oe=57DD8215",
  friends_count: (100..600).to_a.sample
)

mike = User.create!(
  email: "mike@hanot.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Michael",
  last_name: "Hanot",
  street: "Nassaukade 307",
  zip_code: "1053LP",
  city: "Amsterdam",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-9/12794386_10153463337262602_6946293271583260974_n.jpg?oh=110e79e196e1b7c6bf656aa4360f6eb3&oe=57D3D1D3",
  friends_count: (100..600).to_a.sample
)

walter = User.create!(
  email: "walter@vanwoudenberg.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Water",
  last_name: "van Woudeberg",
  street: "Johan Huizingalaan 763A",
  zip_code: "1066VH",
  city: "Amsterdam",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-1/10006110_653789704680687_3666752_n.jpg?oh=a911d5c4efff341ccb05a6a280ebc31b&oe=57C3F054",
  friends_count: (100..600).to_a.sample
)

jurjen = User.create!(
  email: "jurjen@munneke.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Jurjen",
  last_name: "Munneke",
  street: "Admiraal de Ruijterweg 296-2",
  zip_code: "1055MS",
  city: "Amsterdam",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-9/12301502_1008253785884229_2873181151236248682_n.jpg?oh=5c45f0c66aa76dd933f4a7eba4fef69a&oe=57E44838",
  friends_count: (100..600).to_a.sample
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

# Jurjen's Bike

bike = Product.new(
  name: "Bike",
  description: "Old 90's quality. Always protected against the weather in my little barn.",
  value: 4,
  user: jurjen
)

photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/bike.jpg"))

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

bike.save!

# Jurjen's iPhone

iphone = Product.new(
  name: "iPhone 5",
  description: "Some little scratches, but works perfectly!",
  value: 5,
  user: jurjen
)

photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/bike.jpg"))

iphone.photos << Attachinary::File.new({
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

iphone.save!

# Jurjen's closet

closet = Product.new(
  name: "Vintage closet",
  description: "Swedish vintage design, from the 70ties",
  value: 5,
  user: jurjen
)

photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/closet.jpg"))

closet.photos << Attachinary::File.new({
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

closet.save!

# Jurjen's guitar

guitar = Product.new(
  name: "Acoustic guitar",
  description: "A California (Aria) dreadnought. State: as good as new.",
  value: 4,
  user: jurjen
)

photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/guitar.jpg"))

guitar.photos << Attachinary::File.new({
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

guitar.save!
