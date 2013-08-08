require 'spec_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'relationships' do
    it { should have_many :emails }
  end

  describe 'has_secure_password' do
    let(:user) { User.new( name: 'John Doe', email: 'john@example.com' ) }

    it 'validates presence of password on create' do
      user.should_not be_valid
      user.errors.messages.should include( {password_digest: ["can't be blank"]} )
    end

    it 'validates password and password confirmation match' do
      user.password = 'password'
      user.password_confirmation = 'donotmatch'
      user.should_not be_valid
      user.errors.messages.should include({ password: ["doesn't match confirmation"] })
    end
  end
end
