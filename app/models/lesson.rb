class Lesson < ApplicationRecord
  belongs_to :teacher, class_name: 'User'
  has_many :bookings

  scope :filter_by_teaching_language, ->(language) { where(teaching_language: language) if language.present? }
  scope :filter_by_known_language, ->(language) { where(known_language: language) if language.present? }
  scope :filter_by_level, ->(level) { where(level: level) if level.present? }
end