class Match < ActiveRecord::Base
  belongs_to :appreciation
  belongs_to :secondary_appreciation, class_name: "Appreciation"
  has_many :messages, dependent: :destroy
end
