class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if env['warden'].authenticate( scope: :user)
      redirect_to emails_path, notice: 'You are now logged in.'
    end
  end
end
