class Match < ActiveRecord::Base
  belongs_to :appreciation
  belongs_to :secondary_appreciation, class_name: "Appreciation"
  has_one :conversation
end
