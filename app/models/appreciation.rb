class Appreciation < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :matches, dependent: :destroy
  validates :liked, inclusion: { in: [true, false]  }
  validates :product_id, presence: true
  validates :user_id, presence: true
end
