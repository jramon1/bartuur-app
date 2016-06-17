class Product < ActiveRecord::Base
  belongs_to :user
  has_many :appreciations, dependent: :destroy
  has_attachments :photos, maximum: 5
  has_many :matches, through: :appreciations

  def self.pick_product(user)
    # where()
  end
end
