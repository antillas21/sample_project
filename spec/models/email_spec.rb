require 'spec_helper'

describe Email do
  describe 'validations' do
    it { should validate_presence_of :from_email }
    it { should validate_presence_of :to_email }
    it { should validate_presence_of :subject }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
