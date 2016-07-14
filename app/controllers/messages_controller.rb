class MessagesController < ApplicationController
  def index
    @messages = Message.all.order("created_at DESC")
  end

  def new
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    # create a new instance of a message, require a message object from params and permit
    # a title and a description. If it saves, redirect to the root otherwise render the new page
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def message_params
      params.require(:message).permit(:title, :description)
    end

end
