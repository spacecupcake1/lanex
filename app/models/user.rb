class User < ApplicationRecord
  has_many :bookings, foreign_key: 'user_id'
  has_many :lessons, foreign_key: 'user_id'
  has_many :booked_lessons, through: :bookings, source: :lesson
  has_many :activities

  has_secure_password

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  
  after_create :create_activity
  after_update :update_activity

  def full_name
    "#{first_name} #{last_name}"
  end

  def teacher?
    role == 'teacher'
  end

  def student?
    role == 'student'
  end

  private

  def create_activity
    Activity.create(user: self, trackable: self, action: 'create')
  end

  def update_activity
    Activity.create(user: self, trackable: self, action: 'update')
  end
end