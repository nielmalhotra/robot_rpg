class MessagesController < AngularTemplatesController
  before_filter :require_user

  def index
    render json: current_user.messages_received
    current_user.read_all_messages!
  end

  def create
    m = Message.create do |msg|
      msg.to = User.find_by_name params[:to]
      msg.from = current_user
      msg.subject = params[:subject]
      msg.body = params[:body]
    end
    if m.valid?
      render json: {success: 'Message Sent'}
    else
      render json: {fail: 'Message Not Sent. Do it better.'}, status: 400
    end
  end

  def unread_count
    render json: {unread_count: current_user.try(:messages_received).try(:unread).count}
  end

  def destroy
    current_user.messages_received.find(params[:id]).destroy
    render json: {success: 'Message Deleted'}
  end
end
