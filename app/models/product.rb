class Product < ActiveRecord::Base
  belongs_to :user
  has_many :appreciations, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :matches, through: :appreciations
end
