class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user!
    redirect_to login_path, notice: 'Please login to your account.' \
      unless current_user
  end

  helper_method :authenticate_user!

  def current_user
    env['warden'].user
  end

  helper_method :current_user
end
