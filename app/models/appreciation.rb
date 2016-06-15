class Appreciation < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :matches, dependent: :destroy
end
