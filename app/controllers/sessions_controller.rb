class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if env['warden'].authenticate
      flash[:notice] = 'You are now logged in.'
      redirect_to emails_path
    else
      @user = User.new
      flash[:error] = 'Invalid email or password.'
      render :new
    end
  end

  def destroy
    env['warden'].logout
    flash[:notice] = 'You logged out successfully.'
    redirect_to root_path
  end
end
