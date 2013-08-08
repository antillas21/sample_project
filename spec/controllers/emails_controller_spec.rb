require 'spec_helper'

describe EmailsController, type: :controller do

  def stub_sign_in user
    request.env['warden'].stub :authenticate! => user
    controller.stub current_user: user
  end

  before :each do
    @user = FactoryGirl.create :user
    @email = FactoryGirl.create(:email, user: @user)
    stub_sign_in @user
  end


  describe 'GET #index' do
    before :each do
      get :index
    end

    it 'should be success' do
      response.should be_success
    end

    it 'renders the index view' do
      response.should render_template :index
    end
  end

  describe 'GET #edit' do
    before :each do
      get :edit, id: @email.id
    end

    it 'should be success' do
      response.should be_success
    end

    it 'renders the edit view' do
      response.should render_template :edit
    end

    it 'assigns an Email record to the :email variable' do
      assigns(:email).should eq @email
    end
  end

  describe 'PUT #update' do
    context 'valid attributes' do
      before :each do
        put :update, id: @email.id, email: { subject: 'Modified Subject Text' }
      end

      it 'should be success' do
        response.status.should eq 302
      end

      it 'redirect_to emails_path' do
        response.should redirect_to emails_path
      end

      it 'assigns an Email record to the :email variable' do
        assigns(:email).should eq @email
      end

      it 'updates Email attributes' do
        @email.reload
        @email.subject.should eq 'Modified Subject Text'
      end
    end

    context 'invalid/missing attributes' do
      before :each do
        put :update, id: @email.id, email: { subject: nil }
      end

      it 're-renders edit template' do
        response.should render_template :edit
      end

      it 'assigns an Email record to the :email variable' do
        assigns(:email).should eq @email
      end

      it 'does not update Email attributes' do
        @email.reload
        @email.subject.should eq 'FactoryGirl spawned this email'
      end
    end

  end
end
