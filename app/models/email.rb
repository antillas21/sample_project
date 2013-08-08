class Email < ActiveRecord::Base
  belongs_to :user

  # validations
  validates :to_email, presence: true
  validates :to_email, email: true
  validates :from_email, presence: true
  validates :from_email, email: true
  validates :subject, presence: true
end
