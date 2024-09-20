class User < ApplicationRecord
    has_many :bookings, foreign_key: 'student_id'
    has_many :lessons, foreign_key: 'teacher_id'
end

