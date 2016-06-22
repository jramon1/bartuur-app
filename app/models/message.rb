class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  validates_presence_of :content, :match_id, :user_id

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
