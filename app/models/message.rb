class Message < ApplicationRecord
  

    belongs_to :user


    def add_message(current_user)
        broadcast_replace_to :messenger, target: 'list_message', partial: 'components/list_message', locals: {list_message: Message.last(10),current_user: current_user}
    end
end