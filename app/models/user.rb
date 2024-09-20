class User < ApplicationRecord
    has_many :bookings, foreign_key: 'student_id'
    has_many :lessons, foreign_key: 'teacher_id'
    has_secure_password
    validates :user_name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }
    def full_name
        "#{first_name} #{last_name}"
    end
end

