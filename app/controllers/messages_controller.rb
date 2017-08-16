class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    @current_user = current_user
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    if @messages.last
      if @messages.last.user_id != current_user.id
       @messages.last.read = true
      end
    end

    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      #メッセージの投稿に失敗した場合
      redirect_to conversation_messages_path(@conversation), notice: "メッセージ投稿に失敗しました。"
    end
   #存在しない場合はデフォルトである、create.html.erbを探そうとする
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end
