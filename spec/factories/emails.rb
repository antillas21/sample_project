FactoryGirl.define do
  factory :email do
    from_email 'sender@example.com'
    to_email 'recipient@example.com'
    subject 'FactoryGirl spawned this email'
    user { FactoryGirl.create :user }
  end
end
