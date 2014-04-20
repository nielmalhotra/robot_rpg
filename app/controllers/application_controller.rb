class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from Exception do |exception|
    render json: {fail: 'Something bad happened. Try again.'}, status: 500
  end

  helper_method :current_user_session, :current_user

  def root
    if current_user.blank?
      @user_session = UserSession.new
      @user = User.new
    end
    render :nothing => true, :layout => 'application'
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = 'You must be logged in to access this page'
      root
    end
  end

  def require_no_user
    if current_user
      flash[:notice] = 'You must be logged out to access this page'
      root
    end
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
