class UsersController < ApplicationController
  before_filter :require_no_user, only: [:create]

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Account registered!'
      redirect_to :root
    else
      flash[:errors] = @user.errors.full_messages
      flash[:notice] = 'There was a problem creating your account :('
      redirect_to :back
    end
  end
end