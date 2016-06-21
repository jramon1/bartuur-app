class ConversationsController < ApplicationController

  def index
      @conversations = Conversation.where('sender_id= ? OR recipient_id= ?', current_user.id, current_user.id)
      @users = User.all.reject{ |user| user.id == current_user.id }
      @sender_id = current_user.id

      @conversation = Conversation.new
    end

    def create
      @sender_id = current_user.id
      @recipient_id = User.find(params[:conversation][:recipient_id])

      @conversation = set_or_create_conversation(@sender_id, @recipient_id)
      redirect_to conversation_messages_path(@conversation)
    end

    private
    def conversation_params
      params.require(:conversation).permit(:sender_id, :recipient_id)
    end

    def set_or_create_conversation(sender_id, recipient_id)
      Conversation.between(sender_id, recipient_id).first ||= Conversation.create!(sender_id: sender_id, recipient_id: recipient_id.id)
    end
end
