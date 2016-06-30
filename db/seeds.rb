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
  street: "Nassaukade 307",
  zip_code: "1053LP",
  city: "Amsterdam",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-9/13133237_1164443516901877_3662997524109057160_n.jpg?oh=33ff947dc09e1129091369ba96885d0d&oe=57DD8215",
  friends_count: (100..600).to_a.sample,
  distance_radius: 5
)

mike = User.create!(
  email: "mikehanot@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Michael",
  last_name: "Hanot",
  street: "Nassaukade 307",
  zip_code: "1053LP",
  city: "Amsterdam",
  picture: "https://scontent.xx.fbcdn.net/v/t1.0-9/12794386_10153463337262602_6946293271583260974_n.jpg?oh=110e79e196e1b7c6bf656aa4360f6eb3&oe=57D3D1D3",
  friends_count: (100..600).to_a.sample,
  distance_radius: 10
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
  distance_radius: 15
)

jurjen = User.create!(
  email: "jurjenmunneke@me.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Jurjen",
  last_name: "Munneke",
  street: "Admiraal de Ruijterweg 296-2",
  zip_code: "1055MS",
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


# Mike -- computer

 hp = Product.new(
  name: "computer",
  description: "hp computer 2 years old,  perfect condition.",
  value: 2,
  user: mike
)

["HP.jpg", "hpphotoback.jpg" ].each do |filename|
  photo = Cloudinary::Uploader.upload(Rails.root.join("db/seeds/images/#{filename}"))

  hp.photos << Attachinary::File.new({
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

hp.save!


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
