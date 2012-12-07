class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @message = Message.new
    
    online_user_ids = $redis.smembers("online_user_ids")
    online_user_ids.delete(current_user.id.to_s)
    
    @online_users = User.find(online_user_ids)
  end
end
