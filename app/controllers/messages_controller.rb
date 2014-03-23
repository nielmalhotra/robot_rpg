class MessagesController < AngularViewsController
  before_filter :require_user

  def index
    messages = []
    current_user.messages_received.each do |m|
      messages << {
          read: m.read,
          from: m.from.name,
          subject: m.subject,
          body: m.body
      }
      m.read!
    end
    render json: messages.to_json
  end

  def create
    Message.create do |msg|
      msg.to = User.find_by_name params[:to]
      msg.from = current_user
      msg.subject = params[:subject]
      msg.body = params[:body]
    end
    render json: {success: 'Yay'}.to_json
  end

  def unread_count
    render json: {unread_count: current_user.try(:messages_received).try(:unread).count}.to_json
  end

end
