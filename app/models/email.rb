class Email < ActiveRecord::Base
  belongs_to :user

  # validations
  validates :to_email, presence: true
  validates :from_email, presence: true
  validates :subject, presence: true
end
