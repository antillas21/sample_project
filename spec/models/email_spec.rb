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

  describe 'new Email' do
    it 'starts as draft' do
      email = FactoryGirl.create(:email)
      email.state.should eq 'draft'
    end
  end

  context 'transition states' do
    describe '#publish' do
      it 'changes Email.state to published' do
        email = FactoryGirl.create(:email)

        expect{ email.publish }.to change{ email.state }.from('draft').to('published')
      end
    end

    describe '#unpublish' do
      it 'changes Email.state to draft' do
        email = FactoryGirl.create(:email)
        email.publish

        expect{ email.unpublish }.to change{ email.state }.from('published').to('draft')
      end
    end
  end
end
