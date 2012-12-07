class Message < ActiveRecord::Base
  attr_accessible :text, :recipient_id
  
  belongs_to :user
end
