class Lesson < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :bookings, dependent: :destroy
  has_many :students, through: :bookings, source: :user
  after_create :create_activity
  after_update :update_activity
  after_destroy :destroy_activity

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

  private

  def create_activity
    Activity.create(user: self.user, trackable: self, action: 'create')
  end

  def update_activity
    Activity.create(user: self.user, trackable: self, action: 'update')
  end

  def destroy_activity
    Activity.create(user: self.user, trackable: self, action: 'destroy')
  end
end