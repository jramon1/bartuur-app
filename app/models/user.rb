class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :products, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :appreciations, dependent: :destroy

  validates :distance_radius, inclusion: { in: [5, 10, 15, 20, 25, 50, 100], allow_nil: false }, on: :update

  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?

  def full_address
    @city = self.city
    @street = self.street
    @zip_code = self.zip_code
    return "#{@street} #{@city} #{@zip_code}".strip
  end

  def full_address_changed?
    city_changed? || street_changed? || zip_code_changed?
  end

  def self.find_for_facebook_oauth(auth)
    user = find_by_email(auth.info.email)

    unless user
      user = where(provider: auth.provider, uid: auth.uid).first_or_initialize
    end

    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]  # Fake password for validation
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.picture = auth.info.image
    # user.friends_count = auth.extra.raw_info.friends.summary.total_count
    user.token = auth.credentials.token
    user.token_expiry = Time.at(auth.credentials.expires_at)

    user.save
    return user
  end

  def matches
    Match.joins(:appreciation, :secondary_appreciation).where(
      "appreciations.user_id = :id OR secondary_appreciations_matches.user_id = :id",
      id: id
      )
  end
end
