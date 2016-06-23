class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :products, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :appreciations, dependent: :destroy

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
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
    end
  end

  def matches
    Match.joins(:appreciation, :secondary_appreciation).where(
      "appreciations.user_id = :id OR secondary_appreciations_matches.user_id = :id",
      id: id
      )
  end
end
