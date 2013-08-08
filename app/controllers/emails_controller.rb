class EmailsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :retrieve_email, only: [:edit, :update]

  def index
    @emails = current_user.emails
  end

  def edit; end

  def update
    if @email.update_attributes email_params
      redirect_to emails_path, notice: 'Your changes have been saved.'
    else
      render :edit
    end
  end

  private
  def email_params
    params.require(:email).permit(
      :from_name, :from_email, :to_email, :subject, :text_body, :html_body
    )
  end

  def retrieve_email
    @email = current_user.emails.find params[:id]
  end
end
