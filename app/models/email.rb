class Email < ActiveRecord::Base
  belongs_to :user

  # validations
  validates :to_email, presence: true
  validates :to_email, email: true
  validates :from_email, presence: true
  validates :from_email, email: true
  validates :subject, presence: true

  state_machine initial: :draft do
    event :publish do
      transition :draft => :published
    end

    event :unpublish do
      transition :published => :draft
    end
  end

  before_validation on: :create do |email|
    email.send( :initialize_state_machines, dynamic: :force )
  end
end
