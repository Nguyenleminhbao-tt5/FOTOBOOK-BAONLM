class MessagesController < ApplicationController

    before_action :message_params , only: [:create]

    def index
        @messages = Message.last(10)
    end

    def create
        message = current_user.messages.new(message_params)
        message.save
        Message.new.add_message(current_user)  

    end

    private 

    def message_params
        params.require(:message).permit(:body)
    end
end