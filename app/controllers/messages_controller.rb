class MessagesController < AngularTemplatesController
  before_filter :require_user

  def index
    render json: current_user.messages_received
    current_user.read_all_messages!
  end

  def create
    Message.create do |msg|
      msg.to = User.find_by_name params[:to]
      msg.from = current_user
      msg.subject = params[:subject]
      msg.body = params[:body]
    end
    render json: {success: 'Message Sent'}
  end

  def unread_count
    render json: {unread_count: current_user.try(:messages_received).try(:unread).count}
  end

  def destroy
    current_user.messages_received.find(params[:id]).destroy
    render json: {}
  end
end
