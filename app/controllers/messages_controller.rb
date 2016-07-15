class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order("created_at DESC")
  end

  def new
    @message = current_user.messages.build
  end

  def show
  end

  def create
    # create a new instance of a message, require a message object from params and permit
    # a title and a description. If it saves, redirect to the root otherwise render the new page
    @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to message_path
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path
  end

  private
    def message_params
      params.require(:message).permit(:title, :description)
    end

    def find_message
      @message = Message.find(params[:id])
    end
end
