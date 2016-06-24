class Account::MessagesController < ApplicationController

  def create
    @match = Match.find(params[:match_id])
    @message = Message.new(message_params)
    @message.match = @match
    @message.user = current_user
    if @message.save!
      redirect_to  account_match_path(@match)
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

end
