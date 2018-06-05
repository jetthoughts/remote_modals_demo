class MessagesController < ApplicationController
  before_action :set_message, only: [:destroy]

  respond_to :html, :json

  def index
    @messages = Message.order(created_at: :desc).limit(21)
  end

  def new
    @message = Message.new
    respond_modal_with @message
  end

  def create
    @message = Message.create(message_params)
    respond_modal_with @message, location: messages_path
  end

  def destroy
    @message.destroy
    redirect_to messages_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:name, :body)
    end
end
