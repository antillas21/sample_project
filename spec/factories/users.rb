FactoryGirl.define do
  factory :user do
    sequence( :name ) { |n| "john #{n} doe" }
    sequence( :email ) { |n| "user-#{n}@example.com" }
    password 'password'
  end
end
