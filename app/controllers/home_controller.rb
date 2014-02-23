class HomeController < ApplicationController

  def index
    if current_user.blank?
      @user_session = UserSession.new
      @user = User.new
    end
  end
end