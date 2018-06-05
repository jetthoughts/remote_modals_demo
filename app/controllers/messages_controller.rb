class MessagesController < ApplicationController
  before_action :set_message, only: [:destroy]

  def index
    @messages = Message.order(created_at: :desc).limit(21)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to messages_url, notice: 'Message was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
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
