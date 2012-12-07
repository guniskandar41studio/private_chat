class MessagesController < InheritedResources::Base
  before_filter :authenticate_user!
  protect_from_forgery :except => :create 
  
  def create
    @message = Message.new(params[:message])
    @message.user_id = current_user.id
    @message.save
    
    @listeners = User.find([@message.user_id, @message.recipient_id].sort)
    @box_id = "chat_box_#{@listeners.map(&:id).join('-')}";
  end
end
