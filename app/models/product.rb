class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :value, presence: true
  validates :photos, presence: true

  belongs_to :user
  has_many :appreciations, dependent: :destroy
  has_attachments :photos, maximum: 5, accept: [:jpg, :png]
  has_many :matches, through: :appreciations

  def self.pick_product(user)
    # where()
  end
end
