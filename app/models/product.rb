class Product < ActiveRecord::Base
  belongs_to :user
  has_many :appreciations, dependent: :destroy
  has_attachments :photos, maximum: 5
  has_many :matches, through: :appreciations
end
