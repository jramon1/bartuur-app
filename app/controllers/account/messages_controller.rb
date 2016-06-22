class Account::MessagesController < ApplicationController
  before_action :set_conversation, only:[:show]

  def index
    @messages = @matches.messages.all
    update_read_status unless @messages.empty?
    @message = @match.message.new
    @user = current_user
  end

  def new
    @message = Message.new(message_params)
  end

  def create
    @message.match_id = @match.id
    @message.user_id = current_user.id
    if @message.save!
      redirect_to account_match_message_path(@match)
    end
  end

  def show
  end


  private
  def message_params
    params.require(:message).permit(:content, :user_id)
  end

  def set_conversation
    @conversation = Match.find(params[:match_id])
  end

  def update_read_status
    @messages.last.read = true if @messages.last.user_id != current_user.id
  end
end
