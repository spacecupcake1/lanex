class Lesson < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :bookings

  scope :filter_by_teaching_language, ->(language) { where(teaching_language: language) if language.present? }
  scope :filter_by_known_language, ->(language) { where(known_language: language) if language.present? }
  scope :filter_by_level, ->(level) { where(level: level) if level.present? }

  validates :teaching_language, presence: true
  validates :known_language, presence: true
  validates :level, presence: true
  validates :available_days, presence: true
  validates :meeting_platform, presence: true

  def title
    "#{known_language}-#{teaching_language}"
  end

end